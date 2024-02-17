local highlight = vim.api.nvim_set_hl
local none = 'NONE'

local M = {}

--- @class StyleProps
--- @field bold boolean
--- @field italic boolean
-- stylua: ignore
local style_props = {
  bold = true,
  italic = true,
}

--- @class EmbarkConf
--- @field styles table
M.config = {
  styles = {
    --- @type StyleProps
    keywords = { bold = true, italic = true },
    --- @type StyleProps
    comments = { bold = false, italic = true },
  },
}

--- @param config EmbarkConf?
function M.setup(config)
  if config ~= nil then
    M.config = {
      styles = {
        keywords = {
          italic = config.styles.keywords.italic or M.config.styles.keywords.italic,
          bold = config.styles.keywords.bold or M.config.styles.keywords.bold,
        },
        comments = {
          italic = config.styles.comments.italic or M.config.styles.comments.italic,
          bold = config.styles.comments.bold or M.config.styles.comments.bold,
        },
      },
    }
  end
end

local colors = {
  bg = '#1e1c31',
  bg_dark = '#100e23',
  bg_bright = '#585273',
  space2 = '#2D2B40',
  space3 = '#3E3859',

  red = '#F48FB1',
  dark_red = '#F0236E',

  green = '#A1EFD3',
  dark_green = '#7fe9c3',

  yellow = '#ffe6b3',
  dark_yellow = '#F2B482',

  blue = '#91ddff',
  dark_blue = '#78a8ff',

  purple = '#d4bfff',
  dark_purple = '#7676ff',

  cyan = '#ABF8F7',
  dark_cyan = '#63f2f1',

  magenta = '#bb9af7',

  norm = '#cbe3e7',
  norm_subtle = '#8A889D',
  visual = '#3E3859',

  diff_del = '#411E35',
  diff_add = '#133246',
  diff_changed = '#22244C',
}

M.palette = colors

M.colorscheme = function()
  -- Background and text
  highlight(0, 'Normal', { bg = colors.bg, fg = colors.norm })

  -- Color of mode text, --INSERT--
  highlight(0, 'ModeMsg', { fg = colors.norm_subtle })

  -- Comments
  highlight(0, 'Comment', { fg = colors.norm_subtle, bold = M.config.styles.comments.bold, italic = M.config.styles.comments.italic })

  -- Functions
  highlight(0, 'Function', { fg = colors.red })

  -- Strings
  highlight(0, 'String', { fg = colors.yellow })

  -- Booleans
  highlight(0, 'Boolean', { fg = colors.dark_yellow })

  -- Identifiers
  highlight(0, 'Identifier', { fg = colors.norm })

  -- Color of titles
  highlight(0, 'Title', { fg = colors.dark_blue })

  -- const, static
  highlight(0, 'StorageClass', { fg = colors.purple })

  -- void, intptr_t
  highlight(0, 'Type', { fg = colors.purple })

  -- Numbers
  highlight(0, 'Constant', { fg = colors.purple })

  -- Character constants
  highlight(0, 'Character', { fg = colors.yellow })

  -- Exceptions
  highlight(0, 'Exception', { fg = colors.dark_red })

  -- ifdef/endif
  highlight(0, 'PreProc', { fg = colors.green })

  -- case in switch statement
  highlight(0, 'Label', { fg = colors.dark_blue })

  -- end-of-line '$', end-of-file '~'
  highlight(0, 'NonText', { fg = colors.bg_bright })

  -- sizeof
  highlight(0, 'Operator', { fg = colors.dark_cyan })

  -- for, while
  highlight(0, 'Repeat', { fg = colors.green })

  -- Search
  highlight(0, 'Search', { bg = colors.dark_yellow, fg = colors.bg })
  highlight(0, 'CurSearch', { bg = colors.dark_yellow, fg = colors.bg })
  highlight(0, 'IncSearch', { bg = colors.yellow, fg = colors.bg })

  -- '\n' sequences
  highlight(0, 'Special', { fg = colors.cyan })

  -- if, else
  highlight(0, 'Statement', { fg = colors.green })

  -- struct, union, enum, typedef
  highlight(0, 'Structure', { fg = colors.purple })

  -- Status, split and tab lines
  highlight(0, 'StatusLine', { bg = colors.bg, fg = colors.norm })
  highlight(0, 'StatusLineNC', { bg = colors.bg })
  highlight(0, 'Tabline', { bg = colors.bg, fg = colors.norm_subtle })
  highlight(0, 'TablineSel', { bg = colors.visual, fg = colors.norm_subtle })
  highlight(0, 'TablineSelSymbol', { bg = colors.norm_subtle, fg = colors.bg })
  highlight(0, 'TablineFill', { bg = colors.bg, fg = colors.norm_subtle })
  highlight(0, 'StatusLineTerm', { bg = colors.bg, fg = colors.norm })
  highlight(0, 'StatusLineTermNC', { bg = colors.bg, fg = colors.norm })
  highlight(0, 'VertSplit', { bg = colors.bg, fg = colors.bg })

  -- Visual selection
  highlight(0, 'Visual', { bg = colors.visual })
  highlight(0, 'VisualNOS', { bg = colors.visual, fg = colors.norm_subtle })

  -- Errors, warnings and whitespace-eol
  highlight(0, 'Error', { bg = colors.bg_dark, fg = colors.dark_red })
  highlight(0, 'ErrorMsg', { fg = colors.dark_red })
  highlight(0, 'WarningMsg', { fg = colors.yellow })

  -- Auto-text-completion menu
  highlight(0, 'Pmenu', { bg = colors.bg_dark, fg = colors.norm })
  highlight(0, 'PmenuSel', { bg = colors.bg, fg = colors.purple })
  highlight(0, 'PmenuSbar', { bg = colors.bg_dark, fg = colors.norm })
  highlight(0, 'PmenuThumb', { bg = colors.bg_dark, fg = colors.norm })
  highlight(0, 'WildMenu', { bg = colors.cyan, fg = colors.bg_dark })

  -- Spelling errors
  highlight(0, 'SpellBad', { bg = none, undercurl = true, sp = colors.dark_red })
  highlight(0, 'SpellCap', { bg = none, undercurl = true, sp = colors.green })
  highlight(0, 'SpellRare', { bg = none, undercurl = true, sp = colors.red })
  highlight(0, 'SpellLocal', { bg = none, undercurl = true, sp = colors.dark_green })

  -- Misc
  highlight(0, 'Question', { fg = colors.green })
  highlight(0, 'MoreMsg', { fg = colors.green })
  highlight(0, 'LineNr', { fg = colors.bg_bright })
  highlight(0, 'Cursor', { fg = colors.bg_bright, bg = colors.blue })

  highlight(0, 'lCursor', { fg = colors.bg_bright })
  highlight(0, 'CursorLineNr', { bg = colors.bg_dark, fg = colors.blue })
  highlight(0, 'CursorColumn', { bg = colors.bg_dark })
  highlight(0, 'CursorLine', { bg = colors.bg_dark })
  highlight(0, 'Folded', { fg = colors.dark_purple })
  highlight(0, 'FoldColumn', { fg = colors.dark_purple })
  highlight(0, 'SignColumn', { fg = colors.green })
  highlight(0, 'Todo', { bg = colors.bg, fg = colors.dark_yellow })
  highlight(0, 'SpecialKey', { fg = colors.blue })
  highlight(0, 'MatchParen', { bg = colors.bg_dark, underline = true })
  highlight(0, 'Ignore', { fg = colors.bg })
  highlight(0, 'Underlined', { fg = colors.norm })
  highlight(0, 'QuickFixLine', { bg = colors.green })
  highlight(0, 'Delimiter', { fg = colors.cyan })
  highlight(0, 'qfFileName', { fg = colors.green })

  -- Color column (after line 80)
  highlight(0, 'ColorColumn', { bg = colors.space2 })

  -- Conceal color
  highlight(0, 'Conceal', { fg = colors.norm })

  -- nvim -d
  highlight(0, 'DiffAdd', { bg = colors.diff_add })
  highlight(0, 'DiffChange', { bg = colors.diff_changed })
  highlight(0, 'DiffDelete', { bg = colors.diff_del, fg = colors.visual })
  highlight(0, 'DiffText', { bg = colors.diff_changed })

  -------------------------------------------------------------------------
  -- Neovim standard styling
  -------------------------------------------------------------------------

  highlight(0, 'Whitespace', { fg = colors.yellow })
  highlight(0, 'TermCursor', { bg = colors.norm, fg = colors.bg_bright })
  highlight(0, 'NormalFloat', { bg = colors.bg, fg = colors.norm })
  highlight(0, 'WinBar', { bg = colors.cyan, fg = colors.bg_dark })
  highlight(0, 'WinBarNC', { bg = colors.cyan, fg = colors.bg_dark })
  highlight(0, 'WinSeparator', { fg = colors.space3 })

  -- Neovim check-health
  highlight(0, 'healthSuccess', { fg = colors.diff_add })
  highlight(0, 'healthHeadingChar', { fg = colors.blue })
  highlight(0, 'helpHeader', { fg = colors.cyan })

  -- Neovim Tree-sitter
  highlight(0, '@annotation', { fg = colors.dark_green })
  highlight(0, '@attribute', { fg = colors.purple })
  highlight(0, '@constant', { fg = colors.purple })
  highlight(0, '@constant.builtin', { fg = colors.cyan })
  highlight(0, '@constant.macro', { fg = colors.green })
  highlight(0, '@constructor', { fg = colors.green })
  highlight(0, '@danger', { fg = colors.dark_yellow })
  highlight(0, '@error', { fg = colors.red })
  highlight(0, '@exception', { fg = colors.dark_red })
  highlight(0, '@function.builtin', { fg = colors.blue })
  highlight(0, '@function.call', { fg = colors.blue })
  highlight(0, '@function.macro', { fg = colors.blue })
  highlight(0, '@include', { fg = colors.red })
  highlight(0, '@keyword.operator', { fg = colors.dark_cyan })
  highlight(0, '@namespace', { fg = colors.cyan })
  highlight(0, '@namespace.builtin', { fg = colors.cyan })
  highlight(0, '@none', {})
  highlight(0, '@parameter', { fg = colors.red })
  highlight(0, '@parameter.builtin', { fg = colors.red })
  highlight(0, '@property', { fg = colors.purple })
  highlight(0, '@punctuation.special', { fg = colors.norm })
  highlight(0, '@string.regex', { fg = colors.yellow })
  highlight(0, '@symbol', { fg = colors.cyan })
  highlight(0, '@tag', { fg = colors.cyan })
  highlight(0, '@tag.attribute', { fg = colors.purple })
  highlight(0, '@tag.delimiter', { fg = colors.cyan })
  highlight(0, '@text.danger', { fg = colors.red })
  highlight(0, '@text.diff.add', { fg = colors.diff_add })
  highlight(0, '@text.diff.delete', { fg = colors.diff_del })
  highlight(0, '@text.emphasis', { fg = colors.norm_subtle, italic = true })
  highlight(0, '@text.environment', { fg = colors.norm })
  highlight(0, '@text.environment.name', { fg = colors.green })
  highlight(0, '@text.literal', { fg = colors.cyan })
  highlight(0, '@text.math', { fg = colors.red })
  highlight(0, '@text.note', { fg = colors.norm_subtle })
  highlight(0, '@text.reference', { fg = colors.purple })
  highlight(0, '@text.strike', { strikethrough = true })
  highlight(0, '@text.strong', { bold = true })
  highlight(0, '@text.title', { bold = true })
  highlight(0, '@text.todo', { fg = colors.norm_subtle })
  highlight(0, '@text.underline', { underline = true })
  highlight(0, '@text.uri', { fg = colors.blue })
  highlight(0, '@text.warning', { fg = colors.dark_yellow })
  highlight(0, '@type.builtin', { fg = colors.purple })
  highlight(0, '@type.qualifier', { fg = colors.cyan })
  highlight(0, '@variable', { fg = colors.norm })
  highlight(0, '@variable.builtin', { fg = colors.cyan })
  -- Language specific Tree-sitter overrides.
  highlight(0, '@field.yaml', { fg = colors.cyan })
  highlight(0, '@keyword.gitcommit', { fg = colors.blue })
  highlight(0, '@parameter.bash', { fg = colors.green })
  highlight(0, '@punctuation.delimiter.astro', { fg = colors.yellow })
  highlight(0, '@punctuation.delimiter.css', { fg = colors.yellow })
  highlight(0, '@punctuation.delimiter.rust', { fg = colors.yellow })
  highlight(0, '@punctuation.delimiter.scss', { fg = colors.yellow })
  highlight(0, '@punctuation.delimiter.yaml', { fg = colors.yellow })
  highlight(0, '@storageclass.rust', { fg = colors.cyan })
  highlight(0, '@text.literal.vimdoc', { fg = colors.norm_subtle })
  highlight(0, '@text.literal.block.vimdoc', { fg = colors.green })
  highlight(0, '@text.reference.gitcommit', { fg = colors.diff_add })
  highlight(0, '@text.title.1.markdown', { fg = colors.green })
  highlight(0, '@text.title.1.marker.markdown', { fg = colors.red })
  highlight(0, '@text.title.1.vimdoc', { fg = colors.cyan })
  highlight(0, '@text.title.2.markdown', { fg = colors.cyan })
  highlight(0, '@text.title.2.marker.markdown', { fg = colors.red })
  highlight(0, '@text.title.2.vimdoc', { fg = colors.cyan })
  highlight(0, '@text.title.3.markdown', { fg = colors.green })
  highlight(0, '@text.title.3.marker.markdown', { fg = colors.red })
  highlight(0, '@text.title.4.markdown', { fg = colors.cyan })
  highlight(0, '@text.title.4.marker.markdown', { fg = colors.red })
  highlight(0, '@text.title.5.markdown', { fg = colors.cyan })
  highlight(0, '@text.title.5.marker.markdown', { fg = colors.red })
  highlight(0, '@text.title.6.markdown', { fg = colors.cyan })
  highlight(0, '@text.title.6.marker.markdown', { fg = colors.red })
  highlight(0, '@text.title.help', { fg = colors.norm_subtle })
  highlight(0, '@text.title.markdown', { fg = colors.norm_subtle })
  highlight(0, '@text.uri.gitcommit', { fg = colors.green })

  -- Neovim LSP semantic highlights.
  highlight(0, '@lsp.mod.deprecated', { link = '@constant' })
  highlight(0, '@lsp.mod.readonly', { link = '@constant' })
  highlight(0, '@lsp.mod.typeHint', { link = '@type' })
  highlight(0, '@lsp.type.boolean', { link = '@boolean' })
  highlight(0, '@lsp.type.builtinConstant', { link = '@constant.builtin' })
  highlight(0, '@lsp.type.builtinType', { link = '@type' })
  highlight(0, '@lsp.type.class', { link = '@type' })
  highlight(0, '@lsp.type.enum', { link = '@type' })
  highlight(0, '@lsp.type.enumMember', { link = '@property' })
  highlight(0, '@lsp.type.escapeSequence', { link = '@string.escape' })
  highlight(0, '@lsp.type.formatSpecifier', { link = '@punctuation.special' })
  highlight(0, '@lsp.type.generic', { link = '@variable' })
  highlight(0, '@lsp.type.interface', { link = '@type' })
  highlight(0, '@lsp.type.keyword', { link = '@keyword' })
  highlight(0, '@lsp.type.lifetime', { link = '@storageclass' })
  highlight(0, '@lsp.type.magicFunction', { link = '@function' })
  highlight(0, '@lsp.type.namespace', { link = '@namespace' })
  highlight(0, '@lsp.type.number', { link = '@number' })
  highlight(0, '@lsp.type.operator', { link = '@operator' })
  highlight(0, '@lsp.type.parameter', { link = '@parameter' })
  highlight(0, '@lsp.type.property', { link = '@property' })
  highlight(0, '@lsp.type.selfKeyword', { link = '@variable.builtin', bold = M.config.styles.keywords.bold, italic = M.config.styles.keywords.italic })
  highlight(0, '@lsp.type.selfParameter', { link = '@variable.builtin' })
  highlight(0, '@lsp.type.string', { link = '@string' })
  highlight(0, '@lsp.type.struct', { link = '@type' })
  highlight(0, '@lsp.type.typeAlias', { link = '@type.definition' })
  highlight(0, '@lsp.type.unresolvedReference', { link = '@error' })
  highlight(0, '@lsp.type.variable', { link = '@variable' })
  highlight(0, '@lsp.typemod.class.defaultLibrary', { link = '@type' })
  highlight(0, '@lsp.typemod.enum.defaultLibrary', { link = '@type' })
  highlight(0, '@lsp.typemod.enumMember.defaultLibrary', { link = '@constant.builtin' })
  highlight(0, '@lsp.typemod.function.defaultLibrary', { link = '@function' })
  highlight(0, '@lsp.typemod.keyword.async', { link = '@keyword' })
  highlight(0, '@lsp.typemod.keyword.injected', { link = '@keyword' })
  highlight(0, '@lsp.typemod.method.defaultLibrary', { link = '@function' })
  highlight(0, '@lsp.typemod.operator.injected', { link = '@operator' })
  highlight(0, '@lsp.typemod.string.injected', { link = '@string' })
  highlight(0, '@lsp.typemod.struct.defaultLibrary', { link = '@type' })
  highlight(0, '@lsp.typemod.variable.callable', { link = '@function' })
  highlight(0, '@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
  highlight(0, '@lsp.typemod.variable.global', { link = '@constant' })
  highlight(0, '@lsp.typemod.variable.injected', { link = '@variable' })
  highlight(0, '@lsp.typemod.variable.readonly', { link = '@constant' })
  highlight(0, '@lsp.typemod.variable.static', { link = '@constant' })
  -- Language specific LSP semantic overrides.
  highlight(0, '@lsp.type.macro.rust', { link = '@function' })
  highlight(0, '@lsp.type.parameter.dockerfile', { link = '@property' })
  highlight(0, '@lsp.type.variable.dockerfile', { link = '@function' })

  highlight(0, 'DiagnosticError', { fg = colors.dark_red })
  highlight(0, 'DiagnosticWarn', { fg = colors.dark_red })
  highlight(0, 'DiagnosticInfo', { fg = colors.norm_subtle })
  highlight(0, 'DiagnosticHint', { fg = colors.norm })
  highlight(0, 'DiagnosticOk', { fg = colors.dark_green })

  -- noice color support
  highlight(0, 'NoiceCmdlinePopup', { fg = colors.norm })
  highlight(0, 'NoiceCmdlinePopupBorder', { fg = colors.norm })
  highlight(0, 'NoiceCmdlinePopupBorderSearch', { fg = colors.norm })
  highlight(0, 'NoiceCmdlinePrompt', { fg = colors.norm })
  highlight(0, 'NoiceCompletionItemKindDefault', { fg = colors.green })
  highlight(0, 'NoiceConfirmBorder', { fg = colors.norm })
  highlight(0, 'NoiceFormatTitle', { fg = colors.norm })

  -- telescope
  highlight(0, 'TelescopeNormal', { bg = colors.bg_dark })

  -- nvimtree
  highlight(0, 'NvimTreeNormal', { fg = colors.norm, bg = colors.bg_dark })
  highlight(0, 'NvimTreeNormalNC', { fg = colors.norm, bg = colors.bg_dark })

  -- neotree
  highlight(0, 'NeoTreeNormal', { fg = colors.norm, bg = colors.bg_dark })
  highlight(0, 'NeoTreeNormalNC', { fg = colors.norm, bg = colors.bg_dark })

  --whichkey
  highlight(0, 'WhichKey', { fg = colors.cyan })
  highlight(0, 'WhichKeyGroup', { fg = colors.blue })
  highlight(0, 'WhichKeyDesc', { fg = colors.magenta })
  highlight(0, 'WhichKeySeperator', { fg = colors.norm_subtle })
  highlight(0, 'WhichKeyFloat', { fg = colors.bg_dark })
  highlight(0, 'WhichKeyValue', { fg = colors.norm })

  -- lspsaga
  highlight(0, 'DiagnosticWarning', { link = 'DiagnosticWarn' })
  highlight(0, 'DiagnosticInformation', { link = 'DiagnosticInfo' })

  -- neovim
  highlight(0, 'healthError', { fg = colors.dark_red })
  highlight(0, 'healthSuccess', { fg = colors.green })
  highlight(0, 'healthWarning', { fg = colors.dark_yellow })

  -- bufferline
  highlight(0, 'BufferLineIndicatorSelected', { fg = colors.diff_changed })

  -- notify
  highlight(0, 'NotifyBackground', { fg = colors.norm, bg = colors.bg_dark })

  -- gitgutter
  highlight(0, 'GitGutterAdd', { fg = colors.diff_add })
  highlight(0, 'GitGutterChange', { fg = colors.diff_changed })
  highlight(0, 'GitGutterDelete', { fg = colors.diff_del })
  highlight(0, 'GitGutterAddLineNr', { fg = colors.diff_add })
  highlight(0, 'GitGutterChangeLineNr', { fg = colors.diff_changed })
  highlight(0, 'GitGutterDeleteLineNr', { fg = colors.diff_del })

  -- gitsigns
  highlight(0, 'GitSignsAdd', { fg = colors.diff_add })
  highlight(0, 'GitSignsChange', { fg = colors.diff_changed })
  highlight(0, 'GitSignsDelete', { fg = colors.diff_del })

  -- dashboard
  highlight(0, 'DashboardShortCut', { fg = colors.cyan })
  highlight(0, 'DashboardHeader', { fg = colors.blue })
  highlight(0, 'DashboardCenter', { fg = colors.magenta })
  highlight(0, 'DashboardFooter', { fg = colors.blue })
  highlight(0, 'DashboardKey', { fg = colors.red })
  highlight(0, 'DashboardDesc', { fg = colors.cyan })
  highlight(0, 'DashboardIcon', { fg = colors.cyan, bold = true })

  -- alpha
  highlight(0, 'AlphaShortcut', { fg = colors.red })
  highlight(0, 'AlphaHeader', { fg = colors.blue })
  highlight(0, 'AlphaHeaderLabel', { fg = colors.red })
  highlight(0, 'AlphaFooter', { fg = colors.blue })
  highlight(0, 'AlphaButtons', { fg = colors.cyan })

  -- sneak
  highlight(0, 'Sneak', { fg = colors.bg_bright, bg = colors.magenta })
  highlight(0, 'SneakScope', { bg = colors.visual })

  -- noice
  highlight(0, 'NoiceCompletionItemKindDefault', { fg = colors.norm })
end

return M
