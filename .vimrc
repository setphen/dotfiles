syntax on
let mapleader = ","

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
set noswapfile
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
nnoremap <Leader>. :bnext<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
noremap <Leader>w :update<CR>

"test shortcuts
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"fzf
noremap <C-p> :Files<CR>
noremap <Leader><C-p> :Buf<CR>

" Colors
hi ColorColumn ctermbg=8
hi Visual ctermbg=8
hi htmlBold ctermbg=8
hi LineNr ctermfg=8

"Plugins
call plug#begin('~/.vim/bundle')

" Define bundles via Github repos
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekprior/vim-trimmer'
Plug 'elixir-lang/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'evanleck/vim-svelte'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'sophacles/vim-processing'
Plug 'tidalcycles/vim-tidal'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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

noremap <leader>a :Ag -Q <C-R><C-W><CR>

let g:tidal_default_config = {"socket_name": "default", "target_pane": "tidal:1.2"}
