nmap <silent> <c-n> :NERDTreeToggle<CR>
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black
"添加自动刷新
set autoread
" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
let g:syntastic_always_populate_loc_list = 1
set foldmethod=indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"无需用za实现折叠，用空格即可
nnoremap <space> za
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files= 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第 2 个字符开始补全
let g:ycm_min_num_of_chars_for_completion= 2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax= 1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'nerdtree' : 1,
			\}
let g:ycm_semantic_triggers =  {
			\'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
			\}
"End of YCM
let g:ycm_semantic_triggers={
			\'css':['re!^\s{4}','re!:\s+'],
			\'html':['</'],
			\}
set nocompatible  " be iMproved, required
filetype off  " required
set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path to include Vundle and initialize
call vundle#begin()    " alternatively, pass a path where Vundle should install plugins
"call vundle#begin '~/some/path/here'
" let Vundle manage Vundle, required
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'Chiel92/vim-autoformat'
Plugin 'posva/vim-vue'
let g:syntastic_javsacript_checkers = ['eslint']
let javascript_enable_domtumlcss=1
set clipboard=unnamed
let python_highlight_all=1
call vundle#end()
filetype plugin indent on
" Configuration file for vim
set modelines=0     " CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
map <F1> : !pdflatex % <CR>
map <F4> : !bibtex %<.aux <CR>
map <F9> : !g++ % -o %< <CR>
map <F6> : !./%< <CR>
map <F5> : !gdb %< <CR>
map <F2> : !python3.6 % <CR>
map <F7> : !javac % <CR>
map <F8> : !java %< <CR>
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible" Use Vim defaults instead of 100% vi compatibility
set backspace=2" more powerful backspacing
syntax on
" 语法高亮
"主题，自选
"let g:airline_theme="molokai"
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
"始终显示状态栏
set laststatus=2
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:used_javascript_libs = 'underscore,backbone'
"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"End
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 智能对齐
set autoindent
" 自动对齐
set confirm
" 在处理未保存或只读文件的时候，弹出确认
set tabstop=4
" Tab键的宽度
set softtabstop=4
set shiftwidth=4
"  统一缩进为4
set noexpandtab
" 不要用空格代替制表符
set number
" 显示行号
set history=50
" 历史纪录数
set hlsearch
set incsearch
" 搜索逐字符高亮
set gdefault
" 行内替换
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
" 编码设置
" 设置颜色主题
"colorscheme molokai
colorscheme desert
"colorscheme murphy 
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set autoindent
set smartindent
set guifont=Menlo:h16:cANSI
" 设置字体
set langmenu=zn_CN.UTF-8
set helplang=cn
" 语言设置
set cmdheight=2
" 命令行（在状态行）的高度，默认为1,这里是2
set ruler
" 在编辑过程中，在右下角显示光标位置的状态行
set laststatus=2
" 总是显示状态行
set showcmd
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set scrolloff=3
" 光标移动到buffer的顶部和底部时保持3行距离
set showmatch
" 高亮显示对应的括号
set matchtime=5
" 对应括号高亮的时间（单位是十分之一秒）
set autowrite
" 在切换buffer时自动保存当前文件
set wildmenu
" 增强模式中的命令行自动完成操作
set linespace=2
" 字符间插入的像素行数目
set whichwrap=b,s,<,>,[,]
filetype plugin indent on
vnoremap $1 <esc>`>a)<esc>`<i(<esc>

vnoremap $2 <esc>`>a]<esc>`<i[<esc>

vnoremap $3 <esc>`>a}<esc>`<i{<esc>

vnoremap $$ <esc>`>a"<esc>`<i"<esc>

vnoremap $q <esc>`>a'<esc>`<i'<esc>

vnoremap $e <esc>`>a"<esc>`<i"<esc>

"自动补全括号
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
set splitbelow
set splitright
"自动，非鼠标换屏
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"改变当前快捷键
autocmd filetype *html* imap <c-_> <c-y>/
autocmd filetype *html* map <c-_> <c-y>/
noremap <F3> :Autoformat<CR>

