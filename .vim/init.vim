" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

augroup vimrc
  autocmd!
augroup END

" run control files
if $VIMDIR == ''
  if has('nvim')
    let $VIMDIR = "~/.config/nvim"
  else
    let $VIMDIR = "~/.vim"
  endif
endif
let $TOML      = $VIMDIR . '/rc/dein.toml'
let $LAZY_TOML = $VIMDIR . '/rc/dein_lazy.toml'

" Disable menu.vim
if has('gui_running')
  setglobal guioptions=Mc
endif

" Disable default plugins
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
" let g:loaded_netrw             = 1
" let g:loaded_netrwPlugin       = 1
" let g:loaded_netrwSettings     = 1
" let g:loaded_netrwFileHandlers = 1
" let g:loaded_matchparen        = 1
let g:loaded_LogiPat           = 1
let g:loaded_logipat           = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1

" netrw
" ref: https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

"----------------------------------------------------------
" Plugin REQUIRED: dein
"----------------------------------------------------------

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand($VIMDIR . '/dein')

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  " dein.vim 本体
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute 'r!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir '> /dev/null 2>&1'
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" TOML を読み込み、キャッシュしておく
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml($TOML,      {'lazy' : 0})
  call dein#load_toml($LAZY_TOML, {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"----------------------------------------------------------
" Basics:
"----------------------------------------------------------

" Vi 互換なし
if &compatible
  set nocompatible                 " Be iMproved
endif

" Character encoding Setting    ref="http://www.tooyama.org/vim-2.html"
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

scriptencoding utf-8

" バックスペースキーで削除できるものを指定
set backspace=indent,eol,start

" タブが対応する空白の数
set tabstop=8
" タブやバックスペースの使用等の編集操作をするときにタブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=2

" タブを挿入するとき、代わりに空白を使わない
"set noexpandtab
" タブを挿入するとき、代わりに空白を使う
set expandtab

" 自動インデント
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" コマンド補完設定
set wildmenu
"set wildmode=list:longest,full
set wildmode=longest:full,full

" インデント折りたたみ系
" set foldmethod=indent
set foldmethod=marker
" set nofoldenable

" 検索結果をハイライト表示する
set hlsearch
set incsearch

" Splitting a window will put the new window below the current one.
set splitbelow
" vs のとき右側に分割する
set splitright

" カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

" 現在のモードを表示
set showmode

" コマンド・検索パターンの履歴数
set history=1000

" ヤンクした文字は、システムのクリップボードに入れる
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
     set clipboard& clipboard+=unnamedplus
  else
     set clipboard& clipboard+=unnamed
  endif
endif

" Enable mouse support.
set mouse=a

" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

"set helplang& helplang=en,ja
set helplang& helplang=ja,en
"
" Disable modeline.
set modelines=0
set nomodeline

set conceallevel=0

"----------------------------------------------------------
" Appearance:
"----------------------------------------------------------

" colorscheme
set background=dark
if has('gui_running')
  colorscheme solarized
  let g:airline_theme = 'solarized'
  set guifont=Andale\ Mono\ 12.5
  set guifontwide=Andale\ Mono\ 12
  set antialias
else
  set t_Co=256
  colorscheme hybrid
  let g:airline_theme = 'hybrid'
  " colorscheme solarized
  " let g:airline_theme = 'solarized'
endif

" ステータスライン設定
set laststatus=2 "常に表示

" 行番号表示
set number
set relativenumber

" カーソルが何行目の何列目に置かれているかを表示する。
set ruler

" カーソル行をハイライトしない
" シンタックスハイライトがクソ遅くなる (cf. creasty.vimrc)
set nocursorline

" カーソル行を強調表示
"set cursorline

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" 空白可視化
" http://yukimemi.bitbucket.org/blog/html/2014/01/18/vim_indentline.html
set list lcs=tab:\|\ 

"ビープ音OFF
set visualbell t_vb=

" set t_ut=

set cole=0

set matchpairs+=<:>

set colorcolumn=80

"----------------------------------------------------------
" Syntax:
"----------------------------------------------------------

" New File Template
function! s:make_template(file, line)
  if $_make_template == ""
    let $_make_template = 1
    let l:template = $VIMDIR . "/templates/" . a:file
    execute "0r " . l:template
    execute a:line
  endif
endfunction

function! s:make_verilog(file, line)
  if $_make_verilog == ""
    let $_make_verilog = 1
    let l:template = $VIMDIR . "/templates/" . a:file
    let l:module    = expand('<afile>:t:r:r')
    execute "0r " . l:template
    execute "%s/__FILENAME__/" . l:module . "/"
    execute a:line
  endif
endfunction

function! s:make_testbench(file, line)
  if $_make_testbench == ""
    let $_make_testbench = 1
    let l:template = $VIMDIR . "/templates/" . a:file
    let l:testbench = expand('<afile>:t:r:r')
    execute "0r " . l:template
    execute "$d"
    execute "%s/__FILENAME__/" . l:testbench . "/"
    execute "%s/__MODULE__/" . l:testbench[5:] . "/"
    execute a:line
  endif
endfunction

autocmd vimrc Filetype text set colorcolumn=80
autocmd vimrc Filetype markdown set colorcolumn=80
autocmd vimrc Filetype rst set colorcolumn=80

" vertically split help
autocmd vimrc FileType help wincmd L

" Python
" autocmd vimrc BufNewFile \(plot_\)\@!*.py call s:make_template("template.py", "$")
autocmd vimrc BufNewFile plot_*.py call s:make_template("plot_template.py", "23")

autocmd vimrc Filetype go set noexpandtab
autocmd vimrc Filetype go set tabstop=4
autocmd vimrc Filetype go set softtabstop=4
autocmd vimrc Filetype go set shiftwidth=4

autocmd vimrc BufNewFile *.pl call s:make_template("template.pl", "5")

" Shell Script
autocmd vimrc BufNewFile,BufRead *.sh set filetype=zsh

" Verilog
" verilogのerb記述のsyntaxを変更
autocmd vimrc BufNewFile,BufRead *.v      set filetype=verilog
autocmd vimrc BufNewFile,BufRead *.vh     set filetype=verilog

autocmd vimrc BufNewFile,BufRead *.v.erb  set filetype=verb
autocmd vimrc BufNewFile,BufRead *.vh.erb set filetype=verb
autocmd vimrc FileType verb let b:caw_oneline_comment = '//'
autocmd vimrc BufNewFile \(test_\)\@!*.v.erb call s:make_verilog("template.v.erb", "14")
autocmd vimrc BufNewFile test_*.v.erb call s:make_testbench("test_template.v.erb", "24")

autocmd vimrc BufNewFile,BufRead *.sv  set filetype=systemverilog
autocmd vimrc BufNewFile,BufRead *.svh set filetype=systemverilog
autocmd vimrc FileType systemverilog let b:caw_oneline_comment = '//'
" autocmd vimrc BufNewFile \(test_\)\@!*.sv call s:make_verilog("template.sv", "14")
autocmd vimrc BufNewFile test_*.sv call s:make_testbench("test_template.sv", "17")

" Spice
autocmd vimrc BufNewFile,BufRead *.spi set filetype=spice
autocmd vimrc BufNewFile,BufRead *.lib set filetype=spice

" LaTeX
autocmd vimrc BufNewFile,BufRead *.tex set filetype=tex
" autocmd vimrc BufNewFile *.tex call s:make_template("template.tex", "66")
let g:tex_conceal=''
autocmd vimrc Filetype tex set colorcolumn=80

" HTML
" autocmd vimrc BufNewFile *.html s:make_template("template.html", "0")
" autocmd vimrc BufNewFile,BufRead *.ts set filetype=javascript
" autocmd vimrc BufNewFile,BufRead *.tsx set filetype=javascript.jsx

" JSON
let g:vim_json_syntax_conceal = 0

" Markdown
autocmd vimrc BufNewFile,BufRead *.md set filetype=markdown
autocmd vimrc Filetype markdown set colorcolumn=80

autocmd vimrc BufNewFile,BufRead *.mail set filetype=mail

" Dotfiles
" conf files of other user
autocmd vimrc BufNewFile,BufRead *.vimrc set filetype=vim
autocmd vimrc BufNewFile,BufRead *.zshrc set filetype=zsh

" Backus-Naur form
autocmd vimrc BufNewFile,BufRead *.bnf set filetype=bnf

" wanderlust conf
autocmd vimrc BufNewFile,BufRead .wl set filetype=lisp
autocmd vimrc BufNewFile,BufRead .spacemacs set filetype=lisp

" OCaml
autocmd vimrc BufNewFile,BufRead *.ml set filetype=ocaml
autocmd vimrc BufNewFile,BufRead *.mly set filetype=ocamlyacc | set syntax=ocaml
autocmd vimrc BufNewFile,BufRead *.mll set filetype=ocamllex | set syntax=ocaml

" Coq
" autocmd vimrc BufNewFile,BufRead *.v set filetype=coq
" autocmd vimrc BufNewFile,BufRead *.v set syntax=ocaml

" CUDA, OpenCL
autocmd vimrc BufNewFile,BufRead *.cu  set filetype=cuda
autocmd vimrc BufNewFile,BufRead *.cuh set filetype=cuda
autocmd vimrc BufNewFile,BufRead *.cl  set filetype=opencl

" Rust
autocmd vimrc BufNewFile,BufRead *.rs set filetype=rust

" log
autocmd vimrc BufNewFile,BufRead *.log set syntax=yaml
autocmd vimrc BufNewFile,BufRead *.rpt set syntax=yaml

" protobuf, prototxt
autocmd vimrc BufNewFile,BufRead *.pbtxt set filetype=prototxt

" others
autocmd vimrc BufNewFile,BufRead *.xxx set syntax=perl

"----------------------------------------------------------
" Key Mapping:
"----------------------------------------------------------

" Fold
"nnoremap <Space> za
"vnoremap <Space> za

" change the roll of ; and : in normal mode
"nnoremap ; :
"nnoremap : ;

" Esc
"inoremap <C-j> <esc>

vnoremap * "zy:let @/ = @z<CR>n

" K で誤爆しやすいので変更
nnoremap K <Nop>
nnoremap M K

" jk で見た目通りに移動
nmap j gj
nmap k gk

nnoremap Y y$

" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Esc の2回押しでハイライト消去
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Tab window
nnoremap <silent> <C-w>t :tabnew<CR>
nnoremap <silent> <C-w><C-t> :tabnew<CR>
" nでprev, pでnextのほうがキーの位置的にしっくり
" cf.) <C-w>p - go to previous (last accessed) window
nnoremap <silent> <C-w>p gt
nnoremap <silent> <C-w><C-p> gt
" cf.) <C-w>n - open new window, N lines high
nnoremap <silent> <C-w>n gT
nnoremap <silent> <C-w><C-n> gT

" Command-line mode keymappings:
" <C-a>, A: move to head.
cnoremap <C-a>            <Home>
" <C-b>: previous char.
cnoremap <C-b>            <Left>
" <C-d>: delete char.
cnoremap <C-d>            <Del>
" <C-e>, E: move to end.
cnoremap <C-e>            <End>
" <C-f>: next char.
cnoremap <C-f>            <Right>
" <C-n>: next history.
cnoremap <C-n>            <Down>
" <C-p>: previous history.
cnoremap <C-p>            <Up>
" <C-y>: paste.
cnoremap <C-y>            <C-r>*
" <C-g>: Exit.
cnoremap <C-g>            <C-c>

" Leader
let g:mapleader = "\\"


"----------------------------------------------------------
" Commands:
"----------------------------------------------------------

command! Init source $MYVIMRC
command! Edit tabnew $MYVIMRC
command! Dein tabnew $TOML | vs $LAZY_TOML
command! Update call dein#update()

command! -nargs=1 -complete=file D vertical diffsplit <args>


"----------------------------------------------------------
" Binary:
"----------------------------------------------------------
" ref: https://rdera.hatenadiary.org/entry/20081022/1224682665

function! s:binary_readpost()
  if &binary
    silent %!xxd -g 1
    set ft=xxd
  endif
endfunction

function! s:binary_writepre()
  if &binary
    %!xxd -r
  endif
endfunction

function! s:binary_writepost()
  if &binary
    silent %!xxd -g 1
    set nomod
  endif
endfunction

autocmd vimrc BufReadPost * call s:binary_readpost()
autocmd vimrc BufWritePre * call s:binary_writepre()
autocmd vimrc BufWritePost * call s:binary_writepost()


"----------------------------------------------------------
" Neovim:
"----------------------------------------------------------

if has('terminal')
  tnoremap <Esc> <C-W>N
  command! V vs | terminal++curwin
elseif has('nvim')
  command! V vs | term
  set sh=zsh
  tnoremap <Esc> <C-\><C-n>
endif

