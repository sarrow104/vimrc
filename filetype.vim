" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
    " Pascal / Delphi
    if exists("g:use_delphi_original_syntax") == 0
	au BufNewFile,BufRead *.pas,*.PAS set ft=delphi
    else
	au BufNewFile,BufRead *.pas,*.PAS set ft=pascal
    endif
    " Delphi project file
    au BufNewFile,BufRead *.dpr,*.DPR set ft=delphi
    au BufNewFile,BufRead *.sss       set ft=sss
    " Delphi form file
    au BufNewFile,BufRead *.dfm,*.DFM set ft=delphi
    au BufNewFile,BufRead *.xfm,*.XFM set ft=delphi
    " Delphi package file
    au BufNewFile,BufRead *.dpk,*.DPK set ft=delphi
    " Delphi .DOF file = INI file for MSDOS
    au BufNewFile,BufRead *.dof,*.DOF set ft=dosini
    au BufNewFile,BufRead *.kof,*.KOF set ft=dosini
    au BufNewFile,BufRead *.dsk,*.DSK set ft=dosini
    au BufNewFile,BufRead *.desk,*.DESK set ft=dosini
    au BufNewFile,BufRead *.dti,*.DTI set ft=dosini
    " Delphi .BPG = Makefile
    au BufNewFile,BufRead *.bpg,*.BPG set ft=make|setlocal makeprg=make\ -f\ %
    " end of Delphi

    au! BufRead,BufNewFile *.asa			set filetype=ciscoasa
    au! BufRead,BufNewFile *.crules			set filetype=ciscoacl
    au! BufRead,BufNewFile *.acl			set filetype=ciscoacl
    au! BufRead,BufNewFile *.cisco			set filetype=cisco

    "au! BufNewFile,BufRead *.cpp,*.cc			setf cpp
    au! BufNewFile,BufRead *.nsh,*.nsi			setf nsis
    au! BufNewFile,BufRead *.php			setf php
    " au! BufRead,BufNewFile *.sql,*.test,*.dump	setf mysql
    au! BufNewFile,BufRead *.mkd			setf mkd
    au! BufNewFile,BufRead *.tpl			setf tpl
    au! BufNewFile,BufRead *.au3			setf autoit
    au! BufNewFile,BufRead *.viki			setf viki
    au! BufNewFile,BufRead *.idx,index			setf index
    au! BufNewFile,BufRead *.etd			setf easytodo	" easy to do file !
    au! BufNewFile,BufRead *.zlg			setf ztxlog 	" zhongwen text log file !
    au! BufNewFile,BufRead *.vimprj,.vimprojects	setf vimprj
    " Automake
    au! BufNewFile,BufRead [mM]akefile.am		setf automake
    " Avenue
    au! BufNewFile,BufRead *.ave			setf ave
    au! BufNewFile,BufRead *.ps1,*.psc1			setf ps1
augroup END

