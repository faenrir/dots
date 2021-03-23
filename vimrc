"______ _____ _____ _____   _____ _   _ ___________
"| ___ \  ___/  ___|_   _| |  ___| | | |  ___| ___ \
"| |_/ / |__ \ `--.  | |   | |__ | | | | |__ | |_/ /
"| ___ \  __| `--. \ | |   |  __|| | | |  __||    /
"| |_/ / |___/\__/ / | |   | |___\ \_/ / |___| |\ \
"\____/\____/\____/  \_/   \____/ \___/\____/\_| \_|
"
set encoding=UTF-8
set t_RB= t_RF= t_RV= t_u7=

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	augroup PLUG
		au!
		autocmd VimEnter * PlugInstall
	augroup END
endif

" enable support for mouse-click
:set mouse=a

" use X Window clipboard
:set clipboard=unnamedplus

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Themes
"Plug 'liuchengxu/space-vim-theme'
"Plug 'cormacrelf/vim-colors-github'
"Plug 'kyoz/purify', { 'rtp': 'vim' }

" Zen-Mode
Plug 'junegunn/goyo.vim'

Plug 'liuchengxu/vim-clap'
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

"Plug 'valloric/youcompleteme'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_compiler_progname='latexmk'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:go_highlight_diagnostic_errors=0
let g:go_highlight_diagnostic_warnings=0

"Plug 'sirver/ultisnips'
"let g:UltiSnipsExpandTrigger = '<c>'
"let g:UltiSnipsJumpForwardTrigger = '<c-b>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

Plug 'honza/vim-snippets'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
 "Plug 'tpop/vim-markdown'
"

" Kotlin Syntax Highlighting
Plug 'udalov/kotlin-vim'

" highlight enclosing xml/html tags
Plug 'valloric/matchtagalways'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Angular and Web Development
Plug 'https://github.com/leafgarland/typescript-vim'

Plug 'https://github.com/Quramy/vim-js-pretty-template'

Plug 'https://github.com/pangloss/vim-javascript'

Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}

Plug 'https://github.com/Quramy/tsuquyomi'

"Plug 'https://github.com/Valloric/YouCompleteMe'

Plug 'https://github.com/vim-syntastic/syntastic'

Plug 'https://github.com/editorconfig/editorconfig-vim'

Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree'

Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'https://github.com/xavierd/clang_complete'

Plug 'mhinz/vim-startify'

Plug 'myusuf3/numbers.vim'

Plug 'mattn/emmet-vim'

Plug 'davidhalter/jedi-vim'

Plug 'matze/vim-move'

Plug 'AndrewRadev/tagalong.vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'kovetskiy/sxhkd-vim'

Plug 'chrisbra/colorizer'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

Plug 'stevearc/vim-arduino'

Plug 'morhetz/gruvbox'

Plug 'kyoz/purify', { 'rtp': 'vim' }

Plug 'itchyny/lightline.vim'

"Plug 'zxqfl/tabnine-vim'

Plug 'https://github.com/McSinyx/vim-octave.git', {'for': 'octave'}

Plug 'vim-pandoc/vim-pandoc'

Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'kqito/vim-easy-replace'

Plug 'turbio/bracey.vim'

Plug 'wfxr/minimap.vim'

" Initialize plugin system
call plug#end()
"execute pathogen#infect()
"call pathogen#helptags()

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" toggle autosave
nnoremap <leader>l :autocmd TextChanged,TextChangedI <buffer> write<CR>

" WebDev
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"autocmd FileType typescript JsPreTmpl html
"autocmd FileType typescript syn clear foldBraces

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

set pythonthreehome=/usr
let g:ycm_python_binary_path = 'python'

filetype plugin on

" Keymaps
nmap <F1> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

let g:user_emmet_leader_key=','

let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""

set laststatus=2

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" Theme
set background=dark
"highlight Normal ctermbg=None
colorscheme purify
let g:lightline = {
      \ 'colorscheme': 'purify',
      \ }

":autocmd BufWritePost * silent !vimautorun
:set spelllang=en_us,de_de

let g:bracey_auto_start_browser=1
let g:bracey_server_allow_remote_connections=1
let g:bracey_server_port=8040

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 0
let g:minimap_highlight_range = 0
let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar' ]
