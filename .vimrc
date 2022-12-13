"*****************************************************************************
"" Yuhuan's vimrc
" yq56@cornell.edu
" github.com/yuhuanq
"*****************************************************************************

" Plugin Management --- {{{
call plug#begin('~/.vim/plugged')

Plug 'let-def/vimbufsync'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Testing
Plug 'aperezdc/vim-template'
" Plug 'scrooloose/syntastic', {'for': ['python', 'ocaml','c','cpp','java','javascript']}
" Plug 'artur-shaik/vim-javacomplete2', {'for':['java']}
Plug 'alvan/vim-closetag'

" Essentials
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary', {'for': []}

augroup plug_xtype
  autocmd FileType * if expand('<amatch>') != 'ocaml' | call plug#load('vim-commentary') | execute 'autocmd! plug_xtype' | endif
augroup END

Plug 'scrooloose/nerdcommenter', {'for': 'ocaml'}
if has('gui_running')
    Plug 'kien/ctrlp.vim'
else
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
endif

" Plug 'Raimondi/delimitMate'
" Plug 'Rip-Rip/clang_complete'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-system-copy'
" Appearance and interface
" Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'chriskempson/base16-vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'ap/vim-buftabline'
" Completion and Snippets
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'for': ['c','ocaml','javascript','vim','java','python']} " disa py for ycm bc bug
" Plug 'Valloric/YouCompleteMe', { 'for': ['ocaml','javascript','vim','java','python']} " disa py for ycm bc bug
" Plug 'thinca/vim-quickrun'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'ervandew/supertab'
" OCaml
" Plug 'let-def/ocp-indent-vim', { 'for': 'ocaml' }
" Utils
" Plug 'unblevable/quick-scope', { 'on': [] }
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
" Plug 'junegunn/vim-easy-align'
" Plug 'tpope/vim-tbone' " this may be useful for sending code to REPL running in tmux buffers
Plug 'michaeljsmith/vim-indent-object'

" Syntax
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()
" }}}

" if !has('gui_running')
    " au ColorScheme * hi Normal ctermbg=NONE guibg=NONE
" endif

"*****************************************************************************
"" Initial Setup
"*****************************************************************************
" --- {{{

" noremap <Space> <NOP>
" let mapleader = "\<Space>"
let mapleader=","
let localmapleader='\'
set undofile
set undodir=~/.vim/undodir

" Compatability --- {{{
set nocompatible                " disable vi compatability
" }}}

filetype plugin indent on       " Now plugins will be extracted to ~/.vim/bundle and added
                                " to the 'runtimepath'

" Encoding --- {{{
set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8
" set bomb
" set binary
set ttyfast
" }}}

" Color and style --- {{{
syntax enable                   " enable syntax processing

" base16; integrated with base16-shell
if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif
" }}}

" Indentation ------- {{{
set expandtab                   " tabs are spaces
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set textwidth=80                " Line-Wrapping
"set showbreak=⇇
set shiftwidth=4                " number of spaces to use for each auto-indent, i.e. >>, << commands
" }}}
" UI config --- {{{
set mouse=a
set number                      " show line numbers
set showcmd                     " shows last command entered in the very bottom right of vim
set ruler                       " display cursor position
set cursorline                  " highlight current line
filetype indent on              " load filetype-specific indent files...?
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to...
set colorcolumn=80
" augroup weird_cursor_temp_fix
"     autocmd!
"     autocmd BufEnter .vimrc set nolazyredraw
" augroup END
" }}}
" set autochdir " change working dir to open buffer


" Searching Criteria --- {{{
set showmatch                   " highlight matching [{()}]
set incsearch                   " search as characters are entered /
set hlsearch                    " highlight matches
set ignorecase                  " ignore case in search patterns
set smartcase                   " override ignorecase if search pattern has capital letters
" }}}

" Whitespace Handling --- {{{
" delete all trailing whitespace
function! StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e             " delete trailing whitespace
        call cursor(l,c)        " return cursor to previous position
endfunction
augroup filetype_strip
    autocmd!
    "autocmd FileType perl,sh,python,vi autocmd BufWrite <buffer> :call StripTrailingWhitespaces()
    autocmd BufWritePre *  :call StripTrailingWhitespaces()
augroup END
" }}}


" vimscript file settings -------------------- {{{
" setting up folding for vimscript
augroup filetype_vim
    autocmd!
    " :help foldlevelstart "
    autocmd filetype vim setlocal foldmethod=marker
augroup end
" }}}

" Abbreviations --- {{{
" for correcting common typos in insert mode
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev teh the
iabbrev ehtn then
iabbrev latex LaTeX
iabbrev anythign anything
iabbrev tuping typing
iabbrev ti it
iabbrev thugh though
iabbrev hae have

" Command mode abbrevs
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qall
" }}}

" set visualbell
set noerrorbells
set autowrite       " save on buffer switch

set hidden                      " ...

" Directory for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if has('gui_running')
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 14
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 14
    set guioptions-=T "remove top toolbar
    set guioptions-=r "removes right hand scroll
    set go-=L "removes left hand scroll
    " set guioptions-=m " turn off menu bar
    set guioptions-=L
    set guioptions-=l
endif

au Filetype tex nnoremap <leader>m :! make<CR>

augroup vimperator
    au!
    au BufReadPost .vimperatorrc setf vim
augroup end

" More natural split opening
set splitbelow
set splitright

set scrolloff=5

" }}}

set laststatus=2

" set statusline=%<\ %t\ %m%r%y%w%=Ln:\ \%l\/\%L\ Col:\ \%c\ "sdf
" set statusline+=%P

if has('nvim')
    augroup nvim-remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END
endif

set nowrap


"*****************************************************************************
"" Plugin Configurations (contains some maps)
"*****************************************************************************
" --- {{{
" [Command t] settings --- {{{
if has('gui_running')
" "let g:ctrlp_show_hidden=1       " show dot files
" let g:ctrlp_cmd='CtrlP'
" " mnemonic: command t (other plugin with same functionality)
    let g:ctrlp_use_caching = 1
" let g:ctrlp_map='<C-t>'
    let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
endif

" Don't tab complete binary files
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.git,.hg,.svn
set wildignore+=*.swp,*.tmp
set wildignore+=*.obj,*.rbc,*.pyc,__pycache__
" }}}

" delimitMate settings --- {{{
let delimitMate_expand_cr = 1

let g:delimitMate_jump_expansion = 1
"inoremap <expr> <S-space> delimitMate#JumpAny()
" }}}

" [Relative] Line Numbers --- {{{
" Relative line numbers
set relativenumber
" on hybrid mode now, since set number was called earlier
function! LNumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call LNumberToggle()<CR>

" set number when vim loses focus; doesn't work atm
"au FocusLost * :set norelativenumber
"au FocusGained * :set relativenumber

" auto use line num in insert mode and command mode
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber
au CmdwinEnter * :set norelativenumber
au CmdwinLeave * :set relativenumber
" }}}

" tagbar --- {{{
" p (preview) on tagbar item focuses view but keeps cursor in tagbar window
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" }}}

" Youcompleteme ycm settings --- {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" make YCM compatable with ultisnips
" note; tab key has higher priority for snippits, but if no snip defaults to YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '\<Up>']

let g:SuperTabDefaultCompletionType = '<C-n>'

" YCM identifer completer will now seed its identifier db with keywords of language you're in
" force semantic completion with C-space
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1 "the as you type completion suggester, only for identifiers, not for YCM semantic completion

" let g:ycm_filetype_blacklist = {'vim':1}

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_disable_for_files_larger_than_kb = 1000 "default is 1000
let g:ycm_python_binary_path = 'python' "specifies which python interp to use
let g:ycm_show_diagnostics_ui = 0 "disable diagnostics/linting by ycm -> use syntastic instead

" }}}

" Ultisnip settings --- {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" C-Tab (default) for list only works in gvim. Terminal emulators eat C-Tab
let g:UltiSnipsListSnippets = "<C-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/.vim/my-snippets/
" }}}

" Syntastic Recommended settings --- {{{
" commented for now to fix statusline dissapearing on vimrc resource
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height=8

let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'


let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_flake8_args = "--ignore=E501"

let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_compiler_options='-std=gnu11'
" let g:syntastic_c_compiler = 'clang'
" let g:syntastic_c_compiler_options = '-std=c11 -Wall -Wextra -Werror -pedantic-errors'

" }}}

" NERDTree settings --- {{{
augroup NERDTREE_config
    autocmd!
    " NERDTree autoopens when vim starts if no file specified
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " Closing vim if only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
map <Leader>nt :NERDTreeToggle<CR>
" }}}


" vimwiki settings --- {{{
let g:vimwiki_map_prefix = '<Leader>e' " default is leader-w
let g:vimwiki_folding='expr'
let g:vimwiki_list = [{
            \ 'path': '$HOME/vimwiki',
            \ 'template_path':'$HOME/vimwiki/templates',
            \ 'template_default':'default',
            \ 'template_ext':'.html'}]
nmap <leader>nl <Plug>VimwikiNextLink
nmap <leader>pl <Plug>VimwikiPrevLink
let g:vimwiki_table_mappings = 1
let g:vimwiki_hl_header = 1 " highlight headers with diff colors
let g:vimwiki_hl_cb_checked = 1
au FileType vimwiki nmap <leader>tt <Plug>VimwikiToggleListItem
au FileType vimwiki vmap <leader>tt <Plug>VimwikiToggleListItem


let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
" let wiki_1.path_html = '~/vimwiki_html/'
let wiki_1.path_html = '/home/yqiu/wiki_website/34838fc3e3b9bebb328c594d3ad27c1fdaf7b0f3/'

let wiki_2 = {}
let wiki_2.path = '~/Notepad/'
let wiki_2.path_html = '~/Notepad_tml/'

let g:vimwiki_list = [wiki_1, wiki_2]
" }}}

" repeat --- {{{
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" }}}

" buftabline --- {{{
let g:buftabline_show=1 "only show buftabline if more than one buffer open
let g:buftabline_numbers=1
let g:buftabline_indicators=1
let g:buftabline_separators=1
" }}}

" vim polyglot --- {{{
" let g:polyglot_disabled = []
" }}}

" }}}

" coquille --- {{{
" au FileType coq call coquille#CoqideMapping()
" }}}

" NERDCommenter--- {{{
let g:NERDCreateDefaultMappings = 0
" let g:NERDCommentEmptyLines = 1
let NERDSpaceDelims=1
augroup nerdcommenterFT
    autocmd!
    autocmd Filetype ocaml map gcc <plug>NERDCommenterToggle
    autocmd Filetype ocaml map gcm <plug>NERDCommenterMinimal
    autocmd Filetype ocaml map gcs <plug>NERDCommenterSexy
augroup END
"  }}}

" lightline --- {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive','readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ] ]
      \ }
      \ }
" }}}

" Ocaml for vim config --- {{{
" Merlin,ocp-indent + vim-slime for utop
" Add Merlin to rtp and set as syntastic checker for OCaml
if executable('ocamlmerlin') && has('python')
    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
    let g:syntastic_ocaml_checkers=['merlin']
endif
" set rtp+="/home/yqiu/.opam/system/share/ocp-indent/vim"
" set rtp="/home/yqiu/.opam/4.05.0/share/ocp-indent/vim"
" Use ocp-indent for filetype ocaml
" autocmd FileType ocaml source /home/yqiu/.opam/system/share/ocp-indent/vim/indent/ocaml.vim
au FileType ocaml call FT_ocaml()
function! FT_ocaml()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    source /home/yqiu/.opam/system/share/ocp-indent/vim/indent/ocaml.vim
    filetype indent on
    filetype plugin indent on
    compiler ocaml
    set commentstring=(*\ %s\ *)
    " nnoremap <leader>cc :!ocamlbuild expand('%:r') + ".byte"<CR>
    " nnoremap <leader>cc :!ocamlbuild
    " inoremap -
    nnoremap <leader>t :MerlinTypeOf<CR>
endfunction

au FileType javascript call FT_javascript()
function! FT_javascript()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    filetype indent on
    filetype plugin indent on
endfunction

au FileType html,css call FT_html()
function! FT_html()
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction

nnoremap <leader>st :stop<CR>
" au BufRead,BufNewFile *.ml,*.mli compiler ocaml
" }}}

" vim smooth scroll --- {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" }}}

" java complete ---{{{
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" }}}

" " fzf --- {{{
if has ('gui_running')
    " let g:ctrlp_map='<C-t>'
    let g:ctrlp_map='<leader><tab>'
else
    nmap <leader><tab> :Files<CR>
endif
" let g:fzf_layout = { 'window': 'enew' }
" " This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" " Default fzf layout
" " - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }

" " In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" " Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
" let g:fzf_launcher = 'gnome-terminal --disable-factory -x bash -ic %s'
" " }}}

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

augroup eliom_ft
    autocmd BufNewFile,BufRead *.eliom set filetype=ocaml
augroup END


autocmd FileType mips setlocal commentstring=#\ %s

"*****************************************************************************
"" Mappings
"*****************************************************************************
" --- {{{
" key remappings --- {{{
" remapping vim splits navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" tab navigation like firefox. gt gt still for tabnext and tabprev
" nnoremap <C-t>   :tabnew<cr>
"inoremap <C-t>     <esc>:tabnew<cr>

" note; buffer commands
" :bn    load next buffer
" :b _   load buffer _ by name
" :ls    list open buffers

" yank and paste from clipboard remap --- {{{
" work around to prevent copied text to sys clip from being cleared on ctrl-z(or exit) (needs xsel pkg)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Copytext()
"     normal gv"+y
"     :call system('xsel -ib', getreg('+'))
" endfunction

" nnoremap <C-y> "+y<CR>
" "vnoremap <C-y> "+y
" vnoremap <C-y> :call Copytext()<CR>
" noremap <C-p> "+gp<CR>
" noremap XX "+x<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" "" copy/paste/cut
" if has('unnamedplus')
"     set clipboard=unnamed,unnamedplus
" endif

" noremap <C-p> "+gp<cr>
" noremap <C-y> "+y<cr>
" noremap XX "+x<cr>
" }}}



" edit my vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap - dd
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" vim key maps
" Turn off search highlight. (mnemonic: [n]o h[l]ight)
nnoremap <silent> <leader><Space> :nohlsearch<CR>
inoremap jj <ESC>
cnoremap jj <ESC>
" }}}

" Normal Mode Mappings --- {{{
" Make arrow keys do something useful

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.

function! IntelligentVerticalResize(direction)
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Right> :call IntelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call IntelligentVerticalResize('left')<CR>
" }}}

" Visual Mode Mappings --- {{{
" }}}

" Insert Mode Mappings --- {{{
" }}}

" Command Mode Mappings --- {{{
" }}}

" Git (fugitive) mappings --- {{{
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
nnoremap <leader>gd :Gdiff<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
" }}}

nnoremap <leader>lc :lclose<CR>
nnoremap <leader>lo :lopen<CR>
" never enter exmode
nnoremap Q <nop>

" leader mappings
" nnoremap <leader>q :bp<CR>
" nnoremap <leader>w :bn<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>bd :bd<CR>
" open last buffer
nnoremap <leader><leader> <C-^>
" Make current window only one on screen; close all others
nnoremap <leader>o :only<CR>

nnoremap <Tab> za

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
" Y was synon for yy; make it work like D
noremap Y y$

" not much use most of time
" nnoremap K <nop>


"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" TODO: make filetype specific
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

" }}}
cnoremap jj <C-c>
cnoremap <C-a> <Home>
cnoremap <C-e> <END>
" command Dos2Unix %s/\r\(\n\)/\1/g

"*****************************************************************************
"" Misc
"*****************************************************************************
" Include local specific config --- {{{
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }}}

" save a file using sudo when it was opened without
cnoremap w!! w !sudo tee % > /dev/null

" opens a small terminal below vim auto cd'd to `:pwd`
command! -nargs=0 Spwd exe 'Tmux split-window -l 12 -c '.shellescape(getcwd())

" open vim cheatsheet in split
nnoremap <leader>chs :sp $HOME/notes/vim-cheatsheet.md<CR>

" Only enable spell check in markdown files
" C-l fixes previous spelling mistake on the go (mnemonic: spe[ll])
" augroup enable_spell_ft
"     autocmd!
"     autocmd filetype markdown :set spell | inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" augroup END

"Breakdown of C-l
"<C-g>u  " Break undo sequence
"<Esc>   " Enter normal mode
"[s      " Move to spelling error
"1z=     " Choose first suggestion
"`]      " Move to the last character of our correction
"a       " Return to insert mode
"<C-g>u  " Break undo sequence

autocmd FileType java inoremap ;; <ESC>A;<CR>
autocmd FileType java nnoremap <leader>j :JavaDocPreview<CR>
" nmap <silent> <c-f11> :call eclim#vimplugin#FeedKeys('CTRL+F11')<cr>
" C-m for toggle max window size
" nmap <silent> <c-m> :call eclim#vimplugin#FeedKeys('CTRL+M')<cr>

inoremap ;; <ESC>A;<CR>

" Auto change dir to match curr file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" let g:EclimCompletionMethod = 'omnifunc'

" open cppman in tmux pane
" command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
" autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>
autocmd FileType cpp setlocal keywordprg=cppman

let g:quickrun_no_default_key_mappings = 1
nnoremap <leader>rr :QuickRun<CR>

au BufRead,BufNewFile *.xi set filetype=xi
au BufRead,BufNewFile *.flex set filetype=flex
au BufRead,BufNewFile *.cup set filetype=cup
au BufRead,BufNewFile skynginx_runbook.wiki set filetype=confluencewiki
au BufRead,BufNewFile *.cwiki set filetype=confluencewiki

" fix insert mode delete key on macos
set backspace=indent,eol,start

" Include vim-go setup --- {{{
let g:go_fmt_command = "goimports"

" proto syntax {{{
augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
" }}}

" 2022 new {{{
set belloff=all
" }}}
