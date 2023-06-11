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


dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"



local os = require("os")

local path_to_desktop = os.getenv("USERPROFILE") .. "\\Documents\\CODE_DRIVE"

local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })


vim.api.nvim_create_autocmd(
    {"VimEnter"},
    { pattern = "*", command = "cd " .. path_to_desktop, group = vim_enter_group }
)
require('nvim_comment').setup()
require('auto-save').setup()