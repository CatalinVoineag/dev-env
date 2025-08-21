require("catalin.go_to_test")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)

-- move highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move line below onto current line
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor centered when navigating up and down by half of page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep cursor centered when searching 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remember the yank after you pasted it over text
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")
-- Find and replace the current word in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Reload nvim config
vim.keymap.set("n", "<leader><CR>", ":so /home/catalin/.config/dotfiles/nvim/init.lua<CR>")

-- Collapse text
vim.keymap.set("n", "<end>", "za")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Make current file executable
vim.keymap.set("n", "<leader>e", ":!chmod +x %")

-- tmux sessioniser
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww /home/catalin/.config/dotfiles/tmux-sessioniser<CR>")

-- Go to notes
function GoToNotes()
  vim.cmd.edit('~/knowledge_grave/index.md')
end

vim.keymap.set("n", "<leader>ww", function()
  GoToNotes()
end, {noremap = true})

-- go to test file
vim.keymap.set("n", "<leader>tv", function()
  Go_to_test()
end, {noremap = true})

-- jump to beginning and end of def ruby
vim.keymap.set("n", "[f", "?^\\s*def<CR>")
vim.keymap.set("n", "]f", "/end<CR>")

-- copy current file path/name
vim.keymap.set("n", "<leader>f", ":let @+ = expand('%')<CR>") -- path to file
vim.keymap.set("n", "<leader>F", ":let @+ = expand('%:t')<CR>") -- file name

-- execute rubocop commands
vim.keymap.set("n", "<leader>rb", ":!rubocop % -A <CR><CR>")

-- review code
local function set_buffs()
  local buffs = {}

  for _, window in ipairs(vim.api.nvim_list_wins()) do
    if vim.fn.getwininfo(window)[1].quickfix ~= 1 then
      table.insert(buffs, vim.api.nvim_win_get_buf(window))
    end
  end

  vim.api.nvim_tabpage_set_var(0, 'CodeReviewBuffNumbers', buffs)
end

local function review_quick_fix()
  if Review ~= nil and BeforeReviewPath ~= nil then
    vim.cmd(":only")
    vim.cmd.edit(BeforeReviewPath)

    Review = nil
    BeforeReviewPath = nil
    return
  end

  Review = true
  BeforeReviewPath = (vim.fn.expand("%") ~= "" and vim.fn.expand("%")) or vim.fn.getcwd()

  --local main_hash = vim.cmd(":G log --merges -1 --format='%H'")
  local main_hash = vim.fn.systemlist("git log --merges -1 --format=\\%H")[1]

  vim.cmd(":G difftool " ..main_hash.. " HEAD")
  vim.cmd("silent! :Gvdiffsplit " ..main_hash)

  set_buffs()
end

vim.keymap.set("n", "<leader>gr", function()
  review_quick_fix()
end, {noremap=true})

-- quickfix
local function quickfix_next()
  vim.cmd("silent! :cnext")

  if Review == true then
    local main_hash = vim.fn.systemlist("git log --merges -1 --format=\\%H")[1]
    vim.cmd("silent! :Gvdiffsplit " ..main_hash)

    set_buffs()
  end

  local windows = vim.api.nvim_list_wins()
  if #windows > 3 then
    local second_to_last = windows[#windows - 1]
    vim.api.nvim_win_close(second_to_last, true)
  end
end

local function quickfix_prev()
  vim.cmd("silent! :cprev")

  if Review == true then
    local main_hash = vim.fn.systemlist("git log --merges -1 --format=\\%H")[1]
    vim.cmd("silent! :Gvdiffsplit " ..main_hash)

    set_buffs()
  end

  local windows = vim.api.nvim_list_wins()
  if #windows > 3 then
    local second_to_last = windows[#windows - 1]
    vim.api.nvim_win_close(second_to_last, true)
  end
end

vim.keymap.set("n", "<C-j>", function()
  quickfix_next()
end, {noremap=true})

vim.keymap.set("n", "<C-k>", function()
  quickfix_prev()
end, {noremap=true})

-- reset global variables when closing quickfix list
vim.api.nvim_create_autocmd("WinClosed", {
  pattern = "*",
  callback = function(event)
    local win_id = tonumber(event.match)
    if vim.fn.getwininfo(win_id)[1].quickfix == 1 then
      Review = nil
      BeforeReviewPath = nil
    end
  end,
})

local function quickfix_in_windows(windows)
  for _,window in ipairs(windows) do
    if vim.fn.getwininfo(window)[1].quickfix == 1 then
      return true
    end
  end

  return false
end

local function get_buffs()
  local ok, buffs = pcall(vim.api.nvim_tabpage_get_var, 0, "CodeReviewBuffNumbers")
  if not ok then
    buffs = {}
  end

  return buffs
end

local function get_current_buffs_without_quickfix()
  local windows = {}

  for _, window in ipairs(vim.api.nvim_list_wins()) do
    if vim.fn.getwininfo(window)[1].quickfix ~= 1 then
      table.insert(windows, vim.api.nvim_win_get_buf(window))
    end
  end

  return windows
end

local function has_value (tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

vim.api.nvim_create_autocmd({"BufEnter"}, {
  callback = function()

    local quick_fix_open = false
    for _, window in ipairs(vim.api.nvim_list_wins()) do
      if vim.fn.getwininfo(window)[1].quickfix ~= 1 then
        quick_fix_open = true
      end
    end

    if next(get_buffs()) ~= nil and quick_fix_open == true then
      local current_buffs = get_current_buffs_without_quickfix()

      for _index, buff_id in ipairs(get_buffs()) do
        if has_value(current_buffs, buff_id) then
          print("HERE BUFF ID " ..buff_id)
          --Review = nil
          --BeforeReviewPath = nil
        end
      end
    end
  end,
})
