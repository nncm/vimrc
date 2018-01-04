set nu
set showcmd 
set novisualbell 
set noerrorbells
set nocompatible
set showmatch 
set matchtime=1
"set nowrap
set nobackup
set scrolloff=3
set confirm
set noswapfile
set autoindent
set cindent
set ts=4
set backspace=indent,eol,start
set cursorline
set softtabstop=4
set shiftwidth=4
set ruler
set nowrap
set expandtab
set history=1000
set splitright
set splitbelow
set hlsearch
set mouse=a
set incsearch 
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set noeb vb t_vb=
syntax on
set laststatus=2
set t_Co=256
filetype off
filetype plugin on
"colorscheme desert
"colorscheme solarized
autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,c,java,perl,shell,bash,vim,cpp set ts=4 | set expandtab | set sw=4 | set sts=4
autocmd FileType ruby,python set ts=2 | set expandtab | set sw=2 | set sts=2

hi Pmenu    cterm=bold ctermbg=DarkBlue  ctermfg=White 
hi Pmenu    gui=bold guibg=DarkBlue  guifg=White 
hi PmenuSel cterm=bold ctermbg=DarkYellow ctermfg=White 
hi PmenuSel gui=bold guibg=DarkYellow guifg=White

colorscheme molokai

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'L9'
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'elzr/vim-json'
Plugin 'grep.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'The-NERD-tree'
Plugin 'benmills/vimux'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'matrix.vim'
Plugin 'cscope.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'pyflakes.vim'
"Plugin 'OmniCppComplete'
Plugin 'Pydiction'
Plugin 'FuzzyFinder'
Plugin 'bling/vim-airline'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'taglist.vim'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'AutoComplPop'
"Plugin 'word_complete.vim'
Plugin 'SuperTab'
Plugin 'bufexplorer.zip'
Plugin 'a.vim'
Plugin 'unblevable/quick-scope'
Plugin 'c.vim'
Plugin 'jiangmiao/auto-pairs'
if v:version >= 704
"    Plugin 'fatih/vim-go'
"    Plugin 'SirVer/ultisnips'
"    Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'Valloric/ListToggle'


filetype plugin indent on

call vundle#end()

" -- ctags setting --"
map<F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR><CR>
map<F10> :TlistUpdate<CR><CR>


set tags=tags
set tags+=./tags
"set tags+=~/qmodule/tags

"-- Tlist setting --"
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1 
let Tlist_WinWidth=25
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_Right_Window=1
map <F3> :TlistToggle<CR>

" --tagbar setting --"
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=25
map <silent> <F4> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" --nerdtree setting --"
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeDirArrows=0
let NERDTreeWinPos='left'
let NERDTreeWinSize=20
let NERDTreeShowBookmarks=1 
map <F2> :NERDTreeToggle<CR>

" -- minibufexpl setting --"
let g:miniBufExplMapWindowNavVim=1   
let g:miniBufExplMapWindowNavArrows=1   
let g:miniBufExplMapCTabSwitchBufs=1   
let g:miniBufExplModSelTarget=1  
let g:miniBufExplMoreThanOne=0
"map <F11> :MBEbp<CR><CR>
"map <F12> :MBEbn<CR><CR>

" -- YCM settings -- "
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
nnoremap <leader>lo :lopen<CR> "open locationlist
nnoremap <leader>lc :lclose<CR>   "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处"
nmap <F8> :YcmDiags<CR>

" -- quick scope settings -- "
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_second_occurrence_highlight_color = 81 
let g:qs_first_occurrence_highlight_color = 155


" --AutoComplPop settings -- "
let g:acp_behaviorKeywordLength = 1
"let g:AutoComplPop_MappingDriven = 1 


" -- cscope settings --"
if has("cscope")
	set cscopetag
	set csto=1
    set cscopequickfix=s-,c-,d-,i-,t-,e-
	set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
	elseif $CSCOPE_DB !=""
        cs add $CSCOPE_DB
	endif
    set cscopeverbose
	set csverb
    nmap <C-/>s :cs  s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-/>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"map <F6> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
map<F12> :!find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" > cscope.files; cscope -Rbq -i cscope.files<CR><CR> :cs add ./cscope.out .<CR><CR> :cs reset<CR><CR>

" -- OmniCppComplete setting --"
"set completeopt=menu,menuone
"imap <F4> <C-X><C-O>
"imap <F5> <C-X><C-I>
"let OmniCpp_MayCompleteDot=1
"let OmniCpp_MayCompleteArrow=1
"let OmniCpp_MayCompleteScope=1
"let OmniCpp_SelectFirstItem=2
"let OmniCpp_NamespaceSearch=2
"let OmniCpp_ShowPrototypeInAbbr=1
"let OmniCpp_GlobalScopeSearch=1
"let OmniCpp_DisplayMode=1
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_ShowScopeInAbbr=1
"let OmniCpp_ShowAccess=1

" -- python complete setting --"
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_location+='.'

" -- solarized setting -- "
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility='normal'
let g:solarized_degrade=0 


" -- ctrlp setting -- "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'find %s -type f | grep -v ".svn"'
let g:ctrlp_max_files=10000
let g:ctrlp_max_depth=60
let g:ctrlp_swithc_buffer=0
let g:ctrlp_working_path_mode='ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.svn-base   " MacOSX/Linux

" --vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ 
  \ }

" -- airline setting -- "
"let g:airline#extensions#tabline#enabled=0
""let g:airline_section_b='%{strftime("%c")}'
"let g:airline_section_y='BN: %{bufnr("%")}'
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='>'
let g:airline_section_warning=0 
"nnoremap [b :bp<CR>
"nnoremap ]b :bn<CR>

" -- SuperTab setting -- "
let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>" 

map <F11> :call AddTitle()<cr>
map <F12> :call UpdateTitle()<cr>

function AddTitle()
    call setline(1, "/*")
    call append(line(".")+0, "#=====================================================")
    call append(line(".")+1, "#")
    call append(line(".")+2, "#     Filename     :    ".expand("%:t"))
    call append(line(".")+3, "#     Desc         :    ")
    call append(line(".")+4, "#     Version      :    1.0")
    call append(line(".")+5, "#     Created      :    ".strftime("%Y-%m-%d %H:%M"))
    call append(line(".")+6, "#     Last Modified:    ".strftime("%Y-%m-%d %H:%M"))
    call append(line(".")+7, "#     Author       :    dobb!n")
    call append(line(".")+8, "#     Company      :    Qihoo.Inc")
    call append(line(".")+9, "#")
    call append(line(".")+10, "#=====================================================")
    call append(line(".")+11, "*/")
    call append(line(".")+12, "")
endf

function UpdateTitle()
    normal m'
    execute '/# *Last Modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename/s@:.*$@\=":\t".expand("%:t")@'
    execute "noh"
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None'
endf

