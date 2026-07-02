local git_worktree = require "git-worktree"
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local job = require('plenary.job')

require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',  -- or 'vertical', 'flex', etc.
    layout_config = {
      width = 0.99,
      height = 0.99,
      horizontal = {
        preview_width = 0.65,
      },
    },
    wrap_results = true,
  },
}

local function file_exists(filename)
  local file = io.open(filename, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

local function directory_exists(path)
  return vim.fn.isdirectory(path) == 1
end

local function in_apply()
  if tostring(vim.fn.expand("%:p:h:h:t")) == 'apply-for-teacher-training' then
    return true
  elseif tostring(vim.fn.expand("%:p:h:h:h:t")) == 'apply-for-teacher-training' then
    return true
  else
    return false
  end
end

telescope.load_extension("git_worktree")

local function in_obsidian_vault()
  if tostring(vim.fn.expand("%:p:h:t")) == 'knowledge_grave' then
    return true
  else
    return false
  end
end


-- Then override for vault buffers
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if in_obsidian_vault() then
      vim.keymap.set("n", "<C-p>", "<cmd>ObsidianSearch<cr>", {
        buffer = true, desc = "Toggle Obsidian search" })
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args)
      vim.wo.wrap = true
  end,
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
-- vim help menu
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

vim.keymap.set("n", "<leader>gw", telescope.extensions.git_worktree.git_worktrees, {})
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
vim.keymap.set("n", "<leader>gm", telescope.extensions.git_worktree.create_git_worktree, {})

git_worktree.on_tree_change(function(op, metadata)
  if op == git_worktree.Operations.Switch then
    if in_apply() then
      if directory_exists("tmp/pids") == false then
        os.execute("mkdir tmp/pids")
      end
      os.execute("chmod +x bin/dev")
    end

    local files = {'.env', '.env.local'}
    for _, env_file in ipairs(files) do
      local nested_path = '../../main/' .. env_file

      if file_exists(nested_path) then
        job:new({
          command = 'cp',
          args = { nested_path, env_file }
        }):start()
      end

      local path = '../main/' .. env_file
      if file_exists(path) then
        job:new({
          command = 'cp',
          args = { path, env_file }
        }):start()
      end
    end

    if file_exists('../main/Caddyfile') == true then
      job:new({
        command = 'cp',
        args = { '../main/Caddyfile', 'Caddyfile' }
      }):start()
    end

    if file_exists('/home/catalin/work/.solargraph.yml') == true then
      job:new({
        command = 'cp',
        args = { '/home/catalin/work/.solargraph.yml', '.solargraph.yml' }
      }):start()
    end

    if file_exists('../../main/Caddyfile') == true then
      job:new({
        command = 'cp',
        args = { '../../main/Caddyfile', 'Caddyfile' }
      }):start()
    end
  end
end)
