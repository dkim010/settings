call pathogen#infect()

set nocp nu ru hls enc=utf-8
set si et sw=4 ts=4 sts=4 bs=indent,eol,start

filetype plugin on
syntax on

set laststatus=2
set t_Co=256

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
"hi Comment ctermfg=LightBlue

set incsearch		" 키워드를 입력할 때마다 검색하는 점진 검색 사용
set hls				" 검색 결과 하이라이트
hi Search cterm=NONE ctermfg=grey ctermbg=yellow
hi Visual cterm=NONE ctermfg=grey ctermbg=yellow
set sc				" 완성중인 명령을 표시
set title			" 현재 편집중인 파일 표시
set ic				" 찾기에서 대소문자 구별 않음
set ru				" 커서 위치 항상 보이기
set ls=2			" 항상 status 라인을 표시
set statusline+=%F  " status line full path
"set mouse=nichrv
"let Tlist_Auto_Open=1
let Tlist_Compact_Format=0
let Tlist_Highlight_Tag_On_BufEnter=1

"" Key Map (Alt left and right)
set mousefocus
"map <m-a> ggVG
"map ^[f <C-w>l
"map ^[b <C-w>h
"
set cursorline

"" Keep buffer position on window split
function __sp()
    let savex = winsaveview()
    execute "normal \<C-w>\<C-v>"
    call winrestview(savex)
endfunction
nmap <C-w>v :call __sp()<CR>

"" buffer position keep on window split
"set splitright
"function MySplit()
"    vsplit
"    execute "normal \<C-w>\<C-w>"
"endfunction
"nmap <C-w>v :call MySplit()<CR>

highlight ColorColumn ctermbg=235 guibg=#2c2d27
execute "set colorcolumn=" . join(range(81,335), ',')
