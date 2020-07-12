call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" vim-lsp setting
"let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

" clangd setting
if executable('clangd')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd', '-background-index']},
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
    \ })
endif

" solargraph setting
if executable('solargraph')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'solargraph',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
    \ 'initialization_options': {"diagnostics": "true"},
    \ 'whitelist': ['ruby'],
    \ })
endif

"
set encoding=utf-8
filetype plugin indent on
syntax enable
set noswapfile
syntax on
set history=200

" 行番号の設定
set number
set cursorline

" コピペ
set clipboard=unnamed
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 括弧補完
"inoremap { {}<LEFT>
"inoremap {<Enter> {}<LEFT><CR><BS><ESC><S-o>
"inoremap ( ()<LEFT>
"inoremap (<Enter> ()<LEFT><CR><BS><ESC><S-o>
"inoremap [ []<LEFT>
"inoremap [<Enter> []<LEFT><CR><BS><ESC><S-o>
nnoremap <CR> A<CR><ESC>

" 縦棒カーソル
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[1 q"
let &t_SR .= "\e[4 q"

" colorscheme
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme iceberg
highlight lCursor ctermfg=15 ctermbg=15

" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" ビープ音を可視化
set visualbell
" 改行時に前の行のインデントを計測
set autoindent
" {があると次の行は自動で1段深く自動インデントしてくれる
set smartindent
" コマンドライン補完
set wildmenu

" 拡張子でインデントを変化
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
autocmd FileType vim         setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 et

" golang setting
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

" NERDTree setting
map <C-n> :NERDTreeToggle<CR>
