" User definitions ==========================================================

scriptencoding utf-8
"set encoding=utf-8
"set termencoding=utf-8

""设置中文环境
"if has("unix")
"    lan zh_CN.UTF-8
"else
"    lan Chinese_China
"endif
"lan mes zh_CN.UTF-8

if $TERM=='cygwin'
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    set encoding=utf8
    set nobackup
    set wildmenu
    set expandtab
    set tabstop=2
    set shiftwidth=2
    set scrolloff=5
    set completeopt=menu
    set tags+=/share/ctags/.tags
    colorscheme desert256

    let OmniCpp_MayCompleteScope = 1
    let OmniCpp_ShowPrototypeInAbbr = 1

    map  <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    map  <Esc>[7~ <Home>
    map  <Esc>[8~ <End>
    imap <Esc>[7~ <Home>
    imap <Esc>[8~ <End>
    finish
endif

" Indert empty Line here
" http://stackoverflow.com/questions/598113/can-terminals-detect-shift-enter-or-control-enter
" 这里提到，可以先在终端中的vim，实验插入模式，实际插入的字符是上面(先按<C-V>转义)
" 然后，用实际输出字符，替换"失灵"快捷键设置即可；
if !has('gui_running')
    vnoremap y "+y
endif

let mapleader = ","

" Vundle stuffes {{{1
" vundle 2015-04-29
set nocompatible                           " be iMproved, required

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle
" required!
Plugin 'sarrow104/Vundle.vim'

" Sample:
" Plugin 'L9'                  " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'tpope/vim-fugitive'  " plugin on GitHub repo
" Plugin 'git://git.wincent.com/command-t.git' " Git plugin not hosted on GitHub
" Plugin 'file:///home/gmarik/path/to/plugin' " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  " The sparkup vim script is in a subdirectory of this repo called vim.
"                                             " Pass the path to set the runtimepath properly.
" Plugin 'user/L9', {'name': 'newL9'} " Avoid a name conflict with L9

" sematic-utils
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/MatchTagAlways'
Plugin 'majutsushi/tagbar'

" golang
Plugin 'fatih/vim-go.git' " https://github.com/fatih/vim-go.git

" Lua support
Plugin 'tbastos/vim-lua'        " https://github.com/tbastos/vim-lua
Plugin 'xolox/vim-lua-ftplugin' " https://github.com/xolox/vim-lua-ftplugin

" Refactor for C, C++, Java, Pascal, VimL.
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/lh-tags'
Plugin 'LucHermitte/lh-dev'
"Plugin 'LucHermitte/lh-brackets' " NOTE: 定义了 '' 这种扩单引号的快捷键，与系统自带的回退编辑点功能冲突
Plugin 'LucHermitte/vim-refactor'

"" vimshell+vimproc
Plugin 'Shougo/vimshell.vim' " need 'Shougo/vimproc.vim'

" Emmet - zencoding
Plugin 'mattn/emmet-vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" gdb with vim
Plugin 'Shougo/vimproc.vim' " https://github.com/Shougo/vimproc.vim
Plugin 'idanarye/vim-vebugger' " https://github.com/idanarye/vim-vebugger

Plugin 'myusuf3/numbers.vim' " https://github.com/myusuf3/numbers.vim

" NOTE: 这是备份自
" https://github.com/lilydjwg/dotvim/blob/master/plugin/escalt.vim
Plugin 'WinterXMQ/escalt.vim' " https://github.com/WinterXMQ/escalt.vim

" text UML preview tool
Plugin 'scrooloose/vim-slumlord' " https://github.com/scrooloose/vim-slumlord

" my-scripts
Plugin 'sarrow104/util.vim.git' " util#MySys()
Plugin 'sarrow104/msg.vim.git' " msg#xxx()
Plugin 'sarrow104/font.vim'
Plugin 'sarrow104/include-complete.vim.git'
Plugin 'sarrow104/index.vim'
Plugin 'sarrow104/fencview.vim.git' "github上原本是vim-scripts管理，不知道为什么失效了，我只能自己创建一个了
Plugin 'sarrow104/toggle.vim.git'
Plugin 'sarrow104/txt.vim.git'
Plugin 'sarrow104/system.vim.git'
Plugin 'sarrow104/pairpunct.vim.git'
Plugin 'sarrow104/make.vim.git'
Plugin 'sarrow104/tags.vim.git'
Plugin 'sarrow104/gensketch.vim.git'
Plugin 'sarrow104/simple-cmake.vim.git'

" colorscheme & syntax highlighting
Plugin 'tomasr/molokai.git' " https://github.com/tomasr/molokai.git
Plugin 'mhartington/oceanic-next'
Plugin 'Yggdroot/indentLine' " 显示代码缩进级别的插件；需要随时计算，可能有些慢
Plugin 'Raimondi/delimitMate'
Plugin 'andrwb/vim-lapis256'
Plugin 'vim-jp/vim-cpp.git' " not so usefull. sad
Plugin 'ArkBriar/vim-qmake' " .pro
" Plugin 'jalcine/cmake.vim'
Plugin 'richq/vim-cmake-completion' " TODO 增加 CMAKE_xxx <c-x><c-k>补全
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'plasticboy/vim-markdown'
" NOTE:
" 下面这个插件，使用不当，容易系统卡死；所以……
"Plugin 'suan/vim-instant-markdown' " preview at realtime this need a globle nodejs plugin
" Plugin 'jansenm/vim-cmake' " depends on -> neocompletecache not so good

" utility tools
"Plugin 'Chiel92/vim-autoformat' " https://github.com/Chiel92/vim-autoformat
Plugin 'rhysd/vim-clang-format' " https://github.com/rhysd/vim-clang-format
Plugin 'vim-utils/vim-man' " https://github.com/vim-utils/vim-man

" NOTE: need SQL-workbench/J ultily
"Plugin 'cosminadrianpopescu/vim-sql-workbench' " https://github.com/cosminadrianpopescu/vim-sql-workbench
Plugin 'vim-scripts/dbext.vim' " https://github.com/vim-scripts/dbext.vim
Plugin 'vim-scripts/SQLComplete.vim' " https://github.com/vim-scripts/SQLComplete.vim
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim' " needed by vimfiler
Plugin 'Shougo/vimfiler.vim'
" Buffer and status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dyng/ctrlsf.vim' " Search tool; using ack, ag or pt
Plugin 'hynek/vim-python-pep8-indent' " Pythonindent 2016-05-22
Plugin 'terryma/vim-multiple-cursors'
Plugin 'lilydjwg/fcitx.vim.git'
Plugin 'vim-scripts/mru.vim.git'
Plugin 'dimasg/vim-mark'
" needed by vim-session
Plugin 'xolox/vim-misc'
" 支持 NERDTree 恢复的session管理工具
Plugin 'xolox/vim-session'
Plugin 'junegunn/vim-easy-align.git'
Plugin 'godlygeek/tabular'
Plugin 'qpkorr/vim-renamer'
Plugin 'Kris2k/A.vim'
Plugin 'vim-scripts/doxygen-support.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'edsono/vim-matchit' " enhenced noremap %
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-speeddating' " https://github.com/tpope/vim-speeddating.git
Plugin 'aur-archive/vim-stlrefvim' " https://github.com/aur-archive/vim-stlrefvim
Plugin 'vim-scripts/CRefVim' " https://github.com/vim-scripts/CRefVim
Plugin 'easymotion/vim-easymotion' " 类似浏览器alt + 数字 调整到具体widget的快速跳转功能
Plugin 'will133/vim-dirdiff' " 目录比较工具
" https://github.com/Chiel92/vim-autoformat

" Unknown
Plugin 'ashisha/image.vim' " what for ?
"Plugin 'marijnh/tern_for_vim'

" ctrlp file serching tool
" Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'

if has('gui_running')
    " utility tools devicons must the last!
    Plugin 'ryanoasis/vim-devicons' " Powerline(air-line), Nerd Font
endif

" @ Plugin --- [ Code Sreach ]
Plugin 'rking/ag.vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'junegunn/limelight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""}}}

" 'vim-utils/vim-man' " https://github.com/vim-utils/vim-man {{{1
if globpath(&rtp, 'plugin/man.vim') != ""
    " - open man page for word under cursor in a horizontal split
    map <leader>M <Plug>(Man)
    " - open man page for word under cursor in a vertical split
    map <leader>V <Plug>(Vman)
endif

" 'Chiel92/vim-autoformat' " https://github.com/Chiel92/vim-autoformat {{{1
if globpath(&rtp, 'plugin/autoformat.vim') != ""
    let g:formatterpath = ['/usr/bin/clang-format-3.8']
endif

" 'rhysd/vim-clang-format' "https://github.com/rhysd/vim-clang-format
if globpath(&rtp, 'plugin/clang_format.vim') != ""
    let g:clang_format#command='/usr/bin/clang-format-3.8'
    "let g:clang_format#extra_args=''
    "let g:clang_format#detect_style_file='.clang-format'
    let g:clang_format#auto_format=1
    let g:clang_format#auto_format_on_insert_leave=0

    let g:clang_format#auto_formatexpr=1
    set textwidth=0
    " You must set textwidth to 0 when the formatexpr is set.

    let g:clang_format#code_style='google' " possible value list [llvm, google, chromium, mozilla]

    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -4,
                \ "AllowShortIfStatementsOnASingleLine" : "true",
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "Standard" : "C++11",
                \ "BreakBeforeBraces" : "Stroustrup"}

    " map to <Leader>cf in C++ code
    " autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    " autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

    autocmd FileType c,cpp,objc nnoremap <buffer>= :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer>= :ClangFormat<CR>

    " if you install vim-operator-user
    "autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

    " Toggle auto formatting:
    "nmap <Leader>C :ClangFormatAutoToggle<CR>
endif

" dimasg/vim-mark " {{{1
if globpath(&rtp, 'plugin/ctrlsf.vim') != "" && !globpath(&rtp, 'plugin/mark.vim') != ""
    nmap <unique> <Leader>m/ <Plug>MarkSearchAnyNext
    nmap <unique> <Leader>m? <Plug>MarkSearchAnyPrev
endif

" dyng/ctrlsf.vim " Search tool; using ack, ag or pt {{{1
" NOTE: 不知道怎么回事，
" noremap <C-/> 竟然无法使用！(<C-1>也不行；<C-a>可行)；执行 :normal <C-/>
" 也不行！
" 奇葩的是，execute "normal \<C-/>" 这样手动调用，就可以了？
" 调用的，竟然是 'easymotion/vim-easymotion' 的 / 动作！
" 注意 <A-/> 在终端，貌似是无法触发的……
"
" 原来，vim无法将 <C-/>用作快捷键；
" http://vim.1045645.n5.nabble.com/How-to-map-Ctrl-td1192843.html
"
" 另外一个印证：
" i_<C-V>_<C-/> 将得到的是 /；即，仍然触发 / 动作。
" 有解决办法不？
"
" https://groups.google.com/forum/#!topic/vim_use/ypPtU10KObA
"
" 另外，用<C-_>来替换 <C-/> 只在某些情况(终端)下有效。
" http://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
"
" TODO 应该对查找的发生位置，设定一个保险——避免在根目录、home目录进行查找！
if globpath(&rtp, 'plugin/ctrlsf.vim') != ""
    noremap <leader>/ :silent execute("CtrlSF " . expand("<cword>"))<CR>
endif

" fatih/vim-go.git  " https://github.com/fatih/vim-go.git {{{1
if globpath(&rtp, 'plugin/go.vim') != ""
    let g:go_disable_autoinstall = 0

    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
endif

" 'xolox/vim-lua-ftplugin' "  {{{1
if globpath(&rtp, 'plugin/lua-ftplugin.vim') != ""
    let g:lua_complete_omni = 1
    " Here's the black list:
    let g:lua_omni_blacklist = ['pl\.strict', 'lgi\..']

    "" Here's the resulting regular expression pattern:
    "'^\(pl\.strict\|lgi\..\)$'
endif

" 'majutsushi/tagbar' " {{{1
" ctags-exuberant
"let g:tagbar_type_go = {
"    \ 'ctagstype': 'go',
"    \ 'kinds' : [
"        \'p:package',
"        \'f:function',
"        \'v:variables',
"        \'t:type',
"        \'c:const'
"    \]
"\}

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '$GOPATH/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" 'myusuf3/numbers.vim' " {{{1
if globpath(&rtp, 'plugin/numbers.vim') != ""
    let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
endif

" 'idanarye/vim-vebugger' {{{1
if globpath(&rtp, 'plugin/vebugger.vim') != ""
    let g:vebugger_view_source_cmd='edit'
    let g:vebugger_leader='<Leader>x'

    command! -nargs=+ -complete=file GDB call vebugger#gdb#start([<f-args>][0], {'args':[<f-args>][1:]})

    " i      |:VBGstepIn|
    " o      |:VBGstepOver|
    " O      |:VBGstepOut|
    " c      |:VBGcontinue|
    "
    " b      |:VBGtoggleBreakpointThisLine|
    " B      |:VBGclearBreakpoints|
    "
    " e      |:VBGevalWordUnderCursor| in normal mode
    "        |:VBGevalSelectedText| in select mode
    " E      Prompt for an argument for |:VBGeval|
    "
    " x      |:VBGexecute| current line in normal mode.
    "        |:VBGexecuteSelectedText| in select mode
    " X      Prompt for an argument for |:VBGexecute|
    "
    " t      |:VBGtoggleTerminalBuffer|
    " r      Select mode only - |:VBGrawWriteSelectedText|
    " R      Prompt for an argument for |:VBGrawWrite|
endif

" YouCompleteMe {{{1
if globpath(&rtp, 'plugin/youcompleteme.vim') != ""
    " FIXME
    " ycm的跳转有bug！
    " GoToDeclaration GoToDefinition
    "
    " 当同一个源文件，有两个类，并且有同名的方法的时候，上面的这种跳转可能会识别到不同类的方法名上面去！
    nnoremap <C-F5> :YcmForceCompileAndDiagnostics<CR>
    nnoremap <C-F4> :YcmDiags<CR>

    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

    " NOTE:，某些语言，比如golang，并不支持下面这个命令！（golang import
    " 的是文件夹，而不是某特定的文件……）
    nnoremap <leader>go :YcmCompleter GoToInclude<CR>

    " NOTE: 仅支持 'c, cpp, objc, objcpp, cs, python, typescript, javascript'
    " - The type or declaration of identifier,
    " - Doxygen/javadoc comments,
    " - Python docstrings,

    nnoremap <leader>gd :YcmCompleter GetDoc<CR>

    " NOTE: 以command-line message的方式，显示当前标识符的具体类型
    nnoremap <leader>gt :YcmCompleter GetType<CR>

    nnoremap <leader>gL :split<bar>YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gF :split<bar>YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gG :split<bar>YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gO :split<bar>YcmCompleter GoToInclude<CR>

    " let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm/cpp/.ycm_extra_conf.py'

    let g:ycm_error_symbol = '>>'
    let g:ycm_warning_symbol = '>*'

    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'pandoc' : 1,
                \ 'infolog' : 1,
                \ 'mail' : 1,
                \ 'mundo': 1,
                \ 'fzf': 1,
                \ 'ctrlp' : 1,
                \ 'vim' : 1,
                \ 'make': 1
                \}

    " 补全按键，YCM默认是'<C-Space>'
    let g:ycm_key_invoke_completion = '<C-j>'
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

    let g:SuperTabDefaultCompletionType = '<C-n>'

    "Do not ask when starting vim
    let g:ycm_confirm_extra_conf = 0
    "let g:ycm_autoclose_preview_window_after_completion=1

    let g:syntastic_always_populate_loc_list = 1

    " make YCM read identifiers from my tags files
    let g:ycm_collect_identifiers_from_tags_files = 1

    command! -nargs=0 GenYcmConfig		call writefile(readfile(expand(g:ycm_global_ycm_extra_conf), 'b'), getcwd()."/.ycm_extra_conf.py", 'b')

    let g:ycm_python_binary_path = '/usr/bin/python3'
    " NOTE:
    " 前后跳转，使用 <C-o> 和 <C-i>

    " TODO
    " 如何保证，在弹出补全窗口，或者无法补全的时候，<C-u>仍然可以删除之前的字符？
    "    exe 'inoremap <expr>' . key .
    "          \ ' pumvisible() ? "\<C-p>" : "\' . key .'"'
endif

" Yggdroot/indentLine ----------------------------------------------------------{{{1
if globpath(&rtp, 'plugin/indentLine.vim') != ""
    " NOTE: 缩进级别计算的语言类型，最好限制为程序语言，特别是一行不长的
    let g:indentLine_fileType = ['c', 'cpp', 'vim']
    let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
endif

" DoxygenToolkit ---------------------------------------------------------------{{{1
if globpath(&rtp, 'plugin/DoxygenToolkit.vim') != ""
    let g:DoxygenToolkit_authorName="sarrow, 549506937@qq.com"
    let s:licenseTag = "Copyright(C)\<enter>"
    let s:licenseTag = s:licenseTag . "For free\<enter>"
    let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
    let g:DoxygenToolkit_licenseTag = s:licenseTag
    let g:DoxygenToolkit_briefTag_funcName="yes"
    let g:doxygen_enhanced_color=1
    let g:DoxygenToolkit_commentType="Qt"
endif

" vim-devicons -------------------------------------------{{{1
if globpath(&rtp, 'plugin/webdevicons.vim') != ""
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 11
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
    let g:webdevicons_conceal_nerdtree_brackets = 1
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
    set encoding=utf-8
endif

" vim-airline new 2016-07-14---------------------------------------------------------------{{{1
if globpath(&rtp, 'plugin/airline.vim') != ""
    let g:airline_theme="badwolf"
    let g:airline_powerline_fonts = 1
    "let g:airline_section_b = '%{strftime("%c")}'
    "let g:airline_section_y = 'BN: %{bufnr("%")}'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    " new 2016-07-14
endif

" vim-airline old 2016-07-14---------------------------------------------------------------{{{1
"  let g:airline#extensions#tabline#enabled = 1
"  set hidden
"  let g:airline#extensions#tabline#fnamemod = ':t'
"  let g:airline#extensions#tabline#show_tab_nr = 1
"  "let g:airline_powerline_fonts = 1
"  "let g:airline_theme='oceanicnext'
"  cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
"  " tmap is not vim command?
"  "tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
"  nmap <leader>t :term<cr>
"  nmap <leader>, :bnext<CR>
"  "tmap <leader>, <C-\><C-n>:bnext<cr>
"  nmap <leader>. :bprevious<CR>
"  "tmap <leader>. <C-\><C-n>:bprevious<CR>
"  let g:airline#extensions#tabline#buffer_idx_mode = 1
"  nmap <leader>1 <Plug>AirlineSelectTab1
"  nmap <leader>2 <Plug>AirlineSelectTab2
"  nmap <leader>3 <Plug>AirlineSelectTab3
"  nmap <leader>4 <Plug>AirlineSelectTab4
"  nmap <leader>5 <Plug>AirlineSelectTab5
"  nmap <leader>6 <Plug>AirlineSelectTab6
"  nmap <leader>7 <Plug>AirlineSelectTab7
"  nmap <leader>8 <Plug>AirlineSelectTab8
"  nmap <leader>9 <Plug>AirlineSelectTab9
" old 2016-07-14

  "if !exists('g:airline_symbols')
  "  let g:airline_symbols = {}
  "endif

  "" unicode symbols
  "let g:airline_left_sep = '»'
  "let g:airline_left_sep = '▶'
  "let g:airline_right_sep = '«'
  "let g:airline_right_sep = '◀'
  "let g:airline_symbols.crypt = '🔒'
  "let g:airline_symbols.linenr = '␊'
  "let g:airline_symbols.linenr = '␤'
  "let g:airline_symbols.linenr = '¶'
  "let g:airline_symbols.branch = '⎇'
  "let g:airline_symbols.paste = 'ρ'
  "let g:airline_symbols.paste = 'Þ'
  "let g:airline_symbols.paste = '∥'
  "let g:airline_symbols.whitespace = 'Ξ'
" set statusline=%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{pathshorten(simplify(getcwd()))}%=(0x%B)(%L\|%c%V)%P%<
""}}}

" UltiSnips  " {{{1
if globpath(&rtp, 'plugin/UltiSnips.vim') != ""
    "let g:UltiSnipsJumpForwardTrigger="<c-j>"
    "let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsEditSplit="context"
    let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
    let g:UltiSnipsListSnippets="<c-e>"
endif
" delimitMate " {{{1
if globpath(&rtp, 'plugin/delimitMate.vim') != ""
    " disable delimitMate
    let loaded_delimitMate = 1
    au FileType text let b:loaded_delimitMate = 1
endif
" NERDTree ------------------------------------------------------------------{{{1

if globpath(&rtp, 'plugin/NERD_tree.vim') != ""
    map <C-\> :NERDTreeToggle<CR>
    noremap <F4> :NERDTreeFind<CR>
    autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    "let NERDTreeShowHidden=1
    let g:NERDTreeWinSize=24
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeCascadeOpenSingleChildDir=0

    command -nargs=0 NERDTreeHere	silent execute 'NERDTree '.expand("%:h")

    "" NERDTress File highlighting
    "  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    "  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    "  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    "  endfunction
    "
    "  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
    "  call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
    "  call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
    "  call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
    "  call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
    "  call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
    "  call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
    "  call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
    "  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
    "  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
    "  call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
    "  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
    "  call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
    "  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')
endif

"suan/vim-instant-markdown {{{1
" let g:instant_markdown_slow = 1
"
" https://github.com/vim-scripts/doxygen-support.vim {{{1
if globpath(&rtp, 'plugin/doxygen-support.vim') != ""
    let g:load_doxygen_syntax=1
endif

" MatchTagAlways {{{1
if globpath(&rtp, 'plugin/MatchTagAlways.vim') != ""
    let g:mta_use_matchparen_group = 1 " default : 1

    " default: { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1 }
    let g:mta_filetypes = {
                \ 'html' : 1,
                \ 'xhtml' : 1,
                \ 'xml' : 1,
                \ 'jinja' : 1,
                \}

    let g:mta_use_matchparen_group = 1 " default: 1

    let g:mta_set_default_matchtag_color = 1 " default : 1

    nnoremap <leader>% :MtaJumpToOtherTag<cr>
endif

" EasyMotion {{{1
if globpath(&rtp, 'plugin/EasyMotion.vim') != ""
    let g:EasyMotion_skipfoldedline = 0
    " https://github.com/easymotion/vim-easymotion/issues/223
    " There are option named :h <Over>(em-openallfold) which open all fold when searching. I guess it helps this problem.
    " 但是，上面这个选项，如何使用？

    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap <Leader>s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

    " Gif config
    "noremap  / <Plug>(easymotion-sn)
    "omap  / <Plug>(easymotion-sn)

    " Old:
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)

    " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
    " Without these mappings, `n` & `N` works fine. (These mappings just provide
    " different highlight method and have some other features )
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)

    map <Leader>w <Plug>(easymotion-iskeyword-w)
    map <Leader>b <Plug>(easymotion-iskeyword-b)

    " Gif config
    "map <Leader>l <Plug>(easymotion-lineforward) " 与ycm的语法错误列表冲突
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)

    "noremap ** :execute 'normal /'.expand("<cword>").'\<CR>\<CR>'
    " NOTE: 为了 避免和 vim-mark 冲突，这里使用双写的办法……
    noremap ** /=expand("<cword>")<CR><CR>
    noremap ## ?=expand("<cword>")<CR><CR>

    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
endif

" junegunn/vim-easy-align {{{1
if globpath(&rtp, 'plugin/easy_align.vim') != ""
    "xmap <leader>ga <Plug>(EasyAlign)
    vnoremap ga <Plug>(EasyAlign)
endif

" https://github.com/ArkBriar/vim-qmake .pro " {{{1
if globpath(&rtp, 'syntax/qmake.vim') != ""
    au BufRead *.qrc setfiletype xml
    au BufRead *.pro setfiletype qmake
endif

" doxygensupport {{{1
let g:Doxy_GlobalTemplateFile = '~/.vim/bundle/doxygen-support.vim/doxygen-support/templates/doxygen.templates'
"}}}

" Global setting					{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2014-12-20 mksession ~/xxx.vim	{{{2
set number
set relativenumber
set sessionoptions+=curdir

" NOTE: 2016-09-05
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:~\")})%)%(\ %a%)\ -\ %{v:servername}\ %{fnamemodify(v:this_session,\":p:~\")}

"autocmd FocusLost *          :set number norelativenumber
"autocmd FocusGained *        :set number relativenumber

" NOTE mks 后面的字符串，不能以"括起来——mks会认为后面是注释，而使用
" Session.vim……
function MakeSession(session_name)
    let l:session_name = (v:this_session == '' ? '~/last.vim' : v:this_session)
    if a:session_name != ''
        let l:session_name = '~/' . a:session_name . '.vim'
    endif

    " Sarrow: 2016-07-14
    " 由于 mks 和 NERDTree 不搭:
    "" https://github.com/jistr/vim-nerdtree-tabs/issues/65
    tablast
    while 1
        silent execute ' NERDTreeClose'
        if tabpagenr() == 1
            break
        endif
        tabprevious
    endwhile

    silent execute ' mks! ' . l:session_name
endfunction

function MakeSesionInfo()
    execute 'echomsg  v:this_session'
endfunction

command! -nargs=?	MKS	        call MakeSession(<q-args>)
" NOTE
" 参考　FontInfo
" ~/Sarrow104@github/vim/font.vim/autoload/font.vim|152
" 貌似只有包装进 function call 之后，echomsg的显示，才会保留在提示栏
"command! -nargs=0	MKSInfo	    echomsg  v:this_session
command! -nargs=0	MKSInfo	    call MakeSesionInfo()
"command! -nargs=0	MKS	silent execute ' mks! '. (v:this_session == '' ? '~/last.vim' : v:this_session) . ''
" mks d:\Program Files\vim\home\problem.vim

if globpath(&rtp, 'plugin/session.vim') != ""
    command! -bar -bang -nargs=? -complete=customlist,xolox#session#complete_names_with_suggestions SS call xolox#session#save_cmd(<q-args>, <q-bang>, 'SaveSession')
    command! -bar -bang -nargs=? -complete=customlist,xolox#session#complete_names OS call xolox#session#open_cmd(<q-args>, <q-bang>, 'OpenSession')
endif

" 使用英文菜单,工具条及消息提示
set langmenu=none

" NOTE: using :X for prompting to enter an encryption key
if v:version >= 703
    set cryptmethod=blowfish
endif

" Sarrow:2011-12-29
set mouse=a				" 让vim在终端中也能处理鼠标
" End:

set whichwrap+=<,>,h,l                  " 跨行首尾，移动光标
set fillchars=vert:\ ,stl:\ ,stlnc:\

set background=dark
set autoindent                          " Auto-indent on

set tabpagemax=15 			" 最多15个标签
set showtabline=1			" 0: noshow tab line; 1: show when 2 or more tabs; 2: always

set hlsearch				" High-Light Search on

set noswapfile                          " No swap file, use memory only
set display=lastline
set wildmode=longest,full		" Cmd-line completion
set wildmenu
"" Browse Mode Setting
set nostartofline                       " Keep cursor column when moving

set showcmd				" Show commond line
set cmdheight=1                         " lines for command window
"" Status Bar Setting
set laststatus=2                        " Always show status line

" Sarrow:2008-11-01,from:http://forum.ubuntu.org.cn/viewtopic.php?f=68&t=159467
"set statusline=%.30f%3m%r%h%w\ [%{&fileformat},%{&fileencoding}]\ [%Y]\ [HEX=\%04.4B]\ [%4l/%L,%3v][%2p%%]
"set statusline=%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}%=(%b,0x%B)(%l\/%L\|%c%V)%P%<
" 2010-10-31
"set statusline=%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{pathshorten(simplify(getcwd()))}%=(0x%B)(%L\|%c%V)%P%<

"" Howto Fold text default: start with {{{ end with }}}}
set nofoldenable
set foldmethod=marker			" fold method to marker
" set foldmethod=syntax
" set foldlevel=1

"" Inner Search Mode
set incsearch				" Increase search ON

"" The <Backspace> Behavior
set backspace=indent,eol,start          " Backspace over everyting

"" Maxmum Commands to be saved
set history=50                          " Save at most 50 commands

"" GUI Frame Setting
set guioptions-=L           		" No left hand scrollbars
set guioptions-=r           		" No right hand scrollbars
set guioptions-=T           		" No Toolbar
"set guioptions-=m          		" No menu bar

set autoread                 " 自动重新加载外部修改内容
"set autochdir               " 自动切换当前目录为当前文件所在的目录

set noerrorbells		" 去掉恼人的蜂鸣声
"set visualbell t_vb=
set novisualbell t_vb=

set winaltkeys=no

set hidden                      " allow to cycle and hide modified buffers
set lazyredraw                  " [VIM5];  do not update screen while executing macros

" visual-diff
set diffopt=filler,context:5,iwhite
set report=0                    " show a report when N lines were changed.
                                " report=0 thus means "show all changes"!

" set showmatch                   " Show the matching bracket for the last ')'?

" Suffixes to ignore in file completion
set suffixes=.bak,~,.swp,.o ",.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.cmi,.cmo

"打开拼写检查：
":set spell
"
"关闭拼写检查：
":set nospell
"
"另外还有一些相关的命令：
"	]s  : 将光标移到下一个拼写错误处
"	[s  : 将光标移到上一个拼写错误处
"	zg  : 将单词加入词典
"	zug : 撤销将单词加入词典
"	z=  : 拼写建议

if &term == "win32"		" terminal encoding {{{2
    " this is for win32 console only!
    set encoding=cp936
else
    set encoding=utf-8
endif

"用于新建文件
setglobal fileencoding=chinese	" {{{2

"" Multi-encoding setting, MUST BE IN THE BEGINNING OF .vimrc!
" on chinese system, default will expand to cp936 automaticly;
" to edit big5 code file, you must using:
"
" :edit ++enc=cp950 `filename`
"" Fileencodings Priority : ucs-bom, utf-8; 2cd, gbk;
"" NOTE: `bom` is short for Byte Order Mask'
set fileencodings=ucs-bom,utf-8,cp936

set ambiwidth=double

"" the appearence of line number
highlight LineNr    guifg=#008f00 gui=bold guibg=#222222

if v:version >= 703
    set undodir=~/.vimundo

    set undofile
    if !isdirectory(&undodir)	" create undodir, if it is not exist
	call mkdir(&undodir)
    endif

    "command -nargs=0	ClearVimundoFiles	call undofile#remove_invalid_undofile()
endif

"autocmd	" Remove ALL autocommands for the current group.

"highlight CurrentLine guibg=darkgrey guifg=white
"autocmd Cursorhold * execute 'match CurrentLine /\%' . line('.') . 'l.*/'
"set updatetime=3000

" Return to the last edit position!
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "norm '\"" | else | exe "norm $"|endif

function! MySys()	" return OS type, eg: windows, or linux, mac, et.st.. {{{2
    if exists('g:operation_system')
	return g:operation_system
    endif
    let g:operation_system=''
    if has('win16') || has('win32') || has('win64') || has('win95')
	let g:operation_system='windows'
    elseif has('unix')
	let g:operation_system='linux'
    endif
    return g:operation_system
endfunction 		" }}}

command -nargs=0	BufWipeoutAll	silent execute ' 0,'.bufnr('$').'bwipeout'

if MySys() == 'windows' " {{{2
    set tenc=cp936
    "language "en_US.ISO_8859-1"
    "控制欢迎字幕以及状态条语言
    let $LANG = 'EN-US'			" United Stats English

    command -nargs=0	Msys		silent execute ' !'.strpart($HOME, 0, 2).'\Program\msys\msys.exe'
    command -nargs=0	MsysCwd		silent execute ' !'.strpart($HOME, 0, 2).'\Program\msys\msys.exe "'.system#ToTermEnc(getcwd()).'"'
    command -nargs=0	MsysHere	silent execute ' !'.strpart($HOME, 0, 2).'\Program\msys\msys.exe "'.system#ToTermEnc(fnamemodify(bufname('%'), ":p:h")).'"'

endif

"if has('gui_running')	" colorscheme 	{{{2
"    "" ColorScheme Setting
"    "colorscheme darkblue
"    "colorscheme torte
"    "colorscheme murphy
"    "colorscheme desertEx
"    colorscheme molokai
"    "colorscheme ir_black
"    "colorscheme InkPot  		" Dark theme
"    "colorscheme TAqua  		" Light theme
"else
"    "colorscheme desert256
"    "colorscheme lapis256
"    colorscheme default
"endif
colorscheme molokai

if MySys() == "linux"
    winsize 100 50
endif

" function! Set_Dictionary(dict_file)
"     silent! execute 'setlocal dictionary+='.a:dict_file
" endfunction

if MySys() == "windows"	" g:plugin_dir {{{2
    "let g:plugin_dir = $VIM.'/vimfiles/'
    let g:plugin_dir = $HOME.'/.vim/'
elseif MySys() == "linux"
    let g:plugin_dir = $HOME.'/.vim/'
endif

" TODO
"  用于和操作系统进行对话的命令转换联系。
if MySys() == "windows"
    "let g:system_encoding='cp936'
    let g:system_encoding=&termencoding
else
    let g:system_encoding='utf-8'
endif

"if has('autocmd')
"    autocmd GUIEnter * set visualbell t_vb=
"endif

" Sarrow: 2016-08-18
"if $COLORTERM == 'gnome-terminal'
"    "set term=gnome-256color
"    set term=$TERM
"    "colorscheme desert
"elseif $COLORTERM == 'rxvt-xpm'
"    set term=$TERM
"endif

function! Message_Debug()
    let _tmp_=@+
    redir @+
    silent messages
    redir END
    new
    set buftype=nofile
    put=@+
    let @+=_tmp_
endfunction

command! -nargs=0 MessageDebug		call Message_Debug()

" Recognize standard C/C++ headers
"For $include
if MySys() == "windows"			" searching path {{{2
    "if strlen($MINGW)
    "    for inc in [$MINGW_SYS_INC, $MINGW_INC, $MINGW_CPP_INC, $BOOST_INC, $PTHREAD_INC, $SSS_INC]
    "        if strlen(inc)
    "    	execute 'set path+='.inc
    "        endif
    "    endfor
    "endif
elseif MySys() == "linux"
    let &path = &path . substitute(expand("$CPATH"), ":", ",", "g")
    "set path+=/usr/include/
endif

" Recognize standard C++ headers	" {{{2
if MySys() == "windows"
    if strlen($MINGW_CPP_INC)
	execute ':autocmd BufEnter '.substitute($MINGW_CPP_INC, '\','/', 'g').'* setf cpp'
    endif
    if strlen($MINGW_INC)
	execute ':autocmd BufEnter '.expand($MINGW_INC).'/*     setf cpp'
    endif
elseif MySys() == "linux"
    au BufEnter /usr/include/c++/*		setf cpp
    au BufEnter /usr/include/c++/4.8/*  	setf cpp
    au BufEnter /usr/include/c++/4.9/*  	setf cpp
endif

" Sarrow: 2008十二月14
function! Bind_help_system()		" win32 only {{{2
    if MySys() != "windows"
	return
    endif
    let g:winhelpfiles=[
		\'"J:\Program Files\Borland\CBuilder6\Help\bcb6rtl.hlp"',
		\'"J:\Program Files\Borland\CBuilder6\Help\bcb6scl.hlp"',
		\'"J:\Program Files\Common Files\Borland Shared\MSHelp\win32.hlp"',
		\'"J:\Program Files\Common Files\Borland Shared\MSHelp\opengl.hlp"']

    " C runtime library|" C++ standar library|" Win32 Api reference|" OpenGl Api reference|

    let l:iter = 0
    for winhlp in g:winhelpfiles
	exe "nnoremap <buffer> K". l:iter. " :execute 'silent !start winhlp32 -k '.expand('<cword>') . '  ' . g:winhelpfiles[". l:iter ."] <CR>"
	let l:iter += 1
    endfor
    " nnoremap <buffer> K0 :execute '!start winhlp32 -k '.expand('<cword>') . '  ' . g:winhelpfiles[0] <CR>
    " nnoremap <buffer> K1 :execute '!start winhlp32 -k '.expand('<cword>') . '  ' . g:winhelpfiles[1] <CR>
    " nnoremap <buffer> K2 :execute '!start winhlp32 -k '.expand('<cword>') . '  ' . g:winhelpfiles[2] <CR>
    " nnoremap <buffer> K3 :execute '!start winhlp32 -k '.expand('<cword>') . '  ' . g:winhelpfiles[3] <CR>
endfunction

"TODO
" when copy, add line number prefix		copy with line number {{{2
function! DoNumCopy(line1, line2, s)
    let length = strlen(string(a:line2 - a:line1 + a:s))
    let format= '%0' . string(length) . 'd '
    let out=[]
    execute 'silent '.a:line1.','a:line2.'g/^.*$/call add(out, printf(format, line(".") - a:line1 + a:s) . getline("."))'
    let @+ =""
    let @+ =join(out, "\n")
endfunction

command! -nargs=0 -range=% NumCopy	call DoNumCopy(<line1>, <line2>, <line1>)
command! -nargs=0 -range=% NumCopyHere	call DoNumCopy(<line1>, <line2>, 1)
command! -nargs=1 -range=% NumCopyArg	call DoNumCopy(<line1>, <line2>, <f-args>)

function! DoNumAdd(line1, line2, s)
    let length = strlen(string(a:line2 - a:line1 + a:s))
    let format= '%0' . string(length) . 'd '
    execute 'silent '.a:line1.','a:line2.'g/^.*$/call setline(line("."), printf(format, line(".") - a:line1 + a:s) . getline("."))'
endfunction
command! -nargs=0 -range=% NumAdd	call DoNumAdd(<line1>, <line2>, <line1>)
command! -nargs=0 -range=% NumAddHere	call DoNumAdd(<line1>, <line2>, 1)
command! -nargs=1 -range=% NumAddArg	call DoNumAdd(<line1>, <line2>, <f-args>)

function! URLFormat()
    silent s#%\(\w\{2}\)#\=nr2char(str2nr(submatch(1), 16))#g
endfunction

command! -nargs=0 URLFormat	call URLFormat()

" TODO  a "MUST" in visual mode!	swap two area	{{{2
function! Swap()
    let pos1 = getpos('''<')
    let pos2 = getpos('''>')
    echoe string(pos1) . string(pos2)
    normal gv
    let pos3 = getpos('''<')
    let pos4 = getpos('''>')
    echoe string(pos3) . string(pos4)
endfunction

" TODO Traditional Chinese Characters to Simplify Chinese Characters {{{2
function! T2S()
    let t2s_path = ''
endfunction
command! -nargs=0	T2S call T2s

" Sarrow:2008十一月01
function! g:SaveAsPlainText(path)		" {{{2
    "TODO:return to original position
    let l:line = getline(1)
    let l:line = matchstr(l:line, '^\%(\*\+\s\+\)\=\zs.\+$')
    let l:line = substitute(l:line, iconv('　', 'cp936', 'utf8'), ' ', 'ge')
    let l:line = matchstr(l:line, '^\s*\zs.\+$')
    let l:line = matchstr(l:line, '^\zs.\{-}\ze\s*$')
    let l:line = substitute(l:line, '\s\+', '_', 'ge')
    " 2011-02-08
    let l:line = substitute(l:line, '[\*?:"''\\\/|]', '_', 'ge')
    let l:line = escape(l:line, '#')

    let path = a:path
    if a:path =~ '\S' && a:path !~ '\%(\\\|/\)$'
	let path .= '/'
    endif
    " \([^\s　].\{-1,}\)[\s　]*$/\1/g
    exe ':sav ' . path . l:line . '.txt'
endfunction

command! -nargs=? -complete=dir SText 		call g:SaveAsPlainText(<q-args>)

" Sarrow:2008十一月01
" FIXME
func! g:TrimTrailingSpaces()		" {{{2
    silent %s/\(\s\|　\)\+$//ge
    " NOTE: return to original position
    normal ``
endf
command! -nargs=0 TTrimRightSpaces	call g:TrimTrailingSpaces()
"-----------------------------------------------------

" 返回符合 pattern 的内容的集合——利用系统剪贴板传递数据——以及出现的次数
" TODO 把下面的功能，做成一个插件的形式。
" 注意，还需要提供补全——把每次 pattern 都用外部文件记录下来——相同的，只保
" 留一个，再一并提供给用户补全
function! g:CollectMatch(line1, line2, pattern)
    " FIXME
    " 有点小问题：当查找的串只有一个字母时，将出现死循环——因为光标没有移动的
    " 问题；需要在每次找到匹配后，后移一次光标。
    " 这个 "后移一次" 也是个麻烦——normal l的话，在行末，光标不会移动。用
    " normal w的话，又可能错过数据。Orz。
    " NOTE:
    " 使用%s//\=Function_of_collect/ge
    " 上面的这种方法肯定能行——缺点——就算你实际没有让subs前后的buffer内容有
    " 什么不同，但是vim也会认为做了修改！
    " 另外一个变通的仿佛就是使用
    " /
    " 来 search。
    let _current_line_ = line(".")
    let _ret_ = {}
    let _reg_q_ = getreg('"')
    call setreg('+', '')
    "let @+ = ''
    let _v_str_ = []
    execute a:line1
    while search(a:pattern, 'cW', a:line2) > 0
	normal ma
	call search(a:pattern, 'cWe', a:line2)
	normal mb
	normal `av`by
	let _key_ = @"
	if !has_key(_ret_, _key_)
	    let _ret_[_key_] = 1
	    call add(_v_str_, _key_)
	else
	    let _ret_[_key_] += 1
	endif
	normal `b
    endwhile

    for key in _v_str_
        let @+ .= string(_ret_[key]) . "\t" . key . "\n"
    endfor
    "for key in sort(keys(_ret_))
    "    let @+ .= string(_ret_[key]) . "\t" . key . "\n"
    "endfor
    echom 'collected '.len(_v_str_).' item(s).'
    call setreg('"', _reg_q_)
    execute _current_line_
endfunction

" TODO
"command! -nargs=? -range=% -complete=custom,CollectPreDefined Collect	call g:CollectMatch(<line1>, <line2>, <q-args>)
command! -nargs=? -range=% Collect	call g:CollectMatch(<line1>, <line2>, <q-args>)

"TODO
" Sarrow: 2011-01-23 19:15:24
function! g:DelContinuousLines(line1, line2, pattern)	" 对连续的、相同的行，保留首行，其余删除
    if a:pattern == ''
	" default compare the whole line
	let _pat_ = '^.*$'
    else
	let _pat_ = a:pattern
    endif
    let _current_line_ = line('.')
    " 记录当前行的位置——如果当前行被删除了，那么本函数结束后，光标停在，保留
    " 的最近一行上。
    execute a:line1
    " the 1st-line
    let key = matchstr(getline('.'), _pat_)

    let _p_ = _current_line_ + 1 - a:line1
    if _current_line_ == line('$')
	return
    endif
    execute a:line1+1
    " loop from the 2nd-line
    for i in range(2, a:line2 + 1 - a:line1)
	let new_key = matchstr(getline('.'), _pat_)
	if new_key ==# key
	    silent d
	    if i <= _p_
		let _current_line_ -= 1
	    endif
	else
	    silent normal j
	endif
	let key = new_key
    endfor
    execute _current_line_
    " End: 2011-01-23 22:20:41
endfunction
command! -nargs=? -range=% DelConLines	call g:DelContinuousLines(<line1>, <line2>, <q-args>)

"" Set the 'dirname' of current file as Current Work Directory
"" "NOTE" :cd %:h:h
" to the parent directory
" silent! command -nargs=? CD	                :silent echoe 'cd '.fnamemodify(expand('%'), ':h').'\<args>'
" TODO 2010-11-09
" 以当前文件的父目录进行expand
command! -nargs=? -complete=dir CD				:silent execute 'cd '
	    \ . escape(expand('%:h') =~ '[\\/]$' ? expand('%:h') : expand('%:h') . '/', ' ()[]').'<args>'

" Text file Formating Settings
" Command:
"  	gq
"set formatoptions+=mM
"==== some util function ==============================================={{{1
function! Check_make_system() " {{{2
    if 0 == executable(&makeprg)
        if !exists('g:C_CPP_make_cmd_list')
            let g:C_CPP_make_cmd_list = ['mingw_make', 'mingw32_make', 'make', 'wmake', 'mingw32-make']
        endif
	for item in g:C_CPP_make_cmd_list
	    if &makeprg == item
		continue
	    endif
	    let &makeprg = item
	    if 1 == executable(&makeprg)
		break
	    endif
	endfor
    endif
    command! -buffer -nargs=0 Makefile     new %:p:h\makefile
endfunction

function! s:DiffCurrentTabBatchCommand(command) " {{{2
    for buf_nr in tabpagebuflist()
	execute bufwinnr(buf_nr).'wincmd w'
        if &diff == 1
            execute a:command
        endif
    endfor
endfunction

command! -nargs=0 DiffBatchOff		call s:DiffCurrentTabBatchCommand("diffoff")
command! -nargs=0 DiffBatchClose	call s:DiffCurrentTabBatchCommand("diffoff|bd")

" TODO: 2009-04-07
" quickfix 窗口编码识别问题
function! QfMakeConv() " {{{2
    if &encoding == "utf-8"
	return
    endif
    let qflist = getqflist()
    for i in qflist
	let i.text = iconv(i.text, &encoding, "utf-8")
    endfor
    call setqflist(qflist)
endfunction

au QuickfixCmdPost make call QfMakeConv()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:DirName(path)	"{{{2
    return fnamemodify(a:path, ':p:h')
endfunction

function! s:BaseName(path)	"{{{2
    return fnamemodify(a:path, ':t')
endfunction

function! s:ForceWrite(path)	"{{{2
    let prev_stems = s:DirName(a:path)
    if s:CreatePath(prev_stems) == 0
	call msg#ErrorMsg('cannot mkdir `'.prev_stems.'`')
	call msg#ErrorMsg('cannot write to file: `'.a:path.'`')
	return 0
    endif
    execute 'w! '.a:path
endfunction

function! s:ForceSave(path)	"{{{2
    let prev_stems = s:DirName(a:path)
    if s:CreatePath(prev_stems) == 0
	call msg#ErrorMsg('cannot mkdir `'.prev_stems.'`')
	call msg#ErrorMsg('cannot write to file: `'.a:path.'`')
	return 0
    endif
    execute 'sav! '.a:path
endfunction

function! s:CreatePath(path)	"{{{2
    if !isdirectory(a:path)
	if s:CreatePath(s:DirName(a:path)) == 0
	    return 0
	endif
	echomsg 'mkdir '.a:path
	let dir_to_make = system#ToTermEnc(a:path)
	if mkdir(dir_to_make) ==  0
	    return 0
	endif
    endif
    return 1
endfunction

command -nargs=1 -complete=file Sav	call s:ForceSave(<q-args>)
command -nargs=1 -complete=file Write	call s:ForceWrite(<q-args>)

function! s:EditAndJump(path, new) " {{{2
    let l:num = -1
    let l:path = a:path

    if !filereadable(l:path)
        let l:matched = matchlist(a:path,  '^\(.\{-}\)\%(|\|:\)\(\d\+\)$')
        if !empty(l:matched) && len(l:matched[2]) > 0
            let l:num = l:matched[2]
            let l:path = l:matched[1]
        endif
    endif

    " NOTE: no need to check filereadable()!
    "if !filereadable(l:path)
    "    echohl WarningMsg
    "    echo "file \"" . l:path . "\" not readable"
    "    echohl NONE
    "    return
    "endif
    if a:new != 0
        silent execute "new "  . l:path
    else
        silent execute "edit " . l:path
    endif
    if l:num > 0 && filereadable(l:path)
        silent execute l:num
    endif
endfunction

command -nargs=1 -complete=file Edit	call s:EditAndJump(<q-args>, 0)
command -nargs=1 -complete=file New	call s:EditAndJump(<q-args>, 1)

"  FileType Spcific Extension:		{{{1
"" NOTE: sw : shiftwidth; ts : tabstop; et : expandtab; gfn : guifont; nu : number; fdm : foldermethod;

" FileType: sh {{{2
au FileType sh
	    \ call pairpunct#Bind_punct_complete()|
	    \ call pairpunct#PairAdd_english_style()

" FileType: c,java,d,cpp,go {{{2
au FileType c,java,d
	    \ let g:load_doxygen_syntax=1|
	    \ setlocal cindent cinoptions=:0,g0,t0,(0,W8|
	    \ setlocal fo+=mM ts=4 sw=4 et nu rnu fdm=marker|
	    \ call pairpunct#Bind_punct_complete()|
	    \ call pairpunct#PairAdd_english_style()|
	    \ setlocal dictionary+=~/.vim/keywords/c-c++.txt
au FileType go
	    \ let g:load_doxygen_syntax=1|
	    \ setlocal cindent cinoptions=:0,g0,t0,(4,W8|
	    \ setlocal fo+=mM ts=4 sw=4 et nu rnu fdm=marker|
	    \ call pairpunct#Bind_punct_complete()|
	    \ call pairpunct#PairAdd_english_style()|
	    \ setlocal dictionary+=~/.vim/keywords/go.txt

" NOTE http://stackoverflow.com/questions/8062608/vim-and-c11-lambda-auto-indentation
au FileType cpp
	    \ let g:load_doxygen_syntax=1|
	    \ setlocal cindent cinoptions=:0,g0,j1,(0,ws,Ws|
	    \ setlocal fo+=mM ts=4 sw=4 et nu rnu fdm=marker|
	    \ call pairpunct#Bind_punct_complete()|
	    \ call pairpunct#PairAdd_english_style()|
	    \ setlocal dictionary+=~/.vim/keywords/c-c++.txt

function! s:InsertNLBetweenCurlyBraces()
    if strpart(getline('.'), col('.') - 2, 2) == '{}'
        return "\<CR>\<CR>\<Up>\<Tab>"
    endif
    return "\<CR>"
endfun
autocmd FileType c,cpp,java,d,go inoremap <CR> <C-R>=<SID>InsertNLBetweenCurlyBraces()<CR>

" FileType: make {{{2
autocmd FileType make
	    \ setlocal fo+=mM ts=4 sw=4 nu rnu fdm=marker|
	    \ call pairpunct#Bind_punct_complete()|
	    \ call pairpunct#PairAdd_english_style()

" FileType: python {{{2
" Suffix List: .py
autocmd FileType python
            \ setlocal ts=4 sw=4|
            \ call pairpunct#Bind_punct_complete()|
            \ call pairpunct#PairAdd_english_style()

" FileType: plain-text; enhanced syntax highlighting and browser function.		{{{2
" Suffix List: .txt

au BufWritePre *.txt,*.cal " {{{2
	    \ if &ft=='' | setfiletype txt | endif |
	    \ if (&fenc=='' || &fenc=='euc-cn') | set fenc=utf8 | endif

au BufRead *.txt
            \ if expand("%:t") != "CMakeLists.txt" | setfiletype text | endif

au FileType text
            \ if line('$') == 1 && getline('$') == '' | set fenc=utf8 | endif |
            \ setlocal ts=8 sw=8 nu rnu noet fo+=qnmM tw=80|
            \ call pairpunct#PairAdd_chinese_style()|
            \ call pairpunct#PairVisual_chinese_style()

au FileType text,markdown
            \ setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-

au FileType xml
            \ setlocal ts=4 sw=4 nu rnu |
            \ call pairpunct#Bind_punct_complete()|
            \ call pairpunct#PairAdd_english_style()

" FileType: markdown {{{2
autocmd FileType markdown call pairpunct#PairAdd_chinese_style()

" Sarrow: 2011-12-20
" no euc-cn on linux!
au BufWritePre *
	    \ if &fenc=='euc-cn' | set fenc=cp936 | endif
" End:

" FileType: cmake {{{2
au BufReadPost CMakeLists.txt setfiletype cmake
if !filereadable("~/.vim/keywords/cmake.txt")
	call writefile(split(system("cmake --help-command-list --help-variable-list --help-property-list"), "\n"), expand("~/.vim/keywords/cmake.txt"), "b")
	au FileType cmake setlocal dictionary-=~/.vim/keywords/cmake.txt dictionary+=~/.vim/keywords/cmake.txt
endif

autocmd FileType cmake
            \ setlocal ts=4 sw=4|
            \ call pairpunct#PairAdd_english_style()

" FileType: vim-scripts {{{2
autocmd FileType vim
			\ call pairpunct#PairAdd_english_style()|
			\ set ts=8 sw=4 expandtab

" TODO {{{2
" ctags for PHP
"#!/bin/bash
"cd /path/to/framework/library
"exec ctags-exuberant -f ~/.vim/mytags/framework \
"-h ".php" -R \
"--exclude="\.svn" \
"--totals=yes \
"--tag-relative=yes \
"--PHP-kinds=+cf \
"--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
"--regex-PHP='/interface ([^ ]*)/\1/c/' \
"--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

"========== some global key-mapping ================================ {{{1
"========== Make file 2011-05-27 =================================== {{{2
"nnoremap <C-M>		:update!<CR>:make<CR>
nnoremap <M-S-T>		:tabnew<CR>
nnoremap <C-n>			:new
"For editing on the command-line: >
" start of line
cnoremap <C-A>		<Home>
" back one character
cnoremap <C-B>		<Left>
" delete character under cursor
cnoremap <C-l>		<Del>
" end of line
cnoremap <C-E>		<End>
" forward one character
"cnoremap <C-F>		<Right>
" recall newer command-line
cnoremap <C-N>		<Down>
" recall previous (older) command-line
"cnoremap <C-P>		<Up>
" back one word
"cnoremap <Esc><C-B>	<S-Left>
" forward one word
"cnoremap <Esc><C-F>	<S-Right>

"NOTE: This requires that the '<' flag is excluded from 'cpoptions'. |<>|

" For c-style-string modify
" delete characters in mack ", then switch to insert mode.
inoremap <A-s> <Esc>di"i
nnoremap <A-s> di"

" alt+n or alt+p to navigate between entries in QuickFix Window
nnoremap <silent> <m-p> :cp<cr>
nnoremap <silent> <m-n> :cn<cr>

noremap <A-$>	vip<ESC>$
noremap <A-0>	vipo<ESC>0
noremap <A-^>	vipo<ESC>^

" TODO 这个应该纳入 system.vim/plugin
" Sarrow:2009一月27
" 使用系统函数查看文件——主要是区分于vim的nnoremap gf功能。
" gs -- abbr.  goto shell ...
"nnoremap gs	:call system#Gui_execut_this(substitute(expand("<cfile>"), '/', '\', 'g'))<CR>
"vnoremap gs	y:call system#Gui_execut_this(substitute(@", '/', '\', 'g'))<CR>
nnoremap gs	:call system#Gui_execut_this(expand("<cfile>"))<CR>
"nnoremap gs	:call system#OS_open_file(substitute(expand("<cfile>"), '/', '\', 'g'))<CR>
vnoremap gs	y:call system#Gui_execut_this(getreg('"'))<CR>
"vnoremap gs	y:call system#OS_open_file(substitute(@", '/', '\', 'g'))<CR>
" End:2009一月27

function! s:Url_git_https2ssl()
    silent '<,'>s`\<https:\/\/\(\w\+\.\w\+\)\/\(\w\+\)\/\([a-zA-Z\.]\+\)`git@\1:\2/\3`ge
endfunction
command! -nargs=0 -range=% UrlGitConverter	call <SID>Url_git_https2ssl()<CR>

" Sarrow:2009一月13
" execute selection
" TODO 将加入编码转换的支持（utf8-->cp936）
vnoremap <CR>   y:silent @"<CR>
" End:2009一月13

let g:strftime_format=
	    \ '%Y'.'-'.
	    \ '%m'.'-'.
	    \ '%d'.''

"let g:strftime_format=
"	    \ '%Y'.iconv('年', g:system_encoding, 'utf8').
"	    \ '%m'.iconv('月', g:system_encoding, 'utf8').
"	    \ '%d'.iconv('日', g:system_encoding, 'utf8')

nnoremap <silent> <F2>  "=strftime(g:strftime_format)<CR>p
inoremap <silent> <F2> <C-R>=strftime(g:strftime_format)<CR>

nnoremap <silent> <A-F2>  "=strftime('%H:%M:%S')<CR>p
inoremap <silent> <A-F2> <C-R>=strftime('%H:%M:%S')<CR>

"" Shrink white spaces In Selected Area
vnoremap <silent> <A-s> s<C-R>=substitute(@", '\s\+', "", "g")<CR><ESC>

" Using Space-Key to get page down and up.
nnoremap <Space>	<C-f>
nnoremap <S-Space>	<C-b>

nnoremap <silent> <F5> :e ~/.idx<CR>

" no need to <C-c> to back to normal mode while editing.
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>

" In column select mode, Ctrl-c will be ugly; so map to <ESC>
" inoremap <C-C> <ESC>
" Sarrow: 系统已经提供了一个i_ESC的替代品--i_CTRL_[
" 2008十一月13

" Insert empty line in insert mode
inoremap <A-o> <C-o>o
inoremap <A-O> <C-o>O
" Insert empty line in normal mode
nnoremap <A-o> :put=''<CR>
nnoremap <A-O> :-1put=''<CR>

" Append and Push front
inoremap <A-a> <C-o>A
inoremap <A-i> <C-o>I

" Inline find
inoremap <A-f> <C-o>f
inoremap <A-F> <C-o>F

" Word wise move
inoremap <A-w> <C-o>w
inoremap <A-b> <C-o>b
inoremap <A-e> <C-o>e<right>

" Undo / Redo in insert mode
inoremap <A-u> <C-o>u
inoremap <A-r> <C-o><C-r>

" Newline char and paragraph
inoremap <A-n> <C-o>o
"TODO
" 下句为分段；可以这样改进之——把当前段落的缩进（包括中文全角字符）都copy到新
" 分段落的开头。
"
" 那么，如何定位段落的开头呢？vim默认是空行。可以先保存当前光标位置，然后
" normal {j
" 再para_header = matchstr(getline("."), '^[\s　]*')
" 再跳到预定分段的位置，再
" normal a<C-r>='\r\r'.para_header

" 两个软回车，用于分段
inoremap <A-p> <C-o>o<C-o>o
" 两个硬回车，...
inoremap <A-CR> <CR><CR>
nnoremap <A-CR> a<CR><CR><Esc>
vnoremap <A-CR> c<CR><CR><ESC>

" Delete char current or previous
"
" <C-o>x   -->  this will yank char into register",
" 		this may not what you want.
" 		so, I use key-map below:
" inoremap <A-x> <BackSpace>
" inoremap <A-d> <Del>
" 系统已经提供了i_CTRL_h来删除光标前、i_DEL来删除光标后字符的功能
inoremap <C-l> <Del>
" inoremap <C-h> <BackSpace>

" Move cursor in long lines
noremap <A-h> h
" NOTE 与text中文缩进重复
" /.vim/bundle/txt.vim/syntax/text.vim|945
noremap <A-j> gj
noremap <A-k> gk
"noremap <A-l> l

"select current word under cursor
nnoremap <A-w> viw
nnoremap <A-c> ciw

"" Yank into Sytem Clipboard
vnoremap <A-y> "+y
"" Yank current Word, then back to where you are.
nnoremap <A-y> m"viw"+y`"

" Paste!
" highlighting selected mode, cut and paste
vnoremap <S-CR> "+p
" Normal-command mode, append and paste
nnoremap <S-CR> "+p
" Insert-mode, paste directly
inoremap <S-CR> <C-R>+
" Command-line mode, paste directly
cnoremap <S-CR> <C-R>+

" Move lines in visual-mode only
xnoremap <C-j> :move '>+1<CR>gv
xnoremap <C-k> :move '<-2<CR>gv

" Move lines
nnoremap <C-Down> 	:<C-u>move .+1<CR>
nnoremap <C-Up> 	:<C-u>move .-2<CR>
inoremap <C-Down> 	<C-o>:<C-u>move .+1<CR>
inoremap <C-Up> 	<C-o>:<C-u>move .-2<CR>
vnoremap <C-Down> 	:move '>+1<CR>gv
vnoremap <C-Up> 	:move '<-2<CR>gv

" Alternate tab-view window
nnoremap <A-1>	:tabprevious<CR>
inoremap <A-1>	<Esc>:tabprevious<CR>
nnoremap <A-2>	:tabnext<CR>
inoremap <A-2>	<Esc>:tabnext<CR>

" Cursor movement with direct-keys
nnoremap <Down>	gj
nnoremap <Up>	gk
vnoremap <Down> gj
vnoremap <Up>	gk
inoremap <Down>	<C-o>gj
inoremap <Up>	<C-o>gk
nnoremap <End>	g$
nnoremap <Home>	g0
vnoremap <End>	g$
vnoremap <Home>	g0
inoremap <End>	<C-o>g$
inoremap <Home>	<C-o>g0

" Close current file window
nnoremap <silent> <C-F4> :confirm bd<CR>
vnoremap <silent> <C-F4> <ESC>:confirm bd<CR>
onoremap <silent> <C-F4> <ESC>:confirm bd<CR>
noremap <silent>! <C-F4> <ESC>:confirm bd<CR>

" CTRL-Tab is Next window
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w

" Buffer Cycling
map <C-Left>	<ESC>:bprevious<CR>
map <C-Right>	<ESC>:bnext<CR>
nnoremap <A-h>	:bprevious<CR>
nnoremap <A-l>	:bnext<CR>
"NOTE:{{{
"if you want to toggle back and forth between current and previous buffer,
"then you can use CTRL-6(CTRL-o CTRL-6 if in insert mode)or
":e #
"}}}

" Open and locate a Help Window faster
map <silent> <F1> <ESC>:exec "help ".expand("<cword>")<CR>
vnoremap <silent> <F1> y<ESC>:exe "help ".@"<CR>
"NOTE:{{{
"To get the word under the cursor, we use <cWORD>. The WORD part is uppercase;
"this means that all characters except white spaces (space and tab) can be
"part of the word. This is needed because VIM commands can contain special
"characters other than alphanumeric (think of if you were to look up <cWORD>).
"}}}

" Find file in $PATH, the view it in new tab
nnoremap gF <C-w>gf
vnoremap gF <C-w>gf

" Maxmize the window when start
if has('gui_running')
    if has("win32")
	au GUIEnter * simalt ~x
	" Alt-Space is System menu
	" NOTE: simalt : simulate Alt-key
	noremap <M-Space> :simalt ~<CR>
	inoremap <M-Space> <C-O>:simalt ~<CR>
	cnoremap <M-Space> <C-C>:simalt ~<CR>
    elseif executable('wmctrl')
	" NOTE:
	" 2012-02-13
	" 在 win32 环境下，支持模拟 窗口条 最大化
	" 而gnome环境下，需要先安装专门的窗口管理软件：wmctrl
	" 参考文章：
	" http://uniharmony.blog.163.com/blog/static/4617437620087310345373/
	au GUIEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endif

    if has('win32') || executable('wmctrl')
	autocmd VimEnter * let g:lines_max=&lines | let g:columns_max=&columns
	" VimResized			After the Vim window was resized, thus 'lines'
	" 				and/or 'columns' changed.  Not when starting
	" 				up though.
	"" TODO 在vim开始的什么阶段，窗口才变成全屏？
	command! -nargs=0 Half		:execute 'winsize '.g:columns_max. ' ' . string(g:lines_max / 2)
    endif
endif

""""""""""""""""""""""""""""""
"" Full-screen for win32
""""""""""""""""""""""""""""""
if has('gui_running') && has("win32")
    map <silent> <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" "2009-05-01" '"""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on
filetype plugin on
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sarrow: 2010-12-01
" 对于初始命令可以这样使用：
" > gvim +"e ~/.vimrc" +"wq"
"if argc() == 0
"    autocmd VimEnter * e ~/.idx|set ft=index
"    "edit ~/.idx
"endif

set nobackup                            " No backups
set nowritebackup

"" use 256 colors in Console mode if we think the terminal supports it
if &term =~? 'mlterm\|xterm\|screen'
    "    set t_Co=88
    set t_Co=256
endif
