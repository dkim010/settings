scripte utf-8

" vim: set fenc=utf-8 tw=0: "
" 파일의 첫부분에 위의 2줄을 꼭 남길것.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM rc
"
execute pathogen#infect()
filetype plugin on
syntax on

set all&                " 모든 옵션 원래대로 복원
set nocompatible        " nocp | vim default기능들을 사용함
set hi=1000             " 명령어 기록을 남길 갯수 지정
set re=2                " fix a bug when opening ts files

"##### colorscheme setting
"set t_Co=256
"colorscheme elflord
"colorscheme railscasts
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"##### highlight setting
"hi Comment ctermfg=LightBlue
"hi Search cterm=NONE ctermfg=grey ctermbg=yellow
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi Visual cterm=NONE ctermfg=grey ctermbg=yellow
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
execute "set colorcolumn=" . join(range(80,335), ',')

"##### view
set number              " nu   | 줄 번호 붙임
set nuw=4               " 줄 번호 너비 설정
set ruler               " ru   | 상태표시줄에 커서 위치 보여줌
set showmatch           " 매치되는 괄호의 반대쪽을 보여줌
set title               " 현재 편집중인 파일 표시
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\  " Status 표기
set showcmd             " 명령어를 상태라인에 보여줌
set sc                  " 완성중인 명령을 표시
"set cursorline          " 현재 라인 강조
set laststatus=2

"##### format
set enc=utf-8
set bs=eol,start,indent " backspace 사용
set si ai et            " smartindent autoindent expandtab
" smartindent   |       " si    | smart 자동 들여쓰기
" autoindent    |       " ai    | 자동 들여쓰기
" expandtab     |       " et    | tab -> space 변환
" cindent       |       " cin   | c언어 자동 들여쓰기 : 사용하지 않음
set ts=4 sts=4 sw=4     " tastop softtabstop shiftwidth
" tabstop       |       " ts    | '\t' 문자를 몇칸으로 보일지 결정
" softtabstop   |       " sts   | <TAB>키를 눌렀을때 표시되는 간격
" shiftwidth    |       " sw    | >> , << 사용시 들여쓰기 간격
autocmd FileType hql,javascript,xml,proto,cpp,hpp,html,json setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.yml setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.yaml setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.config setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.nomad setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.md setlocal ts=4 sts=4 sw=4
autocmd BufRead,BufNewFile *.gitconfig setlocal ts=2 sts=2 sw=2

"##### search
set hlsearch            " hls   |검색 결과 하이라이트
set ls=2                " 항상 status 라인을 표시
set incsearch           " 키워드를 입력할 때마다 검색하는 점진 검색 사용
set ic                  " 찾기에서 대소문자 구별 않음

"##### Keep buffer position on window split
function __sp()
    let savex = winsaveview()
    execute "normal \<C-w>\<C-v>"
    call winrestview(savex)
endfunction
nmap <C-w>v :call __sp()<CR>
nmap <C-w>f :vertical wincmd f<CR>

"##### plugin: Tlist
map <F5> :TlistToggle<CR>
let Tlist_Compact_Format=0
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Inc_Winwidth=0
let Tlist_WinWidth = 30
let Tlist_Exit_OnlyWindow=1

"##### plugin nerdtree
"autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '__pycache__$', '\.egg-info$', '\.eggs$', '\.pytest_cache$'] " ignore files in nerd tree
map <C-n> :NERDTreeToggle<CR>

"set mps+=<:>           " 괄호짝 찾기 기능에 사용자 괄호 종류 추가
"
"nmap :set hls!         " F1: Toggle hlsearch
"nnoremap :set list!    " F2: Toggle list
"
"##### fold
set foldmethod=indent
set foldlevelstart=20
nnoremap <space> za
vnoremap <space> zf
"autocmd FileType yaml,yml setlocal foldmethod=indent
"autocmd FileType yaml,yml let yaml_syntax_folding=1

"##### plugin syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()} "add a syntastic flag to the status line
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1 "the location list is overwritten with Syntastic's own list
"let g:syntastic_auto_loc_list = 1 "the error window will be automatically opened when errors are detected, and closed when none are detected
"let g:syntastic_check_on_open = 1 "enable the syntax checking on file open
"let g:syntastic_check_on_wq = 0 "disable the syntax checking on :wq
"let g:syntastic_python_checkers = ['flake8', 'pylint'] "set python checkers to flake8 and pylint
"let g:syntastic_mode_map = { "mode": "active"}  "set syntastic to automatically activate

">> ALE
let g:ale_linters = {
      \ 'python': ['pylint'],
      \ }
"let g:ale_python_pylint_options = '--max-line-length=79 --ignore-docstrings y'
"let g:ale_python_pylint_options = '--rcfile /path/to/pylint.rc
let g:airline#extensions#ale#enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 3

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'derekwyatt/vim-scala'
"Plugin 'vim-erlang/vim-erlang-tags'
"Plugin 'jimenezrick/vimerl'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'valloric/youcompleteme'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'stephpy/vim-yaml'
Plugin 'pearofducks/ansible-vim'
call vundle#end()            " required

"##### vim
