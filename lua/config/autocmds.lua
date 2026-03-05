-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  group = vim.api.nvim_create_augroup("cpp_compile_run", { clear = true }),
  callback = function(event)
    vim.keymap.set("n", "<leader>r", function()
      vim.cmd("write")
      local src = vim.fn.expand("%:p")
      local bin = vim.fn.tempname()
      local cmd = string.format(
        "g++ -std=c++17 -O2 -o %s %s && %s",
        vim.fn.shellescape(bin),
        vim.fn.shellescape(src),
        vim.fn.shellescape(bin)
      )
      local Terminal = require("toggleterm.terminal").Terminal
      Terminal:new({ cmd = cmd, direction = "horizontal", close_on_exit = false, id = 3 }):toggle()
    end, { buffer = event.buf, desc = "C++: Compile and Run" })
  end,
})
