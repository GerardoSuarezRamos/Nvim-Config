" number and relativenumber set the hybrid mode where the cursor displays the
" current line, but the rest is relative
set number
set relativenumber
set noswapfile
set hlsearch
set guitablabel=%t
set laststatus=2
set autochdir

"enable mause
set mouse=a

"sintax and code
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set cursorline
set encoding=utf-8
set showmatch
set backspace=indent,eol,start

"indent
set autoindent
set cindent
set smartindent

" config files
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

"Files and widht for this files
filetype plugin indent on
set sw=2
set softtabstop=2

"search case
set incsearch
set smartcase
set ignorecase

"option indent
set tabstop=2
set expandtab
set modifiable
set textwidth=80
set undofile
set updatetime=100

" Configuracion de los temas
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Italics support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Highlight duration of vim-highlighted-yank
let g:highlightedyank_highlight_duration = 25

" Configuracion Sintax 
let g:jsx_ext_required = 1
highlight Normal ctermbg=NONE
let g:javascript_plugin_flow = 1
let g:user_emmet_mode='a'
" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.rs'


" Definicion de leader key
let mapleader=" "

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Javacript
autocmd BufRead *.js set filetype=javascript.jsx
autocmd BufRead *.jsx set filetype=javascript.jsx
augroup filetype javascript syntax=javascript

call plug#begin('~/AppData/Local/nvim/plugged')

"test code
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'


"IDE
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

"autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

"tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

"Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

"tree
Plug 'scrooloose/nerdtree'

"Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Rigellute/rigel'


" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

"syntax
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flowtype/vim-flow'
Plug 'mxw/vim-jsx'

"My love rust 
Plug 'rust-lang/rust.vim'
Plug 'daa84/neovim-lib'
Plug 'rust-analyzer/rust-analyzer'
Plug 'mhinz/vim-crates'


call plug#end()

"sets up gruvbox theme
function! GruvboxTheme()
  let g:gruvbox_italic=1
  let g:gruvbox_bold=1
  let $BAT_THEME='gruvbox'
  set bg=dark
  colorscheme gruvbox
endfunction

call GruvboxTheme()


if(isdirectory('./node_modules'))
  let nm = './node_modules'
  " Add CoC Prettier if prettier is installed
  if isdirectory(nm.'/prettier')
    let g:coc_global_extensions += ['coc-prettier']
  endif

  " Add CoC ESLint if ESLint is installed
  if isdirectory(nm.'/eslint')
   let g:coc_global_extensions += ['coc-eslint']
  endif

  if(isdirectory(nm.'/styled-components'))
    let g:coc_global_extensions += ['coc-styled-components']
  endif
endif


"crates config
if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif
highlight Crates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link Crates WarningMsg


" Configuracion del nerdtree
map <leader>n :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif


" Configuracion de fzf
map <leader>p :Files<CR>
map <leader>ag :Ag<CR>
"buffers
map <leader>ob :Buffers<CR>

"Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"Lightline configuracion
let g:lightline = {
  \ 'active': {
  \ 'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
  \ 'right':[['kitestatus'] , ['filetype', 'percent', 'lineinfo'], ['gitbranch']], 
  \  },
  \  'inactive':{
  \ 'left':[['inactive'], ['relativepath']],
  \  'right':[['bufnum']]
  \ },
  \ 'component':{
  \ 'bufnum':'%n',
  \ 'inactive': 'inactive'
  \ },
  \ 'colorscheme': 'gruvbox',
  \  'subseperator': {
  \ 'left':'',
  \ 'right':''
  \ }
  \ }


"Coc sentix


"====CoC Config===="

" GoTo code navigation. the commands are self explanatory
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac <Plug>(coc-codeaction)

" Symbol renaming.
nmap <leader>rr <Plug>(coc-rename)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"==== End of CoC Config ===="

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif




