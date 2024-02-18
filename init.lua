require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

-- Sort out dart autoformat (Can't think of anywhere else to put this)
-- Define the function to run dart format
local function dart_format()
    vim.cmd('silent! w !dart format --fix -')
end

-- Set up autocmd to run dart_format on BufWritePre for Dart files
vim.cmd([[
augroup FormatDart
    autocmd!
    autocmd BufWritePre *.dart lua dart_format()
augroup END
]])

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
