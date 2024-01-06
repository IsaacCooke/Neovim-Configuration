local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line (c/c++)",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start/resume debugger (c/c++)",
    }
  }
}

M.autosave = {
    plugin = true,
    
    n = {
        ["<leader>as"] = {"<cmd> ASToggle <CR>", "Toggle Autosave"}
    }
}

return M
