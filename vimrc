set nocompatible
set nobackup
set history=50
set ruler
set showcmd
set laststatus=2
set backspace=2

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Define bundles via GitHub repos
"Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'vim-scripts/ctags.vim'
Bundle 'othree/html5.vim'
Bundle 'rking/ag.vim'
Bundle "pangloss/vim-javascript"
Bundle "myusuf3/numbers.vim"
Bundle "vim-ruby/vim-ruby"
Plugin 'fatih/vim-go'


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


" faster than using the escape key
imap jj <esc>

noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" make it easier to get around the current directory
cabbr %% <C-R>=expand('%:p:h')<CR>

" faster <SHIFT>-h or r tab switching
nnoremap <S-h> gT
nnoremap <S-l> gt


set number

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
