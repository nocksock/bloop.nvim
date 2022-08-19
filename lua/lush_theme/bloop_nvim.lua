-- Built with Lush: github.com/rktjmp/lush.nvim
--
-- En'jkable lush.ify on this file, run:
--  `:Lushify`

local lush = require('lush')
local hsl = lush.hsl

local black        = hsl(214, 30, 12)
local white        = hsl(219, 57, 91)
local grey         = hsl("#606C80")
local prime       = hsl(335, 90, 58)
local prime_alt    = prime.li(25)

local accent        = prime.ro(180).de(50)
local accent_alt   = accent.de(20)

local grey_dark    = grey.da(25)
local grey_darker  = grey.da(60)
local grey_light   = white.da(15).de(24)

local bg_bright = black.li(10)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()

  return {
    Normal { fg = grey_light, bg = black }, -- normal text
    Secondary { fg = grey }, -- secondary level text
    Comment { fg = grey, bg=grey_darker }, -- any comment
    ColorColumn { bg = bg_bright }, -- used for the columns set with 'colorcolumn'
    Conceal { fg = accent_alt }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = accent }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = grey_darker }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { bg = bg_bright }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = accent }, -- directory names (and other special names in listings)
    DiffAdd { fg = prime_alt }, -- diff mode: Added line |diff.txt|
    DiffChange { fg = grey }, -- diff mode: Changed line |diff.txt|
    DiffDelete { fg = prime }, -- diff mode: Deleted line |diff.txt|
    DiffText { bg = accent_alt, fg = grey }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = Normal.fg.da(50) }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor { fg = prime }, -- cursor in a focused terminal
    TermCursorNC { bg = grey_dark }, -- cursor in an unfocused terminal
    Title { fg = grey }, -- titles for output from ":set all", ":autocmd" etc.
    ErrorMsg { fg = prime.sa(50), bg = prime.da(59).de(50) }, -- error messages on the command line
    InfoMsg { fg = accent },
    WarnMsg { fg = accent_alt, gui = "bold" },
    HintMsg { fg = accent.li(50), gui = "italic" },
    MsgArea { InfoMsg }, -- Area for messages and cmdline
    MsgSeparator { fg = grey }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { Normal }, -- |more-prompt|
    ModeMsg { bg = grey_dark }, -- 'showmode' message (e.g., "-- INSERT -- ")
    WarningMsg { fg = prime }, -- warning messages
    VertSplit { fg = grey_dark }, -- the column separating vertically split windows
    Folded { fg = grey, bg = grey_darker }, -- line used for closed folds
    FoldColumn { Folded }, -- 'foldcolumn'
    SignColumn { fg = grey_dark }, -- column where |signs| are displayed
    IncSearch { fg = prime, bg = grey_dark }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { bg = prime, fg = grey_dark }, -- |:substitute| replacement text highlighting
    LineNr { fg = grey_dark }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = prime }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { fg = prime, bg = grey_dark }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    NonText { fg = grey_dark }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat { Normal }, -- Normal text in floating windows.
    NormalNC { fg = white }, -- normal text in non-current windows
    Pmenu { bg = grey_dark, fg = white }, -- Popup menu: normal item.
    PmenuSel { bg = grey_darker, fg = accent }, -- Popup menu: selected item.
    PmenuSbar { fg = white, bg = black }, -- Popup menu: scrollbar.
    PmenuThumb { bg = grey }, -- Popup menu: Thumb of the scrollbar.
    Question { fg = prime_alt, gui = "italic" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = accent, bg = grey_dark }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { fg = prime, bg = grey_dark, gui = "italic" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey { fg = accent, bg = grey_dark }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine {}, -- status line of current window
    StatusLineNC {}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine { bg = grey, fg = prime }, -- tab pages line, not active tab page label
    TabLineFill { TabLine }, -- tab pages line, where there are no labels
    TabLineSel { bg = grey_dark, fg = prime }, -- tab pages line, active tab page label
    Visual { bg = grey_dark }, -- Visual mode selection
    VisualNOS { bg = grey_darker }, -- Visual mode selection when vim is "Not Owning the Selection".
    Whitespace { fg = grey_dark }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu { fg = white, bg = grey_dark }, -- current match in 'wildmenu' completion


    -- standard group names for syntax highlighting.

    Constant { fg = accent }, -- (preferred) any constant
    Number { Constant }, --   a number constant: 234, 0xff
    Boolean { Constant }, --  a boolean constant: TRUE, false
    Float { Constant }, --    a floating point constant: 2.3e10
    String { Constant }, --   a string constant: "this is a string"
    Character { Constant }, --  a character constant: 'c', '\n'

    Identifier { fg=grey }, -- (preferred) any variable name
    Function { Identifier }, -- function name (also: methods for classes)

    Statement { Identifier }, -- (preferred) any statement
    Conditional { Statement }, --  if, then, else, endif, switch, etc.
    Repeat { Statement }, --   for, do, while, etc.
    Label { Statement }, --    case, default, etc.
    Operator { Statement }, -- "sizeof", "+", "*", etc.

    Keyword { fg=prime }, --  any other keyword
    Exception { fg = prime }, --  try, catch, throw

    PreProc { Keyword }, -- (preferred) generic Preprocessor
    Include { Keyword }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type { fg = grey_light }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    Typedef { fg = grey }, --  A typedef

    Special { fg = prime }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    Debug { fg = prime, bg = accent_alt }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold { gui = "bold" },
    Italic { gui = "italic" },

    Ignore {}, -- (preferred) left blank, hidden  |hl-Ignore|

    Error { ErrorMsg }, -- (preferred) any erroneous construct

    Todo { fg = prime_alt, gui = "bold,italic" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    Noise { fg = grey_dark },
    Parens { Noise },
    Braces { Noise },
    Assign { Noise },
    Comma { Noise },

    -- TypeScript Things
    -- -----------------
    -- TODO: not sure why some things (like operators) are so weirdly obscure and not
    -- using the proper groups.
    -- typescriptFuncCallArg { fg = prime },
    -- typescriptCall { fg = prime_alt },
    -- typescriptArrowFuncDef { fg = prime_alt },
    -- typescriptStatementKeyword { Keyword },
    -- typescriptIdentifierName { fg = accent, gui = "italic" }, -- TODO find out why this is not working.
    -- typescriptVariable { fg = prime },
    -- typescriptDestructureVariable { fg = prime_alt, gui = "italic" },

    -- typescriptBinaryOp { Operator },
    -- typescriptParens { Braces },
    -- typescriptBraces { Braces },
    -- typescriptAssign { Assign },
    -- typescriptFuncComma { Comma },

    -- typescriptTypeReference { Type },
    -- typescriptTypeBrackets { Parens },
    -- typescriptTypeArguments { fg = grey },
    -- typescriptImport { Include },
    -- typescriptExport { Include },

    -- jsxRegion { fg = grey },
    -- jsxComponentName { typescriptIdentifierName },
    -- jsxElement { fg = yellow },
    -- jsxAttrib { fg = green_alt },
    -- jsxOpenTag { Braces },
    -- jsxCloseTag { Braces },

    -- jsxOpenPunct { Braces },
    -- jsxClosePunct { Braces },

    -- custom statusline
    StlPrimary { bg = grey_dark, fg = accent },

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

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
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    DiagnosticSignHint { fg = prime_alt }, -- Used for "Hint" signs in sign column.

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
    -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSKeyword { Keyword }, -- Keywords that don't fit into other categories.
    TSKeywordFunction    { Keyword } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    TSNamespace          { fg=prime_alt } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    TSOperator           { Noise } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket       { Noise } , -- Brackets, braces, parentheses, etc.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    TSTag                { fg=grey } , -- Tags like HTML tag names.
    TSTagAttribute       { fg=grey.da(25) } , -- HTML tag attributes.
    TSTagDelimiter       { Noise } , -- Tag delimiters like `<` `>` `/`.
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
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    TSVariable           { Normal } , -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
