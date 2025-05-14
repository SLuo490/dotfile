return {
  {
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        cmdline = {
          enabled = true, -- Enable the cmdline UI
          view = "cmdline_popup", -- Use the popup view for cmdline
          format = {
            -- Customize the format of the cmdline
            cmdline = { icon = " " },
            search_down = { icon = " " },
            search_up = { icon = " " },
            filter = { icon = " " },
            lua = { icon = " " },
            help = { icon = " " },
          },
        },
        messages = {
          enabled = true, -- Enable messages UI
          view = "notify", -- Use the notify view for messages
        },
        popupmenu = {
          enabled = true, -- Enable the popupmenu UI
          backend = "nui", -- Use nui as the backend
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      },
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    },

    -- filename
    {
      "b0o/incline.nvim",
      dependencies = { { "nvim-tree/nvim-web-devicons" }, { "nvim-lua/plenary.nvim" } },
      event = "BufReadPre",
      priority = 1200,
      config = function()
        local helpers = require("incline.helpers")
        local devicons = require("nvim-web-devicons")
        require("incline").setup({
          window = {
            padding = 0,
            margin = { horizontal = 0 },
          },
          render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
            if filename == "" then
              filename = "[No Name]"
            end
            local ft_icon, ft_color = devicons.get_icon_color(filename)
            local modified = vim.bo[props.buf].modified
            return {
              ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
              " ",
              { filename, gui = modified and "bold,italic" or "bold" },
              " ",
              guibg = "#44406e",
            }
          end,
        })
      end,
    },
  },
}
