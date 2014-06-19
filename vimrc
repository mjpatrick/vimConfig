call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
runtime download/matchit.vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
let g:miniBufExplModSelTarget = 1 
colorscheme molokai_mjp
set cindent shiftwidth=2
set tabstop=2
set expandtab
retab!
set vb t_vb=
set number
set hlsearch
set incsearch
set nocp
au BufNewFile,BufRead *.cpp set syntax=cpp11
"set tags=/home/mpatrick/workspace/223_EMBEDDED/os/kernel/linux-2.6.21.1-leon23-1.0.6/tags
"XXX map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"
"Set clang library path
let g:clang_library_path='/usr/lib64'

function! CHANGE_CURR_DIR()
	let _dir = expand("%:p:h")
	if _dir !~ '^/tmp'
		exec "cd " . _dir
		exec "cd %:p:h"
	endif
	unlet _dir
endfunction

autocmd BufEnter * call CHANGE_CURR_DIR()

set nocompatible                " want vim, not vi; must be first, because it changes other options

let &statusline="%f%< %y[%{&fileencoding}/%{&encoding}/%{&termencoding}][%{&fileformat}](%n)%m%r%w %a%=%b 0x%B  L:%l/%L, C:%-7(%c%V%) %P"

function FT_vhdl()
	setlocal tabstop=4
	setlocal shiftwidth=4
	if exists("+omnifunc")
		setlocal omnifunc=syntaxcomplete#Complete
	endif
	setlocal makeprg=gmake
	setlocal errorformat=**\ Error:\ %f(%l):\ %m
	let g:vhdl_indent_genportmap=0
	map <buffer> <F4> :execute ':!vsim -c -do "run -all;exit" '.expand("%:t:r")<CR>
	"XXX for taglist
	let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
	"XXX command mappings for perl scripts
	:command! -nargs=1 -complete=file VHDLcomp r! ~/.vhdl/vhdl_comp.pl <args>
	:command! -nargs=1 -complete=file VHDLinst r! ~/.vhdl/vhdl_inst.pl <args>
	"XXX environments
	imap <buffer> <C-e>e <Esc>bdwientity <Esc>pa is<CR>end entity ;<Esc>POport (<CR>);<Esc>O
	imap <buffer> <C-e>a <Esc>b"zdwiarchitecture <Esc>pa of <Esc>mz?entity<CR>wyw`zpa is<CR>begin<CR>end architecture ;<Esc>"zPO
	imap <buffer> <C-e>p <Esc>bywA : process ()<CR>begin<CR>end process ;<Esc>PO<+process body+><Esc>?)<CR>i
	imap <buffer> <C-e>g <Esc>bdwipackage <Esc>pa is<CR><BS>end package ;<Esc>PO    
	imap <buffer> <C-e>c case  is<CR>when <+state1+> =><CR><+action1+><CR>when <+state2+> =><CR><+action2+><CR>when others => null;<CR>end case;<Esc>6k$2hi
	imap <buffer> <C-e>i if  then<CR><+do_something+>;<CR>elsif <+condition2+> then<CR><+do_something_else+>;<CR>else<CR><+do_something_else+>;<CR>end if;<Esc>6k$4hi
	"XXX shortcuts
	imap <buffer> ,, <= 
	imap <buffer> .. => 
	imap <buffer> <C-s>i <Esc>:VHDLinst 
	imap <buffer> <C-s>c <Esc>:VHDLcomp
	"XXX visual mappings
	vmap <C-a> :!~/.vhdl/vhdl_align.py<CR>
	vmap <C-d> :!~/.vhdl/vhdl_align_comments.py<CR>
	"XXX alt key mappings
	imap <buffer> <M-i> <Esc>owhen 
	"XXX abbreviations
	iabbr dt downto
	iabbr sig signal
	iabbr gen generate
	iabbr ot others
	iabbr sl std_logic
	iabbr slv std_logic_vector
	iabbr uns unsigned
	iabbr toi to_integer
	iabbr tos to_unsigned
	iabbr tou to_unsigned
	imap <buffer> I: I : in 
	imap <buffer> O: O : out 
	"XXX emacs vhdl mode
	"XXX warning: the following is dangerous, becase the file is written and then opened again, which means, the undo history is lost; if someting goes wrong, you may loose your file
	"XXXcommand! EVMUpdateSensitivityList :w|:execute "!emacs --no-init-file --no-site-file -l ~/.vhdl/vhdl-mode.el -batch % --eval '(vhdl-update-sensitivity-list-buffer)' -f save-buffer" | :e
	"XXXmap <F12> :EVMUpdateSensitivityList<CR>
endfunction

"XXX load templates
function Template_Load(filename)
	if a:filename =~ "\.vhd$"
		0r ~/.templates/vhdl
	endif
endfunction

au BufEnter *.{c,cpp,cc,h,hpp,py,tex,vhd} call TagTitle()
function TagTitle()
	if exists(":TlistUpdate")       " show current tag in title
		TlistUpdate
		set titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
	endif
endfunction

let g:syntastic_cpp_compiler_options = ' -std=c++11'
set statusline+=%F
