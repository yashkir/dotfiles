" VimRC
" Yuriy Yashkir (yuriy.yashkir@gmail.com)
set background=dark
let g:python3_host_prog = '/usr/bin/python3'

"{{{--- Plugins --- 
" Set up plug.vim if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" - Coding -
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-marketplace'
" - Special files -
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
"Plug 'tools-life/taskwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" - Appearance/syntax -
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'Konfekt/FastFold'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
" - Currently Unused -
Plug 'owickstrom/vim-colors-paramount'
"Plug 'axvr/photon.vim'
Plug 'yashkir/photon.vim'
Plug 'adelarsq/vim-matchit'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
"Plug 'tmhedberg/SimpylFold'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'cohama/lexima.vim'
Plug 'eliba2/vim-node-inspect'
Plug 'vuciv/vim-bujo'
"Plug 'leafgarland/typescript-vim'
Plug 'Alok/notational-fzf-vim'
"Plug 'dbeniamine/todo.txt-vim'
Plug 'puremourning/vimspector' "TODO check it out
Plug 'szw/vim-maximizer'
Plug 'vim-syntastic/syntastic'
Plug 'liuchengxu/vim-which-key'
"Plug 'dbeniamine/cheat.sh-vim'
Plug 'godlygeek/tabular'
Plug 'ledger/vim-ledger'
"Plug 'SirVer/ultisnips'
"Plug 'plasticboy/vim-markdown'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()
"}}}
"{{{--- BASIC SETs ---
set textwidth=120
set nocompatible
set tabstop=4
set shiftwidth=0
set expandtab
set smarttab
set smartindent
set hidden
set scrolloff=8
set laststatus=2
set showcmd
set showmode
set number
set relativenumber
set incsearch
set wildmenu
set wildmode=list:longest,full
set updatetime=500
set signcolumn=yes

let $BASH_ENV="~/.vim_bash_env"

""" NetRW
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_winsize = 25
"let g:netrw_usetab=1
nmap <Leader>l :Lexplore<cr>

""" FOLDING
set foldmethod=syntax
set foldlevelstart=99

let javaScript_fold=1

"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
" Persistent Undo
set undofile
set undodir=~/.vim/undo/

let g:termdebug_wide = 163
"}}}
"{{{--- BINDS ---
nmap <leader>w :w<cr>
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "\\"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\\'<CR>
map <leader>ve :e $HOME/.vimrc<CR>
map <leader>vs :so $HOME/.vimrc<CR>

map <leader>D :put =strftime('# %a %Y-%m-%d %H:%M')<CR>kdd
"map <leader>D :put =strftime('# %a %Y-%m-%d %H:%M:%S%z')<CR>
"Run current file
map <leader>rp :w<CR>:!g++ % -o %< && ./%<<CR>
map <leader>rc :w<CR>:!gcc % -o %< && ./%<<CR>
map <leader>rdc :w<CR>:!gcc -g % -o %< && gdb ./%<<CR>
map <leader>rr :w<CR>:!%:p<CR>
map <leader>ra :w<CR>:!rustc % && ./%<<CR>
map <leader>ru :w<CR>:!cargo run<CR>
nmap <leader><rl> :exec '!'.getline('.')

"map <Space> za

map <leader>mm :w<CR>:make!<CR>
map <leader>w :w<CR>
map <leader>h :set hlsearch!<CR>
map <leader>md :InstantMarkdownPreview<CR>
map <leader>t :NERDTreeToggle<CR>

" greatest remap
vnoremap <leader>p "_dP

" ALT j, ALT k to move lines
nnoremap <M-j> :m+1<CR>==
nnoremap <M-k> :m-2<CR>==
inoremap <M-j> <Esc>:m+1<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m'>+1<CR>gv=gv
vnoremap <M-k> :m'<-2<CR>gv=gv

" --- Plugins
map <leader>g :GitGutterToggle<CR>
map <leader>p :Files ~/projects/<CR>
map <leader>f~ :Files ~<CR>
map <leader>f. :Files .<CR>
map <leader>b :Buffers<CR>
map <leader>fh :History<CR>
map <leader>G :Git<CR>
map <leader>fh :History<CR>
map <leader>n :NV!<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><C-p> :Rg<CR>
nmap <C-S> <Plug>BujoAddnormal
nmap <C-Q> <Plug>BujoChecknormal
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>dr <Plug>VimspectorReset

nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sr :SyntasticReset<CR>

map <leader>cn :cn<CR>
map <leader>cp :cp<CR>

map <leader>gp :Prettier<CR>

" nice pastes
nmap <silent> <leader>p* :set paste<CR>"*p:set nopaste<CR>
nmap <silent> <leader>p+ :set paste<CR>"+p:set nopaste<CR>

"}}}}}}
"{{{--- AutoCMD ---
""TODO move this stuff out to appropriate directories
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal tabstop=2
autocmd FileType htmldjango setlocal tabstop=2
autocmd FileType javascript setlocal tabstop=2
autocmd FileType typescript setlocal tabstop=2
autocmd FileType javascriptreact setlocal tabstop=2
autocmd FileType typescriptreact setlocal tabstop=2
autocmd FileType jst setlocal tabstop=2
autocmd FileType jst setlocal textwidth=78
autocmd FileType c setlocal tabstop=4
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal foldmethod=indent
autocmd FileType css setlocal tabstop=2
autocmd FileType less setlocal tabstop=2
autocmd FileType scss setlocal tabstop=2
autocmd FileType php setlocal tabstop=2
autocmd FileType elm setlocal tabstop=2
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
autocmd FileType htmldjango let b:surround_37 = "{% \r %}" " %
autocmd FileType htmldjango let b:surround_45 = "{{ \r }}" " -
autocmd FileType vimwiki setlocal nowrap
autocmd FileType vimwiki setlocal shiftwidth=4
autocmd FileType vimwiki setlocal tabstop=4
autocmd FileType markdown setlocal tabstop=4
autocmd FileType markdown setlocal textwidth=78
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd filetype todo setlocal omnifunc=todo#Complete
autocmd filetype sql set filetype=plsql
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

"augroup AutoSaveFolds
    "autocmd!
    "autocmd BufWinLeave * mkview
    "autocmd BufWinEnter * silent loadview
"augroup END
"autocmd FileType help wincmd L
"}}}
"{{{--- APPEARANCE ---
" fix termguicolors under tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors

" GVIM
set guifont=Iosevka\ Term\ Expanded\ 11
set guioptions-=T

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.whitespace = ''

let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'SignColumn': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'Pmenu': { '256ctermfg': '255', '256ctermbg': 235 },
\}
colorscheme jellybeans

"colorscheme photon
hi link pythonClassVar Special

set foldtext=MyFoldText()
set fillchars=vert:\|,fold:.
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = winwidth(0) - strdisplaywidth(line_text) - 15
    return line_text . repeat('.', fillcharcount) . ' ' . folded_line_num . ' L '
endfunction
" EX
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize=20
"}}}
"{{{--- Other PLUGINS ---
"--- FZF ---
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

"--- VIMWIKI ---
let g:taskwiki_markup_syntax = "markdown"
set conceallevel=2
"let g:vimwiki_folding = 'list'
let g:vimwiki_list = [{'path': '~/projects/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_global_ext = 0
"nmap <leader>wp :cd %:p:h<cr>:!git commit -a -m "vim autocommit"; git push<cr>
nmap <leader>vwp :!bash /home/yashkir/projects/wiki/autocommit.sh<CR>

"This allows us to check the syntax group under the cursor
nmap <leader>q :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

let g:instant_markdown_autostart = 0

" FASTFOLD
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:nv_search_paths = ['~/projects/wiki/inbox', '~/projects/wiki', '~/projects/notes']
let g:nv_use_short_pathnames = 1

let g:bujo#window_width = 40
let g:vimspector_enable_mappings = 'HUMAN'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" }
autocmd FileType vimwiki let b:surround_98 = "**\r**"
autocmd FileType markdown let b:surround_98 = "**\r**"
""let g:Todo_fold_char='+'
let g:prettier#config#print_width = 120
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

"}}}
"{{{--- COC ---
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gq <Plug>(coc-action-do-quickfix)

"COC ACTION is awesome
nmap <silent> <leader>ga :CocAction<cr>
xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>rf <Plug>(coc-refactor)

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" HELP SCROLLING
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
"}}}

nnoremap <leader>gb :Git blame<cr>
" vim: set foldmethod=marker
