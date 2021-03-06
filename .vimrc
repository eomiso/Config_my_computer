
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

  " Autocmd group for default code when opening new code
  augroup defaultC
	au!
	autocmd FileType c call StandardIO()
	fu! StandardIO()
		if line("$") == 1
			call append(0, "#include <stdio.h>")
			call append(1, "#include <stdlib.h>")
			call append(3, "int main(void)")
			call append(4, "{")
			call append(5, "	")
			call append(6, "	return 0;")
			call append(7, "}")
		endif
	endfu
	autocmd FileType c set tabstop=4 shiftwidth=4 
  augroup END
  augroup defaultHTML
  au!
  autocmd FileType html setlocal tabstop=2 shiftwidth=2
  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"=======Key Mapping========================================================

" kj => esc, Escape insert mode
inoremap df <ESC>

"=======OS Integrity ======================================================
set clipboard=unnamed "use OS clipboard

"=======Workspace screen===================================================
set number
"=======Default code when opening new source file =========================
