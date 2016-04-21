scripte utf-8

" vim: set fenc=utf-8 tw=0: "
" 파일의 첫부분에 위의 2줄을 꼭 남길것.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM rc

filetype plugin on
syntax on
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"##### vim
set all&                " 모든 옵션 원래대로 복원
set nocompatible        " nocp | vim default기능들을 사용함
set hi=1000             " 명령어 기록을 남길 갯수 지정

"##### color setting
set t_Co=256
:colorscheme elflord 
"hi Comment ctermfg=LightBlue
hi Search cterm=NONE ctermfg=grey ctermbg=yellow
hi Visual cterm=NONE ctermfg=grey ctermbg=yellow
highlight ColorColumn ctermbg=235 guibg=#2c2d27
execute "set colorcolumn=" . join(range(81,335), ',')

"##### view
set number              " nu   | 줄 번호 붙임
set nuw=4               " 줄 번호 너비 설정
set ruler               " ru   | 상태표시줄에 커서 위치 보여줌
set showmatch           " 매치되는 괄호의 반대쪽을 보여줌
set title               " 현재 편집중인 파일 표시
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\  " Status 표기
set showcmd             " 명령어를 상태라인에 보여줌
set sc                  " 완성중인 명령을 표시
set cursorline          " 현재 라인 강조
set laststatus=2

"##### format
set enc=utf-8
set expandtab           " et    | tab -> space 변환
set tabstop=4           " ts    | '\t' 문자를 몇칸으로 보일지 결정
set shiftwidth=4        " sw    | >> , << 사용시 들여쓰기 간격
set softtabstop=4       " sts   | <TAB>키를 눌렀을때 표시되는 간격
set bs=eol,start,indent " backspace 사용

"##### intent
set smartindent         " si    | smart 자동 들여쓰기
set autoindent          " ai    | 자동 들여쓰기
set cindent             " ci    | c언어 자동 들여쓰기

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

"##### plugin: Tlist
map <F5> :TlistToggle<CR>
let Tlist_Compact_Format=0
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Inc_Winwidth=0
let Tlist_WinWidth = 22
let Tlist_Exit_OnlyWindow=1

"set mps+=<:>           " 괄호짝 찾기 기능에 사용자 괄호 종류 추가
"
"nmap :set hls!         " F1: Toggle hlsearch
"nnoremap :set list!    " F2: Toggle list

