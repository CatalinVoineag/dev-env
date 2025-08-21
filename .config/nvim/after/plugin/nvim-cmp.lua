vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

local cmp = require "cmp"
-- prettier icons
local lspkind = require "lspkind"
lspkind.init {}

--require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  },
}

cmp.setup.filetype({"sql"}, {
  sources = {
    { name = "vim-dadbod-completion"},
    { name = "buffer"}
  }
})

local function file_exists_in_root(filename)
  local root = vim.fn.getcwd()
  local path = root .. "/" .. filename
  return vim.fn.filereadable(path) == 1
end

if file_exists_in_root('dragoncmp') then
  cmp.setup.filetype({"ruby"}, {
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
      { name = "my_custom"},
    }
  })
end

-- Require your custom DragonRuby docs source and initialize it.

--local dragonruby_source = require("cmp_dragonruby_docs").new()
--
--cmp.setup.filetype("ruby", {
--  sources = {
--    { name = "dragonruby_docs", source = dragonruby_source },
--    --{ name = "nvim_lsp" },
--    --{ name = "buffer" },
--  },
--})
--
local items = require("dragonruby_completions")

cmp.register_source("my_custom", {
  complete = function(_, _, callback)
    callback({ items = items, isIncomplete = false})
  end,
})

local ls = require "luasnip"
ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  override_builtin = true,
}

require("luasnip.session.snippet_collection").clear_snippets "eruby"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("eruby", {
  s("el", fmt("<%= {} %> {}", { i(1), i(0) })),
  s("ei", fmt("<% if {} do %>\n\t{}\n<% end %>{}", { i(1), i(2), i(0) })),
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
