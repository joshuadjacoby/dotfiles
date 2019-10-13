set nocompatible " be iMproved, required
filetype off " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugin manager {{{
Plugin 'VundleVim/Vundle.vim'
" }}}

" Auto close brackets {{{
Plugin 'jiangmiao/auto-pairs'
" }}}

" Color scheme {{{
Plugin 'joshdick/onedark.vim'
" }}}

" Code completion {{{
Plugin 'Valloric/YouCompleteMe'
" }}}

" Comments {{{
Plugin 'tpope/vim-commentary'
" }}}

" CSS colors {{{
Plugin 'ap/vim-css-color'
" Plugin 'shmargum/vim-sass-colors'
" }}}

" Emmet {{{
Plugin 'mattn/emmet-vim'
" }}}

" File navigation {{{
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
" }}}

" Formatting {{{
Plugin 'w0rp/ale'
Plugin 'prettier/vim-prettier'
" }}}

" Git integration {{{
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tveskag/nvim-blame-line'
" }}}

" Icons {{{
Plugin 'ryanoasis/vim-devicons'
" }}}

" Multiple cursors {{{
Plugin 'terryma/vim-multiple-cursors'
" }}}

" Parentheses {{{
Plugin 'tpope/vim-surround'
" }}}

" Searching {{{
Plugin 'google/vim-searchindex'
Plugin 'romainl/vim-cool'
" }}}

" Status line {{{
Plugin 'itchyny/lightline.vim'
" }}}

" Syntax {{{
Plugin 'sheerun/vim-polyglot'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'derekwyatt/vim-scala'
" }}}

" Whitespace {{{
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
"" }}}

" Workspace {{{
Plugin 'thaerkh/vim-workspace'
" }}}

call vundle#end()

filetype plugin indent on
