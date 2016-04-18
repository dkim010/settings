scripte utf-8
" vim: set fenc=utf-8 tw=0: "
" 파일의 첫부분에 위의 2줄을 꼭 남길것.

set all&			" 모든 옵션 원래대로 복원
set hi=1000			" 명령어 기록을 남길 갯수 지정
"set vb				" 오류음 대신 비주얼벨 사용
"set lz				" 매크로 실행중에 화면을 다시 그리지 않음
"set lpl			" 프로그램 시작시 플러그인 로드



"인코딩 설정
"set enc=utf-8
"set fenc=utf-8


filetype on			" 파일의 종류를 자동으로 인식
syntax on			" 자동 문법 강조

set nocompatible 	" vim default기능들을 사용함
set number			" 줄 번호 붙임
set nuw=4			" 줄 번호 너비 설정
set backspace=2		" 삽입 모드에서 백스페이를 계속 허용
set autoindent		" 자동 들여쓰기
set cindent			" c언어 자동 들여쓰기
set smartindent		" smart 자동 들여쓰기
"set nowrap			" 자동 줄바꿈 안함
set ic				" 찾기에서 대소문자 구별 않음
set ruler			" 상태표시줄에 커서 위치 보여줌
set ts=4			" tab 크기
set sw=4			" tab 크기
set noet			" tab -> space 변환 사용안함
set sts=0			" 위와 동일
set shiftwidth=4 	" 자동 들여쓰기 간격
set showcmd			" 명령어를 상태라인에 보여줌
set showmatch		" 매치되는 괄호의 반대쪽을 보여줌
set title			" 현재 편집중인 파일 표시
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\     " 다중 문서 작업을 위한 Status 줄
set mousehide		" 타이핑 중에 마우스 숨김
set hls				" 검색 결과 하이라이트
set ru				" 커서 위치 항상 보이기
set sc				" 완성중인 명령을 표시
set mps+=<:>
set ls=2			" 항상 status 라인을 표시
set incsearch		" 키워드를 입력할 때마다 검색하는 점진 검색 사용

"nmap :set hls!		" F1: Toggle hlsearch
"nnoremap :set list!	" F2: Toggle list


"Galch
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required

filetype plugin indent on    " required

"filetype plugin on

" Brief help

" :PluginList       - lists configured plugins

" :PluginInstall    - installs plugins; append `!` to update or just

" :PluginUpdate

" :PluginSearch foo - searches for foo; append `!` to refresh local cache

" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Vim에서 파일 탐색기를 사용할 수 있게 한다. - Nerd Tree

Plugin 'The-NERD-tree'

" Vim에서 자동완성 기능(Ctrl + P)을 키입력하지 않더라도 자동으로 나타나게 - AutoComplPop

Plugin 'AutoComplPop'

" NERD Tree를 왼쪽에 생성

let NERDTreeWinPos = "left"

" NERD Tree는 F7키. Tag List는 F8키에 매칭.

nmap <F7> :NERDTree<CR>

filetype on

set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\


" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
" 구문 강조 사용
if has("syntax")
	syntax on
	endif

	"folding settings
	set foldmethod=syntax   "fold based on syntax
	set foldnestmax=10      "deepest fold is 10 levels
	set nofoldenable        "dont fold by default
	set foldlevel=0         "this is just what i use
	hi Folded ctermbg=242
	autocmd BufWinLeave *.* mkview			" save folding status
	autocmd BufWinEnter *.* silent loadview " load folding status
