-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Disable mouse
vim.o.mousescroll = "ver:0"

-- Cursor style
-- It's mostly default (see :h guicursor), I only changed cursor style for
-- terminal mode to ver25 and turned of blinking with blinkon0
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:ver25-blinkon0-TermCursor"

-- Show line numbers
vim.o.number = true

-- Automatically save undo history to an undo file
vim.o.undofile = true

-- Show sign column stuff on the number column
vim.o.signcolumn = "number"

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- The minimal number of screen columns to keep to the left and to the right
-- of the cursor
vim.o.sidescrolloff = 15

-- Display highlighted column (more than one can be added seperated by comma)
vim.o.colorcolumn = "80"

-- Show tabs, trailing spaces and non-breakable space (nbsp) characters
vim.o.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }

-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>
vim.o.expandtab = true

-- Number of spaces to use for each step of (auto)indent
vim.o.shiftwidth = 2

-- Number of spaces that a <Tab> in the file counts for
vim.o.tabstop = 2

-- Number of spaces that a <Tab> counts for while performing editing
-- operations, like inserting a <Tab> or using <BS>
vim.o.softtabstop = 2

-- Maximum number of items to show in the popup menu
vim.o.pumheight = 3

-- Highlight the text line of the cursor
vim.o.cursorline = true

-- Global status line
vim.o.laststatus = 3

-- Hide/Disable the banner on netrw windows
vim.g.netrw_banner = 0

-- Set window size of netrw (eg. :Lex)
vim.g.netrw_winsize = 25

-- Save these thing to session file
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Put the new window right of the current one
vim.o.splitright = true

-- Put the new window below the current one
vim.o.splitbelow = true

-- Ignore case in search patterns
vim.o.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.o.smartcase = true

-- Show preview of substitutions next to the pattern
vim.o.inccommand = "split"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("colorscheme wildcharm")

-- Disable background (make it transparent)
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

-- Make comments italic
vim.cmd("hi Comment gui=italic cterm=italic")

-- Change colors for the statusline
-- vim.cmd("hi StatusLine guibg=#404040 guifg=#ffffff")
