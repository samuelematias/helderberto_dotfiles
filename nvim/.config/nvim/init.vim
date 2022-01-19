" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hoob3rt/lualine.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'helderburato/aragorn-vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'lambdalisue/fern.vim'
Plug 'folke/zen-mode.nvim'

" Initialize plugin system
call plug#end()

" load configs from ./lua/hbb
lua require("hbb")

" General
set clipboard=unnamedplus          " Use system clipboard
set ttyfast                        " Faster redrawing
set lazyredraw                     " Only redraw when necessary
set cursorline                     " Find the current line quickly.
set number                         " Show line numbers
set relativenumber                 " Show the line number relative to the current line
set hlsearch                       " Highlight when searching
set is                             " Highlight on search
set title                          " Show title at top of the terminal
set timeoutlen=350                 " VIM hold up 350ms after key press
set hidden                         " TextEdit might fail if hidden is not set
set scrolloff=6                    " Scroll screen after 8 lines
set mouse=a                        " Enable mouse support
set signcolumn=yes
set termguicolors                  " Force GUI colors in terminals
set updatetime=100                 " Update delay to 100ms

" More natural split directions
set splitbelow
set splitright

" Fold
set foldmethod=expr
set foldlevelstart=99              " Start file with all folds opened
set foldexpr=nvim_treesitter#foldexpr()

set nowritebackup
set noswapfile
set nobackup

" Indentation
set expandtab                      " turn tabs into tabstop spaces
set tabstop=2                      " 1 tab = 2 spaces
set shiftwidth=2                   " shift 2 spaces

" Mappings
" set leader key to spacebar
let mapleader = "\<space>"

" misc
inoremap <C-c> <esc>
nnoremap <esc> :noh<CR><CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>we :noa w<CR>
nnoremap <silent><leader>q :q!<CR>

" window manipulate
nnoremap <silent> <leader>. :Fern . -reveal=%<CR><C-w>=
nnoremap <silent> <leader>n :Fern . -drawer -width=40 -reveal=% -toggle<CR><C-w>=
nnoremap <leader>e <C-w>
nnoremap <leader>ev :vsplit<CR>
nnoremap <leader>es :split<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= <C-w>=<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" select & movement

" move line up
vnoremap J :m '>+1<CR>gv=gv

" move line down
vnoremap K :m '<-2<CR>gv=gv

" source current configuration
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" buffers & history
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>bd :bdelete!<CR>
nnoremap <leader>h :History<CR>

" search
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fs :BLines<CR>
nnoremap <leader>fd :Files %:p:h<CR>
nnoremap <leader><leader> :FZF<CR>

" Switch between the last two files
nnoremap <leader>l <C-^>

" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Disable arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Git
nmap <leader>g :G<CR>
nmap <leader>dh :diffget //2<CR>
nmap <leader>dl :diffget //3<CR>

" Zen Mode
nnoremap <leader>zm :ZenMode<cr>

" Custom Syntax

" Enable Groovy syntax into Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Enable JSON syntax into rc files
autocmd BufNewFile,BufRead .*rc setf json

" Apply textwidth to *.md files
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Enable JavaScript / TypeScript syntax when open file
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
