local global = vim.g

global["test#strategy"] = "neovim"
global['test#neovim#term_position'] = "belowright vertical"
global["test#ruby#runner"] = "rspec"

vim.keymap.set("n", "<leader>tn", ":w <CR>:TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":w <CR>:TestFile<CR>")
vim.keymap.set("n", "<leader>ts", ":w <CR>:TestSuite<CR>")
vim.keymap.set("n", "<leader>tsf", ":w <CR>:TestSuite --fail-fast<CR>")
vim.keymap.set("n", "<leader>tl", ":w <CR>:TestLast<CR>")
-- vim.keymap.set("n", "<leader>tv", ":w <CR>:TestVisit<CR>")
