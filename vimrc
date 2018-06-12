set nocompatible
set nobackup
set hidden
set history=50
set ruler
set showcmd
set laststatus=2
set backspace=2
set number
set autowrite


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'VundleVim/Vundle.vim'

" Define bundles via GitHub repos
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/ctags.vim'
Bundle 'othree/html5.vim'
Bundle 'rking/ag.vim'
Bundle "pangloss/vim-javascript"
Bundle "vim-ruby/vim-ruby"
Bundle 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'tommcdo/vim-exchange'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

syntax on
filetype off
filetype plugin indent on

colorscheme wombat256mod

""""
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

" searching
set ignorecase
set smartcase
set showmatch
set incsearch
set nohlsearch


" faster than using the escape key
imap jj <esc>

noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" make it easier to get around the current directory
cabbr %% <C-R>=expand('%:p:h')<CR>

" better buffer switching
nmap <S-h> :bprevious<CR>
nmap <S-l> :bnext<CR>



" Sippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Exclude Javascript files in :Rtags via rails.vim due to warnings when
" parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Treat <li> and <p> tags like the block tags they are
" let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

" more natural splitting
set splitbelow
set splitright

" gitgutter settings
set signcolumn=yes
set updatetime=1000

" airline buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"vim-go things
let g:go_fmt_command = "goimports"
