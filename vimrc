call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
runtime! plugin/sensible.vim

set nocompatible                " want vim, not vi; must be first, because it changes other options
set cindent shiftwidth=2
set tabstop=2
set expandtab
set vb t_vb=
set number
set hlsearch
set statusline+=%F
"set tags=/home/mpatrick/workspace/223_EMBEDDED/os/kernel/linux-2.6.21.1-leon23-1.0.6/tags
"XXX map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Auto_Open = 1

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
let g:miniBufExplModSelTarget = 1 

"Set clang library path
let g:clang_library_path='/usr/lib/llvm-3.6/lib'

let &statusline="%f%< %y[%{&fileencoding}/%{&encoding}/%{&termencoding}][%{&fileformat}](%n)%m%r%w %a%=%b 0x%B  L:%l/%L, C:%-7(%c%V%) %P"

let g:syntastic_cpp_compiler_options = ' -std=c++14'
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1

colorscheme molokai_mjp
retab!
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.pro set syntax=qmake

function TagTitle()
	if exists(":TlistUpdate")       " show current tag in title
		TlistUpdate
		set titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
	endif
endfunction

au BufEnter *.{c,cpp,cc,h,hpp,py,tex,vhd} call TagTitle()


