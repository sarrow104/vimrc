# My-vimrc

------------------------------

## 简单说明

for anyone who need this

----------------------------------------------------------------------

vim 是一个高度可定制化的，文本编辑软件。因此，其个性化配置来说，并不适合所有人。但仍然有一定的借鉴意义。

----------------------------------------------------------------------

本vimrc配置文件，是我多年使用vim软件积累所得；主要是自己的一些使用习惯和积累下来的大众化插件。

在2016年初的时候，我引入了`vim-Bundle`的管理插件的方式，升级了自己的`vim`管理插件的方式，并替换、更改了部分常用插件。

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

   对于中文标点，则可以使用 `call pairpunct#PairAdd_chinese_style()` 即可。

3. 为了与成对标点的快速输入配合，我还增加了插入模式的快速光标移动快捷键，作为配合。以方便地，
   跳到成对标点符号的右侧；

   如 `i_A-l`; 此外还有 `i_A-h`,`i_A-j`,`i_A-k`。分别表示光标向右、向左、向下、行上移动一个字符。

4. 此外，还有 `system.vim` 插件，以方便地从(g)vim中，呼叫出文件系统浏览器、shell/cmd窗口，等等。
   另外，该插件还附带有 `nerdtree_plugin/` 插件，可以支持在NERDTree窗口中，通过回车键，
   执行`文件系统浏览器`的打开光标行文件夹。以及，用`系统打开方式`打开光标行所在文件。

5. 为了方便编写cpp程序，以及，用cmake管理工程，我还额外配套了一个二进制工具：
   `gensketch.vim` 和 `vim` 脚本 `simple-cmake.vim`；分别用来自动创建 `.gitignore`；批量创建cpp的头文件和实现文件；
   以及，批量创建cmake工程，或者qt工程文件。这些，都是基于模板来创建的。

6. 自定义text（.txt）文本插件；我将text文本文件，重新设计为，以`*`前缀为标题行标志的文件，
   同时支持 `:CC` 快速生成大纲的方式，以支持进行快速章节跳转。并自定义了一些快捷功能，以方便中文文本文档的编辑。

## 插件列表

*备注* 用到的vim语句：

```vim
 '<,'>Collect ^Plugin\ '\zs.\{-}\ze'`
 '<,'>s/^.\+$/- [\0](https:\/\/github.com\/\0)/ge
```

- [sarrow104/Vundle.vim](https://github.com/sarrow104/Vundle.vim)
  相比原版，修改了一下，对于本地rep插件的管理方式。

- [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
  基于clang的，`C/C++` 编程语言，补全神器。另外，还整合了，C#，python, golang等语言的补全环境。

- [Valloric/ListToggle](https://github.com/Valloric/ListToggle)
- [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
    实时语法检查支持；支持 `C/C++` 等语言；
- [valloric/MatchTagAlways](https://github.com/valloric/MatchTagAlways)
    增强的符号、区块配对高亮。
- [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
    大纲视图；同样支持多种语言。
- [fatih/vim-go.git](https://github.com/fatih/vim-go.git)
    `golang` 开发环境；同样，由 `YCM` 整合。
- [tbastos/vim-lua](https://github.com/tbastos/vim-lua)
- [xolox/vim-lua-ftplugin](https://github.com/xolox/vim-lua-ftplugin)
- [LucHermitte/lh-vim-lib](https://github.com/LucHermitte/lh-vim-lib)
- [LucHermitte/lh-tags](https://github.com/LucHermitte/lh-tags)
- [LucHermitte/lh-dev](https://github.com/LucHermitte/lh-dev)
- [LucHermitte/vim-refactor](https://github.com/LucHermitte/vim-refactor)
    `vim` 源码重构插件；以上三个插件`LucHermitte/lh-vim-lib`，`LucHermitte/lh-tags`，`LucHermitte/lh-dev`，是本插件的基础库。
- [Shougo/vimshell.vim](https://github.com/Shougo/vimshell.vim)
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
    `emmet` 风格的，`html` 标签，批量快速插入插件。
- [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
    增强的代码片段
- [honza/vim-snippets](https://github.com/honza/vim-snippets)
- [Shougo/vimproc.vim](https://github.com/Shougo/vimproc.vim)
    异步调用基础插件；
- [idanarye/vim-vebugger](https://github.com/idanarye/vim-vebugger)
    调试工具；继承多种调试器；比如`GDB`。依赖于 `Shougo/vimproc.vim`
- [myusuf3/numbers.vim](https://github.com/myusuf3/numbers.vim)
    增强型行号显示。
- [WinterXMQ/escalt.vim](https://github.com/WinterXMQ/escalt.vim)
    源自 `狐狸` 的 `escape` 序列插件。针对终端使用。
- [scrooloose/vim-slumlord](https://github.com/scrooloose/vim-slumlord)
- [sarrow104/util.vim.git](https://github.com/sarrow104/util.vim.git)
- [sarrow104/msg.vim.git](https://github.com/sarrow104/msg.vim.git)
- [sarrow104/font.vim](https://github.com/sarrow104/font.vim)
    字体自动管理调整的插件——适用于 gvim；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/include-complete.vim.git](https://github.com/sarrow104/include-complete.vim.git)
    `C/C++` 头文件补全插件——支持过滤掉实现`.c/.cpp` 文件；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/index.vim](https://github.com/sarrow104/index.vim)
    `.idx` 文件索引语法；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/fencview.vim.git](https://github.com/sarrow104/fencview.vim.git)
    `vim-scripts.org` 上的 `fencview` 插件备份。快速调整并查看文件的编码。
- [sarrow104/toggle.vim.git](https://github.com/sarrow104/toggle.vim.git)
    快速切换 `vim` 某些状态，比如高亮 `/` 搜索；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/txt.vim.git](https://github.com/sarrow104/txt.vim.git)
    增强的 `text` 语法，自带大纲；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/system.vim.git](https://github.com/sarrow104/system.vim.git)
    快速打开 `shell` 或者 `file-explorer`；自带 `nerdtree`支持；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/pairpunct.vim.git](https://github.com/sarrow104/pairpunct.vim.git)
    快速输入成对标点。并快捷修改引号、括号；支持中英文，两种风格（全角，半角）；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/make.vim.git](https://github.com/sarrow104/make.vim.git)
    `makefile` 文件的补全，以及模板插件；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/tags.vim.git](https://github.com/sarrow104/tags.vim.git)
    `ctags` 和 `cscope` 索引文件快速管理；依赖于 `sarrow104/util.vim.git`,`sarrow104/msg.vim.git`
- [sarrow104/gensketch.vim.git](https://github.com/sarrow104/gensketch.vim.git)
    基于外置模板的，批量文件生成工具（可生成目录树），使用外部工具；
- [sarrow104/simple-cmake.vim.git](https://github.com/sarrow104/simple-cmake.vim.git)
    生成简单的 `CMakeLists.txt` 文件的工具。
- [tomasr/molokai.git](https://github.com/tomasr/molokai.git)
    某 `vim` 颜色主题。
- [mhartington/oceanic-next](https://github.com/mhartington/oceanic-next)
- [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
    显示代码缩进级别的插件；需要随时计算，可能有些慢
- [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
- [andrwb/vim-lapis256](https://github.com/andrwb/vim-lapis256)
- [vim-jp/vim-cpp.git](https://github.com/vim-jp/vim-cpp.git)
- [ArkBriar/vim-qmake](https://github.com/ArkBriar/vim-qmake)
    `qmake` 语法
- [richq/vim-cmake-completion](https://github.com/richq/vim-cmake-completion)
    `cmake` 补全
- [vim-scripts/JavaScript-Indent](https://github.com/vim-scripts/JavaScript-Indent)
- [evanmiller/nginx-vim-syntax](https://github.com/evanmiller/nginx-vim-syntax)
- [hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)
- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
- [rhysd/vim-clang-format](https://github.com/rhysd/vim-clang-format)
    基于 `clang-format` 的自动 `C/C++` 源码格式化插件
- [vim-utils/vim-man](https://github.com/vim-utils/vim-man)
    方便的，`vim` 方式 的 `manpage` 查看插件；要点：高亮，跳转
- [vim-scripts/dbext.vim](https://github.com/vim-scripts/dbext.vim)
    `sql` stuff
- [vim-scripts/SQLComplete.vim](https://github.com/vim-scripts/SQLComplete.vim)
    `sql` stuff
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
    最流行的 树形文件夹 浏览利器
- [Shougo/unite.vim](https://github.com/Shougo/unite.vim)
- [Shougo/vimfiler.vim](https://github.com/Shougo/vimfiler.vim)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
    基于 `python` 的，`vim` 状态栏、`tab` 高亮显示，整合解决方案。
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim)
    全文搜索；基于 `ack, ag or pt`等工具。
- [hynek/vim-python-pep8-indent](https://github.com/hynek/vim-python-pep8-indent)
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
    多光标
- [lilydjwg/fcitx.vim.git](https://github.com/lilydjwg/fcitx.vim.git)
    `fcitx` 输入法兼容插件。进出 `vim` 插入模式的时候，自动调整中英文。
- [vim-scripts/mru.vim.git](https://github.com/vim-scripts/mru.vim.git)
    most recent uese file list.
- [dimasg/vim-mark](https://github.com/dimasg/vim-mark)
    高亮自定义文本
- [xolox/vim-misc](https://github.com/xolox/vim-misc)
- [xolox/vim-session](https://github.com/xolox/vim-session)
    回话管理；（相比内建机制，本插件兼容 `tagbar`,`nerdtree` 等常用插件）
- [junegunn/vim-easy-align.git](https://github.com/junegunn/vim-easy-align.git)
- [godlygeek/tabular](https://github.com/godlygeek/tabular)
- [qpkorr/vim-renamer](https://github.com/qpkorr/vim-renamer)
    批量，快速的，`vim` 方式，重命名工具。
- [Kris2k/A.vim](https://github.com/Kris2k/A.vim)
    切换 `.h/.c` 文件
- [vim-scripts/doxygen-support.vim](https://github.com/vim-scripts/doxygen-support.vim)
- [vim-scripts/DoxygenToolkit.vim](https://github.com/vim-scripts/DoxygenToolkit.vim)
- [edsono/vim-matchit](https://github.com/edsono/vim-matchit)
    `if ... else` 跳转
- [jlanzarotta/bufexplorer](https://github.com/jlanzarotta/bufexplorer)
- [tpope/vim-speeddating](https://github.com/tpope/vim-speeddating)
    `<C-a>,<C-x>` 方式，沿用到表示日期的字符串。
- [aur-archive/vim-stlrefvim](https://github.com/aur-archive/vim-stlrefvim)
    `stl` 的 vim-help
- [vim-scripts/CRefVim](https://github.com/vim-scripts/CRefVim)
    `c-runtime-api` 的 vim-help
- [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
    增强型，光标快速定位——”指哪打哪“
    类似浏览器alt + 数字 调整到具体widget的快速跳转功能
- [will133/vim-dirdiff](https://github.com/will133/vim-dirdiff)
    目录比较工具；
- [ashisha/image.vim](https://github.com/ashisha/image.vim)
- [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
    按名称，快速路径搜索特定文件。
- [rking/ag.vim](https://github.com/rking/ag.vim)
    整合命令行工具 `ag` 的vim插件。

----

## vim插件机制发展历史

vim插件的管理方式，大致分为三个阶段：

1. 手动管理阶段

   基于 `$vim` 文件夹目录的层级结构，手动下载 `vim` 插件包，并复制到对应的文件夹中。

   插件，一般也是一个目录结构的资源形式，通常用压缩包进行手动安装。这有一个麻烦，往往需要依赖第三方解压软件，而且，用户还可能弄错解压目的路径。

2. `vimball` 安装脚本，半手动管理阶段

   `vimball` 是一种 `vim` 本身支持脚本打包模式，在用 `vim` 打开该 `vimball` （.vba）文件后，再 `vim:so %`，即可将该插件，正确安装。

   经过时间的积累，第三方 `vim` 插件越来越多，上述两种方式，其本质，都是将原本分开的插件包，重新放置到 `$vim` 文件夹中。
   就好比 `linux` 中，C语言头文件一样，通常都是在 `/usr/include/` 下面 —— 具体，那个头文件，分属于哪个软件库，一般人是没法一眼就分清楚的。

   `$vim` 插件，沿用这种管理方式，也必然导致插件之间的耦合，管理的混乱，冲突之后，不方便找出干扰，等等。

3. `&rtp` （ 动态 runtimepath 路径） 省心的管理方式

   `vim` 搜索脚本，有一个特性，就是它会依次搜索 `vim` 内部变量 `&rtp` 中的路径，并且按照 `$vim` 中，文件夹目录的层级关系来搜索。
   就是说，如果动态管理这个 `&rtp` 变量，就可以达到，`动态` 管理 `vim` 插件的能力 —— 同时，不同插件，分属于自己的 插件根目录，还能方便进行插件管理。

   同时，`github` 仓库的流行，也让这种管理方式变得容易。

   利用 `vim` 这种动态载入特性的脚本，大概有 `pathogen`，`vundle`，`neobundle` 等等。它们的功能大同小异，都是将存放于 `github` 上的 `vim` 插件，
   通过 `git` 命令行工具，下载到 `$VIM/bundle/插件名` 这样的独立的路径下；并将这个路径，动态添加到 `&rtp` 中。
   区别在于，更多协议的支持，比如从 `http://vim-scripts.org/` 下载插件并自动管理；或者，支持更细节的插件管理设置。

   这样，动态启用、禁用某插件，就变得可能。而不像 `前 git` 时代，只能手动删除某插件的所有文件，或者再手动添加回去……

----

## FAQ

Q: 如何让 `NERDTree` 插件可以使用 `vim-devicons` 图标字体？

A: 请参考 https://github.com/chxuan/vimplus 中，sh按照脚本中描述，进行操作。

Q: 为什么在安装 `vim-devicons` 插件之后， `NERDTree` 中只有部分图标字体正常显示，而相当部分是乱码“中文”？

A: 可能是设置了 `guifontwide` 属性的原因；`vim-devicons` 所用字体，会与部分中文字体混淆；
   此时需要执行 `:set guifontwide=` ，清空 `gfw` 值即可。

Q: 为什么我的 `vim` 在终端下，没有 `gvim` 版本，颜色丰富好看？

A: 终端下，颜色支持有限，比如，`windows` 下的 `cmd window`，前景色，背景色，各支持8种。`vim` 默认只使用8种颜色，必然单调。
   不过，可以根据终端的实际种类，设置具体的 `t_Co` 值，以支持尽可能丰富的颜色。比如，`xterm` 可以支持 256 种颜色。
