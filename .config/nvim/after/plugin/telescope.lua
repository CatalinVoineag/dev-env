local git_worktree = require "git-worktree"
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local job = require('plenary.job')
local lfs = require("lfs")

require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',  -- or 'vertical', 'flex', etc.
    layout_config = {
      width = 0.99,
      height = 0.99,
      horizontal = {
        preview_width = 0.65
      },
    },
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
  local dir = lfs.attributes(path, "mode") == "directory"
  if dir then
    return true
  else
    return false
  end
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

telescope.load_extension = git_worktree

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

--git_worktree.on_tree_change(function(op, metadata)
--  if op == git_worktree.Operations.Switch then
--    --jpause("debug time!")
--    --print("create BRANCH")
--    --file.copy(src, dest)
--  end
--end)


-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

git_worktree.on_tree_change(function(op, metadata)
  --print('op', git_worktree.Operations.Create)

  if op == git_worktree.Operations.Switch then
  --if op == git_worktree.Operations.Create then

--    print('bin/setup')
--    job:new({
--      command = 'bin/setup'
--    }):start()

---- Check if the .env files is 2 directories back as well
--    print('copying .env')
--    job:new({
--      command = 'cp',
--      args = { '../../main/.env', '.env' }
--    }):start()
--
    if in_apply() then
      if directory_exists("tmp/pids") == false then
        os.execute("mkdir tmp/pids")
      end
      os.execute("chmod +x bin/dev")
    end

    if file_exists('.env') == false then
      if file_exists('../../main/.env') == true then
        job:new({
          command = 'cp',
          args = { '../../main/.env', '.env' }
        }):start()
      end

      if file_exists('../main/.env') == true then
        job:new({
          command = 'cp',
          args = { '../main/.env', '.env' }
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

