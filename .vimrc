let mapleader = ","

syntax on
filetype indent on

set backspace=2   " Backspace deletes like most programs in insert mode
set clipboard=unnamed
set cursorline
set expandtab
set hidden
set history=50
set incsearch
set laststatus=2  " Always display the status line
set list listchars=tab:»·,trail:·,nbsp:·
set number
set numberwidth=5
set ruler         " show the cursor position all the time
set shiftround
set shiftwidth=2
set showcmd       " display incomplete commands
set splitbelow
set splitright
set tabstop=2
set textwidth=80

let g:pyindent_searchpair_timeout = 10

inoremap <Nul> <C-n>
map! <C-q> <ESC>
nnoremap <Leader><Leader> <C-^>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
noremap <Leader>w :update<CR>

"fzf
noremap <C-p> :Files<CR>
noremap <Leader><C-p> :Buf<CR>

"change column highlight color
hi ColorColumn ctermbg=0
hi ColorColumn ctermbg=8
hi Visual ctermbg=8

"Plugins
call plug#begin('~/.vim/bundle')

" Define bundles via Github repos
Plug '/usr/local/opt/fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekprior/vim-trimmer'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'sophacles/vim-processing'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

call plug#end()

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag -Q '
  endif
endif
