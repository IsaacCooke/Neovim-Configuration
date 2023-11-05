local options = {
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

if vim.loop.os_uname().sysname == "Windows_NT" then
  require('nvim-treesitter.install').compilers = {"clang"}
end

return options
