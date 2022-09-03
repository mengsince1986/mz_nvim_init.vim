" neovim configuration

""" PYTHON PROVIDER
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

""" RUBY PROVIDER
let g:loaded_ruby_provider = 0

""" NODEJS PROVIDER
let g:loaded_node_provider = 0

""" PERL PROVIDER
let g:loaded_perl_provider = 0

"" PACKAGE MANAGEMENT

""" polyglot
let g:polyglot_disabled = ['csv']

""" default packages
call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

call plug#end()

""" airline
let g:airline_solarized_bg='dark'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

""" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fixers = {
      \'cpp': ['clangtidy'],
      \'python':['pylint'],
      \'*': ['remove_trailing_lines', 'trim_whitespace']
      \}
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1

""" fzf
" let g:fzf_preview_window = 'right:60%'

""" ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""" autopairs
au Filetype markdown let b:autopairs_loaded=1

"" APPEARANCES

""" syntax highlighting

"""" markdonw
let g:markdown_fenced_languages = ['python', 'c', 'java']
"let g:markdown_minlines = 100

""" true colors
set termguicolors

""" color scheme
set background=dark
let g:solarized_italics = 0
colorscheme solarized8_flat

""" disbale intro message
set shortmess=I

""" wrap lines
set wrap linebreak nolist

""" mode prompt
set noshowmode

""" line numbers
set relativenumber

""" text width
set textwidth=79

""" line length marker
set colorcolumn=80

""" highlight the cursor line
set cursorline

""" cursor style
set guicursor=

""" netrw configuration
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=1
let g:netrw_altv=1
let g:netrw_winsize=25

"" EDITING

""" history
set history=1000

""" disable auto newline comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" indentation
set expandtab " tabs are spaces
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " Number of spaces to use for each step of (auto)indent

""" split panes
set splitbelow
set splitright

""" Using the system clipboard as the default register
" set clipboard=unnamedplus

"" KEYS

""" delay on ESC
set timeoutlen=1000 ttimeoutlen=1

""" remap ESC
nnoremap <C-l> <ESC>
vnoremap <C-l> <ESC>
onoremap <C-l> <ESC>
cnoremap <C-l> <C-C><ESC>
inoremap <C-l> <ESC>

""" turn on mouse
set mouse=a

""" remove trailing
nnoremap <silent> <C-t> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

""" run current buffer in python
nnoremap <silent> <F12> :update <Bar> :split term://python3 %<CR>
inoremap <silent> <F12> <Esc>:update <Bar> :split term://python3 %<CR>

""" run current buffer in pdb
nnoremap <silent> <F9> :update <Bar> :split term://python3 -m pdb %<CR>
inoremap <silent> <F9> <Esc>:update <Bar> :split term://python3 -m pdb %<CR>
