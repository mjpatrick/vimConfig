let Tlist_Ctags_Cmd = '/usr/bin/ctags'
au BufNewFile,BufRead *.cpp set syntax=cpp11
runtime download/matchit.vim
"XXX map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
let g:miniBufExplModSelTarget = 1 
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	"XXX add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		"XXX else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
syntax enable
colorscheme molokai
set cindent shiftwidth=2
set tabstop=2
set expandtab
retab!
set vb t_vb=
set number
set hlsearch
set incsearch
filetype indent on
if has("gui_running")
	if has("gui_gtk2")
		"set guifont=Monospace\ 10
		set guifont=Envy\ Code\ R\ 11
	elseif has("x11")
		set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
	elseif has("gui_kde")
		set guifont=Courier/11/-1/5/63/0/0/0/1/0
	else
		set guifont=Courier:h11:cDEFAULT
	endif
endif 

"XXX set tags=/home/mpatrick/tagsEDENscosPI,/home/mpatrick/tagsS2k-31,/home/mpatrick/tagsEGSEBB
