"外部関連
set nocompatible	"(viでなく)Vimのデフォルト設定にする
set noswapfile		"swapファイルを作らない
set noundofile		"undoファイルを作らない
set nobackup		"バックアップファイルを作らない
set encoding=UTF-8	"エンコードはUTF-8で
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

"表示関連
syntax on			"文字のハイライト
set ruler			"現在行の番号を表示
set number			"行番号
set title			"ファイル名表示
set tabstop=4		"インデントをスペース4つ分に
set shiftwidth=4	"自動生成されるインデントもスペース4つ分に
set smartindent		"オートインデント
set display=lastline
					"限界まですべて表示
set wrap			"ウィンドウ幅で折り返し
set pumheight=10	"補完メニューの最大長
set fileformats=unix,dos
					"自動認識させる改行コード指定
set cursorline		"現在行に下線をつける
hi clear CursorLine	"下線を打ち消し、行番号のみハイライト
					
"検索関連
set incsearch		"入力途中から検索を開始
set ignorecase		"大文字と小文字を区別せずに検索
set smartcase		"検索文字列に大文字があれば区別する
set wrapscan		"検索時、末尾まで行ったら最初に戻る

"keymap
inoremap <Leader>a <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w

nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

"NeoBundle
filetype off
if has('vim_starting')
	if &compatible
		set nocompatible "Be iMprioved
	endif
	
	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"ここからインストールしたいプラグインのリスト
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc' ,{
	\ 'build' : {
	\	'unix' : 'make -f make_unix.mak' ,
	\	}
	\}
if has('lua')
	NeoBundleLazy 'Shougo/neocomplete.vim',{
		\ 'depends' : 'Shougo/vimproc',
		\ 'autoload' : {'insert' : 1,}
		\}
endif
NeoBundle 'Align'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'
NeoBundleLazy 'Shougo/vimshell',{
	\ 'depends' : "Shougo/vimproc",
	\ 'autoload' : {
	\	'commands':[{ 'name' : 'VimShell','complete' : 'customlist,vimshell#complete'},
	\				'VimShellExecute','VimShellInteractive',
	\				'VimShellTerminal','VimShellPop'],
	\	'mappings':['<Plug>(vimshell_switch)']
	\}}
NeoBundle 'glidenote/memolist.vim'
NeoBundleLazy 'junegunn/vim-easy-align',{
	\	'autoload':{
	\		'commands':['EasyAlign'],
	\		'mappings':['<Plug>(EasyAlign)'],
	\}}
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundleLazy 'mattn/emmet-vim',{
	\'autoload':{
	\	'filetypes':['html','html5','eruby','jsp','xml','css','scss','coffee'],
	\	'commands':['<Plug>ZenCodingExpandNormal']
	\}}
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'vim-ruby/vim-ruby',{
	\ 'autoload' : { 'filetypes' : ['ruby','eruby'] }}
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'

"カラースキーム
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'


call neobundle#end()

" Required:
filetype plugin indent on

"If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"以下、NeoBundleで取得したプラグインの設定
"カラースキーム設定
colorscheme solarized
if &term =~ "xterm-256color" || "screen-256color"
	set t_Co=256
	set t_Sf=[3%dm
	set t_Sb=[4%dm
elseif &term =~ "xterm-color"
	set t_Co=8

	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'

"NERDTree関連
let NERDTreeShowHidden=1

"indent-guide関連
let g:indent_guides_enable_on_vim_startup=1

"neocomplete関連
let g:neocomplete#enable_at_startup=1
let g:neocomplete#auto_completion_start_length=3
let g:neocomplete#enable_ignore_case=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#enable_camel_case=1
let g:neocomplete#use_vimproc=1
let g:neocomplete#sources#buffer#cache_limit_size=1000000
let g:neocomplete#sources#tags#cache_limit_size=30000000
let g:neocomplete#enable_fuzzy_completion=1
let g:neocomplete#lock_buffer_name_pattern='\*ku\'

"vimshell
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>

"memolist
let g:memolist_path = expand('~/Dropbox/memo')
let g:memolist_memo_suffix = "txt"
map <Leader>mn :MemoNew<CR>
map <Leader>ml :MemoList<CR>
map <Leader>mg :MemoGrep<CR>

"easyalign
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"emmet
let g:use_emmet_complete_tag=1
let g:user_emmet_settings={
	\ 'lang' : 'ja',
	\ 'html' : {
	\ 'indentation' : '  '
	\ }}
