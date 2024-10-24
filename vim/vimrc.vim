" Vundle Plugins {{{
so ~/.dotfiles/vim/plugins.vim
" }}}

" Color Scheme {{{
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 > Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

" Define a function to extract just the branch name
function! LightlineGitBranch()
  let l:statusline = fugitive#statusline()
  " Use regex to extract the branch name from the statusline
  let l:branch_name = matchstr(l:statusline, '\v\(([^)]+)\)')
  " Remove parentheses
  let l:branch_name = substitute(l:branch_name, '(', '', '')
  let l:branch_name = substitute(l:branch_name, ')', '', '')
  let l:branch_name = trim(l:branch_name)
  return l:branch_name
endfunction

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineGitBranch'
  \ },
  \ }
let g:onedark_termcolors = 16
filetype on
syntax on
set t_Co=256
set cursorline
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
colorscheme onedark
" }}}

" UI config {{{
set number
set relativenumber
set laststatus=2
set noshowmode
set smartindent
set autoindent
set is hls
set mouse=a
" }}}

" Shortcut mapping {{{
let mapleader = ","
map ; :Files<CR>
map <C-f> :Ag<CR>
noremap <C-o> <C-i>
noremap <C-p> <C-o>
map <C-i> :NERDTreeFind<CR>
map <leader>m :NERDTreeToggle<CR>
map <leader>b :G blame<CR>
map <leader>g :Git<CR>
" map <silent> <leader>n :noh<CR>
map <silent> <leader>l :set invrelativenumber<CR>
" }}}

" Split Panes {{{
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}

" Spaces and tabs {{{
set shiftwidth=2
set tabstop=2
set expandtab
" }}}

" Searching {{{
set smartcase
set ignorecase
" }}}

" JsDoc highlighting {{{
let g:javascript_plugin_jsdoc = 1
" }}}

" Rainbow brakcets {{{
let g:rainbow_active = 0
" autocmd FileType javascript.jsx syntax clear jsFuncBlock
" }}}

" Indent guide {{{
let g:indent_guides_enable_on_vim_startup = 1
" }}}

" NERDTree new tab {{{
let NERDTreeMapOpenInTab ='<C-t>'
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face
" }}}

" NERDCommenter {{{
let g:NERDSpaceDelims = 1
" }}}

" ALE Navigation {{{
nmap <silent> [e <plug>(ale_previous_wrap)
nmap <silent> ]e <plug>(ale_next_wrap)
" }}}

" ALE Commands {{{
nmap <silent> <leader>d :ALEGoToDefinition<CR>
nmap <silent> <leader>r :ALEFindReferences<CR>
nmap <silent> <leader>f :ALEFix<CR>
nmap <silent> <leader>h :ALEHover<CR>
let g:ale_hover_cursor = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint', 'eslint'],
\ }
" }}}

" YCM Commands {{{
let g:ycm_auto_hover = ''
" nmap <silent> <leader>h <plug>(YCMHover)
" }}}

" Syntax {{{
hi def link jsObjectProp Identifier
" let g:polyglot_disabled = ['html']
" }}}

" Folding {{{
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
au BufRead * normal zR
" }}}

" Workspace {{{
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave = 0
" let g:workspace_autosave_always = 1
nmap <silent> <leader>s :ToggleWorkspace<CR>
" }}}

" Icons {{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" }}}

" fzf ignore {{{
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" }}}
