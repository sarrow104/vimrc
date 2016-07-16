# My-vimrc

------------------------------

## 简单说明

for anyone who need this

----------------------------------------------------------------------

本vimrc配置文件，是我多年使用vim软件积累所得；主要是自己的一些使用习惯。

并且，在2016年初的时候，引入了vim-Bundle的管理插件的方式，同时升级、替换了常用插件。

并将自己编写的部分插件，也融入了这个新的管理方式中。

特点有：

1. 持久的guifont管理。通过自己的font.vim管理。本次修改之后，可以在下次启动的时候重新载入字体设置。
   同时，快捷键`<A-+>`,`<A-->` 可以进行快速的字体大小调整；

2. 我习惯于用 `<A-">`, `<A-'>` 等等 来快速输入，成对的标点；为此，我编写了 pairpunct.vim 插件。
   主要提供了英文（含cpp,c等编程语言）的标点成对输入；以及中文如`“”`的快速输入；

   使用的时候，形如：

    ```vim
    au FileType c,java,d
    	    \ call pairpunct#Bind_punct_complete()|
    	    \ call pairpunct#PairAdd_english_style()
    ```

   对于中文标点，则可以使用 call pairpunct#PairAdd_chinese_style() 即可。

3. 为了与成对标点的快速输入配合，我还增加了插入模式的快速光标移动快捷键，作为配合。以方便地，
   跳到成对标点符号的右侧；

   如 i_A-l; 此外还有 i_A-h,i_A-i,i_A-k。分别表示光标向左、向右、向上、行下移动一个字符。

4. 此外，还有 system.vim 插件，以方便地从(g)vim中，呼叫出文件系统浏览器、shell/cmd窗口，等等。

5. 为了方便编写cpp程序，以及，用cmake管理工程，我还额外配套了一个二进制工具：
   gensketch.vim 和 vim 脚本 simple-cmake.vim；分别用来自动创建 `.gitignore`；批量创建cpp的头文件和实现文件；
   以及，批量创建cmake工程，或者qt工程文件。这些，都是基于模板来创建的。

## 插件列表

```vim
" sematic-utils
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/MatchTagAlways'
Plugin 'majutsushi/tagbar'

"" vimshell+vimproc
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'

" Emmet - zencoding
Plugin 'mattn/emmet-vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

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
Plugin 'mhartington/oceanic-next'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'andrwb/vim-lapis256'
Plugin 'vim-jp/vim-cpp.git' " not so usefull. sad
Plugin 'ArkBriar/vim-qmake' " .pro
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'plasticboy/vim-markdown'

" utility tools
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim' " needed by vimfiler
Plugin 'Shougo/vimfiler.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'hynek/vim-python-pep8-indent' " Pythonindent 2016-05-22
Plugin 'terryma/vim-multiple-cursors'
Plugin 'lilydjwg/fcitx.vim.git'
Plugin 'vim-scripts/mru.vim.git'
Plugin 'dimasg/vim-mark'
Plugin 'xolox/vim-misc'
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

" utility tools devicons must the last!
Plugin 'ryanoasis/vim-devicons' " Powerline(air-line), Nerd Font

" @ Plugin --- [ Code Sreach ]
Plugin 'rking/ag.vim'
```
