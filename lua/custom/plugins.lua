local plugins = {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "debugpy",
        "gopls",
        "clangd",
        "codelldb",
        "zls",
        "rust-analyzer"
      },
    },
  },
  -- GoLang
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- C/C++
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "pocco81/auto-save.nvim",
    config = function(_, _)
      require("core.utils").load_mappings("autosave")
    end
  },
  -- Zig
  {
    "ziglang/zig.vim",
  },
  {
    "akinsho/toggleterm.nvim",
        config = function()
        require("toggleterm").setup()
        end,
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "NTBBloodbath/zig-tools.nvim",
    ft = "zig",
    config = function()
    require("zig-tools").setup()
    end,
    requires = {
    {
        "akinsho/toggleterm.nvim",
        config = function()
        require("toggleterm").setup()
        end,
      },
    {
      "nvim-lua/plenary.nvim",
      module_pattern = "plenary.*"}
    }
  },
  {
  "neoclide/coc.nvim",
    branch = "release",
  },
}

return plugins
