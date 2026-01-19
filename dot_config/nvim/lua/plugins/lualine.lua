return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_y = {}
      opts.sections.lualine_z = {}
      opts.sections.lualine_c = { { "filename", path = 1 } }
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }
      opts.options.theme = "gruvbox_dark"
      return opts
    end,
  },
}
