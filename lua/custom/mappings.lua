local M = {}

M.autosave = {
    plugin = true,
    
    n = {
        ["<leader>as"] = {"<cmd> ASToggle <CR>", "Toggle Autosave"}
    }
}

return M
