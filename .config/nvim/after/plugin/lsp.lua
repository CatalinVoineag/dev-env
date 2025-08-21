vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.codelens.refresh()<cr>', opts)

    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set("n", "<leader>vd", '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'cd', '<cmd>CodeLensRun<cr>', opts)

  end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'gopls', 'htmx', 'pyright'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,
}})


local function add_ruby_deps_command(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
    local params = vim.lsp.util.make_text_document_params()
    local showAll = opts.args == "all"

    client.request("rubyLsp/workspace/dependencies", params, function(error, result)
      if error then
        print("Error showing deps: " .. error)
        return
      end

      local qf_list = {}
      for _, item in ipairs(result) do
        if showAll or item.dependency then
          table.insert(qf_list, {
            text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
            filename = item.path
          })
        end
      end

      vim.fn.setqflist(qf_list)
      vim.cmd('copen')
    end, bufnr)
  end,
  {nargs = "?", complete = function() return {"all"} end})
end

function getTableKeys(tab)
  local keyset = {}
  for k,v in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

local function add_ruby_code_lens_command(client, bufnr)
  -- 1. Trigger CodeLens refresh
  vim.api.nvim_buf_create_user_command(bufnr, "CodeLens", function()
    vim.lsp.codelens.refresh()
  end, {})

  -- 2. Process selected CodeLens and run it
  vim.api.nvim_buf_create_user_command(bufnr, "CodeLensRun", function()
    local lenses = vim.lsp.codelens.get(bufnr)

    if not lenses or vim.tbl_isempty(lenses) then
      print("No CodeLens available")
      return
    end

    local line = vim.api.nvim_win_get_cursor(0)[1]

    for _, lens in ipairs(lenses) do
      if lens.command and lens.command.command == "rubyLsp.openFile" and lens.range.start.line <= line and line <= lens.range['end'].line then
        fname = vim.uri_to_fname(tostring(lens.command.arguments[1][1]))
        vim.cmd.edit(fname)
      else
        print 'No file found'
      end
    end
  end, {})
end

require("lspconfig").ruby_lsp.setup({
  capabilities = capabilities,
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = true,
      },
    },
  },
  on_attach = function(client, buffer)
    add_ruby_deps_command(client, buffer)
    add_ruby_code_lens_command(client, buffer)
    vim.cmd(":CodeLens")
  end,
})

local function education_lsp_commands(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "", {
    callback = function()

      if client then
        client.request("textDocument/definition", vim.lsp.util.make_position_params(), function(err, result, ctx, config)
          if not err and result and not vim.tbl_isempty(result) then
            vim.lsp.util.jump_to_location(result, config or {})
          else
            print("Definition not found.")
          end
        end)
      end
    end,
    desc = "Go to definition with prioritized LSP",
  })
end

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Neovim uses LuaJIT
      },
      diagnostics = {
        globals = { 'vim' }, -- Recognize 'vim' as a global variable
      },
      workspace = {
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua',
        },
        checkThirdParty = false, -- Avoid unwanted popups
      },
      telemetry = { enable = false },
    },
  },
}

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.educationlsp then
  lsp_configurations.educationlsp = {
    default_config = {
      name = "educationlsp",
      cmd = { "ruby", "/home/catalin/play/rpc/ruby.rb" },
      filetypes = {"ruby", "eruby"},
      root_dir = require('lspconfig.util').root_pattern('.git')
    }
  }
end

-- require('lspconfig').educationlsp.setup({
--   on_attach = function(client, bufnr)
--     education_lsp_commands(client, bufnr)
--   end,
-- })
