local lush = require('lush')
local bloop = require('bloop_nvim.palette')

-- required to make the magic of Lush work (Normal etc are undefined)
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- TODO: add option to no set bg value here for transparent backgrounds
    Normal { fg = bloop.fg, bg = bloop.bg }, -- normal text
    Comment { fg = bloop.fg_mute, gui = "italic" }, -- any comment
    ColorColumn { bg = bloop.bg_soft }, -- used for the columns set with 'colorcolumn'
    Conceal { fg = bloop.accent_alt }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = bloop.accent, bg = bloop.prime }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM {}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bloop.bg_bright }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { bg = bloop.bg_bright }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = bloop.accent }, -- directory names (and other special names in listings)
    DiffAdd { fg = bloop.accent }, -- diff mode: Added line |diff.txt|
    DiffChange { fg = bloop.accent_alt }, -- diff mode: Changed line |diff.txt|
    DiffDelete { fg = bloop.prime }, -- diff mode: Deleted line |diff.txt|
    DiffText { bg = bloop.bg_bright }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = bloop.fg_subtle }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermNormal { bg = bloop.bg_deep },
    TermCursor { gui = "reverse" }, -- cursor in a focused terminal
    TermCursorNC { bg = bloop.bg_bright }, -- cursor in an unfocused terminal
    Title { fg = bloop.fg }, -- titles for output from ":set all", ":autocmd" etc.
    ErrorMsg { fg = bloop.prime, bg = bloop.prime_dark }, -- error messages on the command line
    InfoMsg { fg = bloop.fg_mute },
    WarnMsg { fg = bloop.accent, bg = bloop.prime_dark, gui = "bold" },
    HintMsg { fg = bloop.accent, gui = "italic" },
    MsgArea { fg = bloop.fg_mute }, -- Area for messages and cmdline
    MsgSeparator { fg = bloop.fg_subtle }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = bloop.accent }, -- |more-prompt|
    ModeMsg { fg = bloop.fg_subtle }, -- 'showmode' message (e.g., "-- INSERT -- ")
    WarningMsg { fg = bloop.prime }, -- warning messages
    VertSplit { fg = bloop.bg_bright }, -- the column separating vertically split windows
    Folded { fg = bloop.fg_mute, bg = bloop.bg_soft }, -- line used for closed folds
    FoldColumn { Folded }, -- 'foldcolumn'
    SignColumn { fg = bloop.fg_mute, }, -- column where |signs| are displayed
    IncSearch { fg = bloop.prime, bg = bloop.bg_soft }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { fg = bloop.prime, bg = bloop.prime_dark }, -- |:substitute| replacement text highlighting
    LineNr { fg = bloop.fg_subtle }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = bloop.prime }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { fg = bloop.prime, bg = bloop.bg_soft }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    NonText { fg = bloop.bg_soft }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat { Normal, bg=bloop.bg_deep }, -- Normal text in floating windows.
    -- NormalNC { Normal }, -- normal text in non-current windows
    Pmenu { fg = bloop.fg }, -- Popup menu: normal item.
    PmenuSel { bg = bloop.bg_soft, fg = bloop.fg }, -- Popup menu: selected item.
    PmenuSbar { fg = bloop.accent, bg = bloop.bg }, -- Popup menu: scrollbar.
    PmenuThumb { bg = bloop.bg_soft }, -- Popup menu: Thumb of the scrollbar.
    Question { fg = bloop.prime_alt }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = bloop.accent }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { bg = bloop.prime_dark }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey { fg = bloop.accent, bg = bloop.bg_soft }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine { fg = bloop.fg_mute }, -- status line of current window
    StatusLineNC { fg = bloop.fg_subtle }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine { fg = bloop.fg_mute }, -- tab pages line, not active tab page label
    TabLineFill { TabLine }, -- tab pages line, where there are no labels
    TabLineSel { bg = bloop.bg_bright, fg = bloop.accent }, -- tab pages line, active tab page label
    Visual { bg = bloop.bg_soft }, -- Visual mode selection
    VisualNOS { bg = bloop.bg_bright }, -- Visual mode selection when vim is "Not Owning the Selection".
    Whitespace { NonText }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu { fg = bloop.fg, bg = bloop.bg_soft }, -- current match in 'wildmenu' completion

    -- standard group names for syntax highlighting.

    Constant { fg = bloop.accent }, -- (preferred) any constant
    Number { Constant }, --   a number constant: 234, 0xff
    Boolean { Constant }, --  a boolean constant: TRUE, false
    Float { Constant }, --    a floating point constant: 2.3e10
    String { Constant }, --   a string constant: "this is a string"
    Character { Constant }, --  a character constant: 'c', '\n'

    Identifier { fg = bloop.fg }, -- (preferred) any variable name
    Function { fg = bloop.secondary }, -- function name (also: methods for classes)

    Keyword { fg = bloop.prime }, --  any other keyword
    Statement { Keyword }, -- (preferred) any statement
    Conditional { Statement }, --  if, then, else, endif, switch, etc.
    Repeat { Statement }, --   for, do, while, etc.
    Label { Statement }, --    case, default, etc.
    Operator { Statement }, -- "sizeof", "+", "*", etc.

    PreProc { Keyword }, -- (preferred) generic Preprocessor
    -- REVIEW: maybe add an option to toggle this with keyword/muted?
    --  I like how it looks when the import block has the fg_mute color instead.
    --  But that'd be an exception to the keyword=prime rule. Worth it?
    Include { Keyword }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type { fg = bloop.prime_alt }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    Typedef { fg = bloop.prime_alt }, --  A typedef

    Special { fg = bloop.prime }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    SpecialComment { fg = bloop.secondary }, -- special things inside a comment
    Tag { fg = bloop.prime_alt }, --    you can use CTRL-] on this
    Debug { fg = bloop.prime_alt, bg = bloop.bg_soft }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold { gui = "bold" },
    Italic { gui = "italic" },

    Ignore {}, -- (preferred) left blank, hidden  |hl-Ignore|

    Error { ErrorMsg }, -- (preferred) any erroneous construct

    Noise { fg = bloop.fg_subtle },
    Parens { Noise },
    Braces { Noise },
    Assign { Noise },
    Comma { Noise },
    Delimiter { Noise }, --  character that needs attention

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText { bg = bloop.bg_soft }, -- used for highlighting "text" references
    LspReferenceRead { bg = bloop.bg_soft }, -- used for highlighting "read" references
    LspReferenceWrite { bg = bloop.bg_soft }, -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { LspReferenceText }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { ErrorMsg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { WarnMsg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { InfoMsg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { HintMsg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError { gui = "curl" }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn {}, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo {}, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint {}, -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticSignError { fg = bloop.prime }, -- Used for "Error" signs in sign column.
    DiagnosticSignWarn { fg = bloop.secondary }, -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo { fg = bloop.secondary_alt }, -- Used for "Info" signs in sign column.
    DiagnosticSignHint { fg = bloop.fg_subtle }, -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    TSConstructor { fg = bloop.prime_alt }, -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    luaTSConstructor { Noise },
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    TSField { fg = bloop.secondary_alt }, -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude {}, -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSKeyword { Keyword }, -- Keywords that don't fit into other categories.
    TSKeywordFunction { Keyword }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    TSKeywordOperator { Keyword, gui = "italic" }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordReturn { Keyword, gui = "bold" }, -- Keywordr like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    TSMethod { fg = bloop.secondary }, -- Method calls and definitions.
    TSNamespace { fg = bloop.secondary_alt, gui = "italic" }, -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    TSOperator { Noise }, -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    TSProperty { fg = bloop.secondary_alt }, -- Same as `TSField`.
    TSPunctDelimiter { Noise }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket { Noise }, -- Brackets, braces, parentheses, etc.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    TSTag { fg = bloop.fg_mute }, -- Tags like HTML tag names.
    TSTagAttribute { fg = bloop.fg_mute }, -- HTML tag attributes.
    TSTagDelimiter { Noise }, -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    -- TSStrong             { } , -- Text to be represented in bold.
    -- TSEmphasis           { } , -- Text to be represented with emphasis.
    -- TSUnderline          { } , -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    TSNote { fg = bloop.accent, gui = "italic" }, -- Text representation of an informational note.
    TSWarning { fg = bloop.prime }, -- Text representation of a warning note.
    TSDanger { Error }, -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    TSVariable { fg = Normal.fg }, -- Variable names that don't fit into other categories.
    TSVariableBuiltin { fg = bloop.accent }, -- Variable names defined by the language: `this` or `self` in Javascript.
    TreesitterContext { bg = bloop.bg_deep },
    TreesitterContextLineNumber { bg = bloop.bg_deep },
    NvimInternalError { ErrorMsg },

    GitSignsAdd { fg = bloop.accent }, -- diff mode: Added line |diff.txt|
    GitSignsChange { fg = bloop.accent_alt }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete { fg = bloop.prime }, -- diff mode: Deleted line |diff.txt|
    GitGutterAdd { GitSignsAdd }, -- diff mode: Added line |diff.txt|
    GitGutterChange { GitSignsChange }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete { GitSignsDelete }, -- diff mode: Deleted line |diff.txt|

    FloatNormal { fg = bloop.fg, bg = bloop.bg_deep },
    FloatBorder { fg = bloop.bg_bright, bg = bloop.bg_deep },
    TelescopeBorder { FloatBorder },
    TelescopeNormal { FloatNormal },
    TelescopeTitle { fg = bloop.prime },
    LspFloatWinBorder { FloatBorder },
    LspFloatWinNormal { FloatNormal },

    NvimTreeNormal { FloatNormal },
    WhichKey { fg = bloop.accent },
    WhichKeyFloat { FloatNormal },


    -- markdown
    markdownH1 { fg = bloop.prime, gui = "bold" },
    markdownH2 { fg = bloop.accent },
    markdownH3 { fg = bloop.accent, gui = "italic" },
    markdownH4 { fg = bloop.fg_mute, gui = "italic" },
    markdownH5 { fg = bloop.fg_mute, gui = "italic" },
    markdownH6 { fg = bloop.fg_mute, gui = "italic" },
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
