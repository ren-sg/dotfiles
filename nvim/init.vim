call plug#begin()

" Plug 'ervandew/supertab'
" Plug 'metalelf0/supertab'
" Plug 'honza/vim-snippets'
"
"highlight
" Plug 'junegunn/goyo.vim'
"" Plug 'junegunn/limelight.vim'


" Plug 'brooth/far.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-commentary'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" Plug 'severin-lemaignan/vim-minimap'

""colorschemes
Plug 'chriskempson/base16-vim'

" Plug 'motemen/xslate-vim'
" Plug 'Yggdroot/indentLine'

" PostCss
" Plug 'stephenway/postcss.vim'

" Ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Linters
Plug 'w0rp/ale'

" HTML&XML
" Plug 'sukima/xmledit'

" Python3
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
" Plug 'ambv/black'
" Plug 'davidhalter/jedi-vim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maksimr/vim-jsbeautify'
Plug 'sbdchd/neoformat'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

"Debug
" Plug 'mfussenegger/nvim-dap'

" Zen mode
Plug 'folke/zen-mode.nvim'


"==================== Plugin_template {{{
"=============================

"==========================}}}
"=============================

" let g:virtualenv_directory = '/home/renal/.config/nvim'
" let g:ale_virtualenv_dir_names = []
set shell=/bin/bash

let g:python2_host_prog = '/usr/bin/python2'
" let g:python2_host_prog = '/home/renal/.config/nvim/plugged/python-support.nvim/autoload/nvim_py2/bin/python2.7'
let g:python3_host_prog = '/home/qq/.config/nvim/python3/bin/python'


call plug#end()

if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.local/.vim/tmp/backup
  set backupdir+=~/.vim/tmp/backup    " keep backup files out of the way
  set backupdir+=.
endif

if exists('$SUDO_USER')
  set noswapfile                      " don't create root-owned files
else
  set directory=~/.local/.vim/tmp/swap//
  set directory+=~/.vim/tmp/swap//    " keep swap files out of the way
  set directory+=.
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    set undodir=~/.local/.vim/tmp/undo
    set undodir+=~/.vim/tmp/undo      " keep undo files out of the way
    set undodir+=.
    set noundofile                      " actually use undo files
  endif
endif

if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif

if has('linebreak')
  set breakindent                     " indent wrapped lines to match start
  if exists('&breakindentopt')
    set breakindentopt=shift:2        " emphasize broken lines by indenting them
  endif
endif

if exists('+colorcolumn')
  " Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

set cursorline

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

set mouse=a

"Mappings

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
" nnoremap <leader>w :update<cr>
nnoremap <Leader>a a<Space><Right><Esc>

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>


" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" qq to record, Q to replay
nnoremap Q @q

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

map <F3> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

"" Close buffer
noremap <leader>c :bd<CR>


" ----------------------------------------------------------------------------
" vim-commentary
" ----------------------------------------------------------------------------
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine


" YouCompleteMe and UltiSnips compatibility.
let g:UltiSnipsExpandTrigger = '<S-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets = "<c-k>"
" let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Prevent UltiSnips from removing our carefully-crafted mappings.
let g:UltiSnipsMappingsToIgnore = ['autocomplete']

" let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_autoclose_preview_window_after_completion = 2
let g:ycm_max_num_candidates = 20

let g:ycm_auto_trigger = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_complete_in_strings = 0
let g:ycm_disable_signature_help = 1

let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}
"
" let g:ycm_key_invoke_completion = '<C-Space>'
" set completeopt=longest,menu


" CtrlP change working directory
" let g:ctrlp_working_path_mode = 'rw'
let g:NERDTreeChDirMode       = 2
let g:Tlist_WinWidth=40
let g:NERDTreeWinSize=40
let g:NERDTreeMouseMode=3

" colorscheme
" let base16colorspace=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" colorscheme gruvbox 
" set t_Co=256
set termguicolors
set background=dark
" colorscheme PaperColor
colorscheme base16-ocean

"set background=dark

" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

let mapleader      = ' '
let maplocalleader = ' '

augroup vimrc
  autocmd!
augroup END

filetype on
set textwidth=100 
set encoding=utf-8
set encoding=UTF-8
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hidden
set list
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set noshowmatch                       " don't jump between matching brackets

set number
set hlsearch
set ignorecase smartcase
set incsearch

set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set backspace=indent,eol,start

" wrap
" set formatoptions+=t
set formatoptions-=t

nnoremap Y y$

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vmap <C-c> "+yi
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" For each time K has produced timely, useful results, I have pressed it 10,000
" times without meaning to, triggering an annoying delay.
nnoremap K <nop>

" Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>


" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" ----------------------------------------------------------------------------
" Leader mappings.
" ----------------------------------------------------------------------------

nnoremap <silent> <Leader>ic :source $MYVIMRC<cr>
nnoremap <silent> <Leader>i :e $MYVIMRC<cr>

" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>o :only<CR>
nnoremap <Leader>q :quit<CR>
" ----------------------------------------------------------------------------
" folding 
" ----------------------------------------------------------------------------

if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

nnoremap <Tab> za
nnoremap <F6> <C-i>

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" 80 chars/line
set textwidth=100
if exists('&colorcolumn')
    let &colorcolumn="100,".join(range(100,999),",") 
endif

" }}}

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
" let g:limelight_paragraph_span = 1
" let g:limelight_priority = -1

" function! s:goyo_enter()
"   if has('gui_running')
"     set fullscreen
"     set background=light
"     set linespace=7
"   elseif exists('$TMUX')
"     silent !tmux set status off
"   endif
"   Limelight
"   let &l:statusline = '%M'
"   hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
" endfunction

" function! s:goyo_leave()
"   if has('gui_running')
"     set nofullscreen
"     set background=dark
"     set linespace=0
"   elseif exists('$TMUX')
"     silent !tmux set status on
"   endif
"   Limelight!
" endfunction

" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

" nnoremap <Leader>G :Goyo<CR>

" ============================================================================
" FZF {{{
" ============================================================================

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 2, <bang>0)
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore-vcs --hidden --follow  --color "always" '.shellescape(<q-args>), 2, <bang>0)

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

  " command! -bang -nargs=* Rg
  " \ call fzf#vim#grep(
  " \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  " \   fzf#vim#with_preview(), <bang>0)
endif

" command! -bang -nargs=* Rg2
"   \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)


" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)



" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" let g:fzf_action = { \ 'ctrl-t': 'tab split', \ 'ctrl-x': 'split', \ 'ctrl-v': 'vsplit' }
let g:fzf_action = { 'ctrl-s': 'vsplit' }

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader>t (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>y        :Lines<CR>
nnoremap <silent> <Leader>f        :Tags<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" function! s:plug_help_sink(line)
"   let dir = g:plugs[a:line].dir
"   for pat in ['doc/*.txt', 'README.md']
"     let match = get(split(globpath(dir, pat), "\n"), 0, '')
"     if len(match)
"       execute 'tabedit' match
"       return
"     endif
"   endfor
"   tabnew
"   execute 'Explore' dir
" endfunction

" command! PlugHelp call fzf#run(fzf#wrap({
"   \ 'source': sort(keys(g:plugs)),
"   \ 'sink':   function('s:plug_help_sink')}))

" }}}
"
let g:lightline = {
  \'colorscheme': 'solarized',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'absolutepath', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

"==================== EeasyMotion "
"=================================
map <Leader> <Plug>(easymotion-prefix)

" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

let g:EasyMotion_use_smartsign_us = 1

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"} ================================

"==================== CTags {{{
"=============================
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_enabled = 0

"==========================/Ctags}}}
"=============================


"==================== Black {{{
"=============================
"
" nnoremap <silent> <Leader>C        :Colors<CR>
" nnoremap bl  :Black<CR>

"==========================}}}
"=============================


"==================== Jedi {{{
"=============================

" let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#popup_on_dot = 1
" let g:jedi#popup_select_first = 1
" let g:jedi#completions_enabled = 1


" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"

"==========================}}}
"=============================


"==================== Tmux {{{
"=============================
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

"==========================}}}
"=============================


"==================== JSBeautify {{{
"=============================
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>

autocmd FileType php noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"==========================}}}
"=============================


"==================== JSBeautify {{{
"=============================
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci

"==========================}}}
"=============================

"==================== Ale {{{
"=============================
" let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_linters = {
"             \   'javascript': ['eslint'],
"             \   'python': ['flake8'],
"             \   'php': [],
"             \}
" let b:ale_linters = ['flake8']
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_set_highlights = 1

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"==========================}}}
"=============================

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
" let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
let g:neoformat_try_formatprg = 1

let g:neoformat_php_phpcsfixer = {
       \ 'exe': 'php-cs-fixer',
       \ 'replace': 1,
       \ 'args' : ['fix','--using-cache=no', '--config=/home/renal/.config/composer/vendor/conf/.php-cs.dist'],
       \}
let g:neoformat_enabled_php = ['phpcsfixer']
nnoremap <leader>nf :Neoformat<cr>


"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiffsplit!<CR>
noremap <Leader>gr :Gremove<CR>

nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

imap <F5> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>]"]

"" Neovide
let g:neovide_refresh_rate=165
let neovide_remember_window_size = v:true
let g:neovide_no_idle=v:true
" set guifont=Ubuntu:h15

" ----------------------------------------------------------------------------
" NERDTrees File highlighting
" ----------------------------------------------------------------------------

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'


let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue


let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['php'] = s:pink " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

nnoremap <silent> <Leader>z       :ZenMode <CR>
