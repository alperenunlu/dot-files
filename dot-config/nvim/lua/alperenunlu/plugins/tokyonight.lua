return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      style = 'night',
      light_style = 'day',
      transparent = true,
      styles = {
        floats = 'normal',
      },
      on_highlights = function(highlights, colors)
        local custom_highlights = {
          Comment = { fg = '#7F848E' },
          CursorLine = { bg = 'none' },
          LineNrAbove = { fg = '#8F93A2' },
          LineNrBelow = { fg = '#8F93A2' },
          LineNr = { fg = '#C0C0C0' },
          DiagnosticUnnecessary = { fg = colors.fg_dark },
          DiagnosticVirtualTextError = { bg = 'none' },
          DiagnosticVirtualTextHint = { bg = 'none' },
          DiagnosticVirtualTextInfo = { bg = 'none' },
          DiagnosticVirtualTextWarn = { bg = 'none' },
          -- Pmenu = { bg = colors.bg, blend = 30 },
          -- PmenuSbar = { bg = colors.bg, blend = 30 },
          -- PmenuSel = { bg = '#444444' },
          -- PmenuThumb = { bg = '#444444' },
          -- NormalFloat = { bg = colors.bg, blend = 30 },
          -- FloatBorder = { fg = colors.border_highlight },
        }

        -- Apply custom highlights
        for group, settings in pairs(custom_highlights) do
          highlights[group] = vim.tbl_extend('force', highlights[group] or {}, settings)
        end
      end,
      plugins = {
        cmp = true,
      },
    },
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
