-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("alperenunlu-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Custom keymaps
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set({ "n", "v" }, "<leader>ts", "<C-w>s:term<CR>i")
vim.keymap.set({ "n", "v" }, "<leader>tv", "<C-w>v:term<CR>i")

-- vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
-- vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>")
-- vim.keymap.set({ "n", "v" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>")
-- vim.keymap.set({ "n", "v" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>")

vim.keymap.set({ "n", "v" }, "<leader><Esc>", "<C-w>q")

vim.keymap.set("n", "<leader>l", function()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname == "" then
		return
	end

	-- get base name without extension
	local fname = vim.fn.fnamemodify(bufname, ":t") -- e.g. "xx.tex" or "xx.sty"
	local basename = vim.fn.fnamemodify(fname, ":r") -- e.g. "xx"
	local texfile = basename .. ".tex"

	-- check if the .tex file exists in current working directory
	if vim.uv.fs_stat(texfile) then
		-- open new tab and run lualatex in a terminal
		local escaped = vim.fn.fnameescape(texfile)
		vim.cmd("tabnew | term lualatex " .. escaped)
		vim.cmd("startinsert")
	else
		vim.notify("No matching .tex file found: " .. texfile, vim.log.levels.WARN)
	end
end, { desc = "Run lualatex on matching .tex file in terminal tab" })

-- vim: ts=2 sts=2 sw=2 et
