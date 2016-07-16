# My-vimrc

------------------------------

## 简单说明

for anyone who need this

----------------------------------------------------------------------

vim 是一个高度可定制化的，文本编辑软件。因此，其个性化配置来说，并不适合所有人。但仍然有一定的借鉴意义。

----------------------------------------------------------------------

本vimrc配置文件，是我多年使用vim软件积累所得；主要是自己的一些使用习惯和积累下来的大众化插件。

在2016年初的时候，我引入了vim-Bundle的管理插件的方式，升级了自己的vim管理插件的方式，并替换、更改了部分常用插件。

同时，将自己编写的部分插件，也融入到了这种新的vim插件管理方式中去。

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

4. 此外，还有 `system.vim` 插件，以方便地从(g)vim中，呼叫出文件系统浏览器、shell/cmd窗口，等等。
   另外，该插件还附带有 `nerdtree_plugin/` 插件，可以支持在NERDTree窗口中，通过回车键，
   执行`文件系统浏览器`的打开光标行文件夹。以及，用`系统打开方式`打开光标行所在文件。

5. 为了方便编写cpp程序，以及，用cmake管理工程，我还额外配套了一个二进制工具：
   gensketch.vim 和 vim 脚本 simple-cmake.vim；分别用来自动创建 `.gitignore`；批量创建cpp的头文件和实现文件；
   以及，批量创建cmake工程，或者qt工程文件。这些，都是基于模板来创建的。

6. 自定义text（.txt）文本插件；我将text文本文件，重新设计为，以`*`前缀为标题行标志的文件，
   同时支持 `:CC` 快速生成大纲的方式，以支持进行快速章节跳转。并自定义了一些快捷功能，以方便中文文本文档的编辑。

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

## FAQ

Q: 如何让NERDTree 插件可以使用 vim-devicons 图标字体？

A: 请参考 https://github.com/chxuan/vimplus 中，sh按照脚本中描述，进行操作。

Q: 为什么在安装 vim-devicons 插件之后， NERDTree 中只有部分图标字体正常显示，而相当部分是乱码“中文”？

A: 可能是设置了guifontwide 属性的原因；vim-devicons 所用字体，会与部分中文字体混淆；
   此时需要执行 `:set guifontwide=` ，清空 gfw 值即可。

