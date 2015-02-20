set vb t_vb=

if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Monospace\ 10
    " set guifont=Envy\ Code\ R\ Bold\ 11
    " set guifont=DejaVu\ Sans\ Mono\ 10
    set guifont=Envy\ Code\ R\ 8
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_kde")
    set guifont=Courier/11/-1/5/63/0/0/0/1/0
  else
    set guifont=Courier:h11:cDEFAULT
  endif
endif 

