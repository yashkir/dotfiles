" NVimRC
" Yuriy Yashkir (yuriy.yashkir@gmail.com)
set background=dark
colorscheme yuriy
let g:python3_host_prog = '/usr/bin/python3'

"{{{--- Plugins --- 
" Set up plug.vim if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
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
"Plug 'owickstrom/vim-colors-paramount'
"Plug 'axvr/photon.vim'
Plug 'yashkir/photon.vim'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'adelarsq/vim-matchit'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
"Plug 'tmhedberg/SimpylFold'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'cohama/lexima.vim'
Plug 'eliba2/vim-node-inspect'
"Plug 'vuciv/vim-bujo'
"Plug 'leafgarland/typescript-vim'
Plug 'Alok/notational-fzf-vim'
"Plug 'dbeniamine/todo.txt-vim'
Plug 'puremourning/vimspector' "TODO check it out
Plug 'szw/vim-maximizer'
"Plug 'vim-syntastic/syntastic'
Plug 'liuchengxu/vim-which-key'
"Plug 'dbeniamine/cheat.sh-vim'
"Plug 'godlygeek/tabular'
"Plug 'ledger/vim-ledger'
"Plug 'SirVer/ultisnips'
"Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
let g:deoplete#enable_at_startup = 1
"}}}

"{{{--- BASIC SETs ---
set nocompatible
set textwidth=120
set tabstop=4
set shiftwidth=0
set expandtab
set smarttab
set smartindent
set hidden
set scrolloff=2
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

""" FOLDING
set foldmethod=syntax
set foldlevelstart=99

let javaScript_fold=1

"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
" Persistent Undo
set undofile
set undodir=~/.nvim/undo/

let g:termdebug_wide = 163
"}}}

"{{{--- BINDS ---
nmap <leader>w :w<cr>
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "\\"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\\'<CR>
"map <leader>ve :e $HOME/.vimrc<CR>
"map <leader>vs :so $HOME/.vimrc<CR>
map <leader>ve :e $HOME/.config/nvim/init.vim<CR>
map <leader>vs :so $HOME/.config/nvim/init.vim<CR>

map <leader>D :put =strftime('# %a %Y-%m-%d %H:%M')<CR>kdd
map <leader>rr :w<CR>:!%:p<CR>

map <leader>w :w<CR>
map <leader>h :set hlsearch!<CR>
map <leader>md :InstantMarkdownPreview<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>fn :NERDTreeFind<CR>

" greatest remap paste replace
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
map <leader>fp :Files ~/projects/<CR>
map <leader>f~ :Files ~<CR>
map <leader>f. :Files .<CR>
map <leader>fb :Buffers<CR>
map <leader>fh :History<CR>
"nnoremap <C-p> :GFiles<CR>
nnoremap <leader><C-p> :Rg<CR>
map <leader>G :Git<CR>
nnoremap <leader>gb :Git blame<cr>
map <leader>n :NV!<CR>

" DEBUGGING
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>de :call vimspector#Reset()<CR>
nmap <leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<CR>
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>dr <Plug>VimspectorReset
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sr :SyntasticReset<CR>

map <leader>gp :Prettier<CR>

" nice pastes
nmap <silent> <leader>p* :set paste<CR>"*p:set nopaste<CR>
nmap <silent> <leader>p+ :set paste<CR>"+p:set nopaste<CR>

"}}}}}}

"{{{--- AutoCMD ---
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
autocmd FileType vimwiki setlocal nowrap
autocmd FileType vimwiki setlocal shiftwidth=4
autocmd FileType vimwiki setlocal tabstop=4
autocmd FileType markdown setlocal tabstop=4
autocmd FileType markdown setlocal textwidth=78
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd filetype todo setlocal omnifunc=todo#Complete
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier
autocmd FileType vimwiki let b:surround_98 = "**\r**"
autocmd FileType markdown let b:surround_98 = "**\r**"
"}}}

"{{{--- APPEARANCE ---

" GVIM
set guifont=Iosevka\ Term\ Expanded\ 11
set guioptions-=T

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ''
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'SignColumn': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'Pmenu': { '256ctermfg': '255', '256ctermbg': 235 },
\}
colorscheme jellybeans
"set termguicolors
"colorscheme boo
"hi Normal guibg=#000000
"colorscheme photon
hi link pythonClassVar Special

" Custom folding text
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

let g:vimspector_enable_mappings = 'HUMAN'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']

let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" }
let g:prettier#config#print_width = 120
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

"g:vimspector_base_dir='/home/yashkir/.config/nvim/plugged/vimspector'
" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
nnoremap <leader>f? <cmd>Telescope help_tags<cr>
nnoremap <C-p> <cmd>Telescope find_files<CR>

"}}}

"{{{--- COC ---
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gq <Plug>(coc-action-do-quickfix)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
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

" vim: set foldmethod=marker
