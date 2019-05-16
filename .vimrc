set nocompatible                
filetype on

"set plugin directory
set rtp+=/root/.vim
call plug#begin('/root/.vim/plugins')

"bundles
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-rails.git'
Plug 'L9'
Plug 'FuzzyFinder'
Plug 'git://git.wincent.com/command-t.git'
Plug 'git://github.com/altercation/vim-colors-solarized.git'
Plug 'lervag/vimtex'
Plug 'benmills/vimux'
Plug 'ervandew/screen'
Plug 'vim-scripts/Vim-R-plugin'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/csv.vim'
Plug 'Guardian'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-ssh'
Plug 'EricGebhart/SAS-Vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'RltvNmbr.vim'
Plug 'surround.vim'
Plug 'VisIncr'
Plug 'matchit.zip'
Plug 'Conque-Shell'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'LanguageTool'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/tex.vim--Brauner'
Plug 'kshenoy/vim-signature'
Plug 'jnurmine/Zenburn'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'vim-scripts/Smart-Tabs'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/vis'
Plug 'scrooloose/syntastic'
Plug 'mkitt/tabline.vim'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'terryma/vim-multiple-cursors'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/VOoM'
Plug 'gilligan/vim-lldb'

call plug#end()

"indent according to filetype
	filetype plugin indent on 

"automatically read changes in file
	set autoread

"spell check
	set spell

"auto-indent
	set autoindent

"line number
	set number

"show cursor location
	set ruler

"mouse support
	set mouse=a

"set local directory of buffer to its file path way
	autocmd BufEnter * silent! lcd %:p:h

"do not show parenthesis match
	set noshowmatch

"discreen C and Java indent
	set cindent

"support 256 color
	set t_Co=256

"syntax highlight on
	syntax on

"syntax fold
	set foldmethod=syntax

"set font
	set antialias
	set guifont=Monaco:h20\ for\ Powerline:h20

"set backspace
	set backspace=indent,eol,start
	set sw=2
	set ts=2
	autocmd FileType latex setlocal et sta sw=2 sts=2
	let g:solarized_termcolors=16

"file type recognition for snipMate
	au BufNewFile,BufRead *.sas set ft=sas
	au BufNewFile,BufRead *.r set ft=r
	au BufNewFile,BufRead *.R set ft=r
	au BufNewFile,BufRead *.SAS set ft=sas
	au BufNewFile,BufRead *.mma set ft=mma
	au BufNewFile,BufRead *.MMA set ft=MMA
	au BufNewFile,BufRead *.py set ft=python
	au BufNewFile,BufRead *.PY set ft=python

"colorscheme
	set background=dark
	colorscheme solarized
	":autocmd BufEnter,FileType *
	"\   if &ft ==# 'c' || &ft ==# 'cpp' || &ft ==# 'h' | colorscheme zenburn |
	"\   elseif &ft ==# 'tex'|| &ft ==# 'cls' || &ft ==# 'sty' | colorscheme solarized | set background=light |
	"\   elseif &ft ==# 'r' || &ft ==# 'R' | colorscheme solarized | set background=dark |
	"\   elseif &ft ==# 'csv' | colorscheme desert |
	"\   elseif &ft ==# 'sas' || &ft ==# 'SAS' | colorscheme hemisu | set nospell |
	"\   elseif &ft ==# 'mma' || &ft ==# 'MMA' | colorscheme hemisu | set background=dark | set nospell |
	"\   elseif &ft ==# 'python' || &ft ==# 'PYTHON' | colorscheme solarized | set background=dark | set nospell |
	"\   endif

"highlight search results
	set hlsearch
	nnoremap <C-\> :let @/ = ""<return><esc>

"one tab equals 4 characters
	set tabstop=4
	set shiftwidth=4

"indent guide
	let g:indent_guides_start_level=1
	let g:indent_guides_guide_size=1
	let g:indent_guides_enable_on_vim_startup=1
	let g:indent_guides_exclude_filetypes = ['txt', 'csv']

"set toolbars off and transparency set up
	if has("gui_running")
	    set go=aAce              
	    set transparency=0      
	endif

"call boxes in vim
	autocmd BufEnter * nmap ,cc !!boxes -d pound-cmt<CR>
	autocmd BufEnter * vmap ,cc !boxes -d pound-cmt<CR>
	autocmd BufEnter * nmap ,xc !!boxes -d pound-cmt -r<CR>
	autocmd BufEnter * vmap ,xc !boxes -d pound-cmt -r<CR>
	autocmd BufEnter *.html nmap ,cc !!boxes -d html-cmt<CR>
	autocmd BufEnter *.html vmap ,cc !boxes -d html-cmt<CR>
	autocmd BufEnter *.html nmap ,xc !!boxes -d html-cmt -r<CR>
	autocmd BufEnter *.html vmap ,xc !boxes -d html-cmt -r<CR>
	autocmd BufEnter *.[chly],*.[pc]c,*.C,*.c,*.cpp,*.h nmap ,cc !!boxes -d c-cmt<CR>
	autocmd BufEnter *.[chly],*.[pc]c,*.C,*.c,*.cpp,*.h vmap ,cc !boxes -d c-cmt<CR>
	autocmd BufEnter *.[chly],*.[pc]c,*.C,*.c,*.cpp,*.h nmap ,xc !!boxes -d c-cmt -r<CR>
	autocmd BufEnter *.[chly],*.[pc]c,*.C,*.c,*.cpp,*.h vmap ,xc !boxes -d c-cmt -r<CR>
	autocmd BufEnter *.java nmap ,cc !!boxes -d java-cmt<CR>
	autocmd BufEnter *.java vmap ,cc !boxes -d java-cmt<CR>
	autocmd BufEnter *.java nmap ,xc !!boxes -d java-cmt -r<CR>
	autocmd BufEnter *.java vmap ,xc !boxes -d java-cmt -r<CR>
	autocmd BufEnter .vimrc*,.exrc nmap ,cc !!boxes -d vim-cmt<CR>
	autocmd BufEnter .vimrc*,.exrc vmap ,cc !boxes -d vim-cmt<CR>
	autocmd BufEnter .vimrc*,.exrc nmap ,xc !!boxes -d vim-cmt -r<CR>
	autocmd BufEnter .vimrc*,.exrc vmap ,xc !boxes -d vim-cmt -r<CR>

"compile
	set makeprg=make 

	augroup COMPILE
	autocmd!
		autocmd filetype tex nnoremap <F7> :w<cr>:VimtexCompile<cr>
		autocmd filetype c   nnoremap <F7> :wa<cr>:make %<<cr><cr><cr>:copen<cr>
		autocmd filetype cpp nnoremap <F7> :wa<cr>:make %<<cr><cr><cr>:copen<cr>
		autocmd filetype h   nnoremap <F7> :wa<cr>:make %<<cr><cr><cr>:copen<cr>
		autocmd filetype csv nnoremap <F7> :%ArrangeColumn<cr>
	augroup END

"view results of compiling
	"run a terminal command and show results
	fun! Runcmd(cmd)
		silent! exe "noautocmd botright pedit ".a:cmd
		noautocmd wincmd P
		set buftype=nofile
		exe "noautocmd r! ".a:cmd
		noautocmd wincmd p
	endfun
	com! -nargs=1 Runcmd :call Runcmd("<args>")

	augroup VIEW
	autocmd!
		autocmd filetype tex nnoremap <F8> :!open -a Preview ./%<.pdf<cr><cr>
		autocmd filetype cpp nnoremap <F8> :!tmux new-window "gdb ./%<"<cr>
		autocmd filetype c   nnoremap <F8> :Runcmd ./%<<cr>
		autocmd filetype csv nnoremap <F8> :%UnArrangeColumn<cr>
	augroup END

"vimtex
	let g:vimtex_mappings_enabled=0
	let g:vimtex_latexmk_continuous=0

" let NERDTree show hidden files
	let NERDTreeShowHidden=1
	nnoremap <F3> :NERDTreeToggle<return>
	let NERDTreeShowBookmarks=1

"Vim-R-plugin tumx screen setup
	let g:ScreenImpl = 'Tmux'
	let vimrplugin_applescript = 0
	let vimrplugin_screenplugin = 1
	let vimrplugin_tmux = 1
	let vimrplugin_screenvsplit = 1
	let r_syntax_folding = 1
	let vimrplugin_assign = 0

"read pdf file
	set modifiable
	command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
	command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"mathematica syntax highlighting
	let g:mma_highlight_option = "hemisu"

"air-line
	let g:airline#extensions#tabline#enabled=1
	let g:airline_theme='solarized'
	let g:airline_solarized_bg='dark'
	"let g:airline_powerline_fonts=1
	"set laststatus=2
	"let g:airline_detect_whitespace=0
	"let g:airline_inactive_collapse=0
	"let g:airline#extensions#tagbar#enabled=1
	"let g:airline#extensions#tagbar#flags = 's'
	"let g:airline#extensions#csv#enabled=1
	"let g:airline#extensions#tabline#enabled=1
	"let g:airline#extensions#tabline#show_buffers = 0
	"let g:airline#extensions#tabline#show_tab_nr = 1
	"let g:airline#extensions#tabline#excludes = []
	"let g:airline#extensions#tabline#left_sep = ''
	"let g:airline#extensions#tabline#left_alt_sep = ''
	"let g:airline#extensions#tabline#right_sep = ''
	"let g:airline#extensions#tabline#right_alt_sep = ''
	"let g:airline#extensions#tabline#fnamemod = ':t'
	"let g:airline#extensions#tabline#show_close_button = 0
	"let g:airline#extensions#syntastic#enabled = 1

"conceal math symbols in latex
	let g:tex_fold_enabled=0
	set conceallevel=0

"Align
	let mapleader = "|"

"Syntastic
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list            = 1
	let g:syntastic_check_on_open            = 1
	let g:syntastic_check_on_wq              = 0
	let g:syntastic_cpp_check_header         = 1
	let g:syntastic_cpp_compiler             = 'gcc'
	let g:syntastic_cpp_compiler_options     = ' -std=c++11 -stdlib=libc++'


"alias
	"open help document in a new tab
	cabbrev h tab help
	"open a new tab
	cabbrev t tabe
	"open .vimrc file in a new tab
	cabbrev vimrc tabe $MYVIMRC
	"source .vimrc file 
	cabbrev svimrc source $MYVIMRC

"tagbar
	nnoremap <F2> :TagbarToggle<return>

"VOoM
	au FileType tex nnoremap <F2> :Voom latex<return>

"easytags
"	let g:easytags_cmd = '/usr/local/bin/ctags'
	set tags=./tags;
	let g:easytags_dynamic_files = 2

"delimitMate
	let delimitMate_jump_expansion = 1
	au FileType tcl let b:delimitMate_jump_expansion = 1
	au FileType tex let b:delimitMate_quotes = "\" ' $"
	let delimitMate_balance_matchpairs = 1
	au FileType tcl let b:delimitMate_balance_matchpairs = 1

"YouCompleteMe
	set encoding=utf-8
	"due to conflict with Syntastic
	let g:ycm_show_diagnostics_ui = 0
	"global youcompleteme extra configuration file directory
	"let g:ycm_global_ycm_extra_conf = '~/Google Drive/Vim/ycm_extra_conf.py'
	"turn off youcompleteme for following filetypes
	let g:ycm_filetype_blacklist = {
	                                \ 'tagbar'   : 1,
	                                \ 'qf'       : 1,
	                                \ 'notes'    : 1,
	                                \ 'markdown' : 1,
	                                \ 'unite'    : 1,
	                                \ 'text'     : 1,
	                                \ 'vimwiki'  : 1,
	                                \ 'pandoc'   : 1,
	                                \ 'infolog'  : 1,
	                                \ 'mail'     : 1,
	                                \ 'csv'      : 1
	                              \}
	"turn off youcompeleteme when writing a string
	let g:ycm_complete_in_strings = 0
	"include identifiers from keywords of the programming language
	let g:ycm_seed_identifiers_with_syntax = 1
	"enable UltiSnips in YouCompleteMe
	let g:ycm_use_ultisnips_completer = 0
	"how to roll down and roll up in the completion list
	let g:ycm_key_list_select_completion = ['<C-n>']
	let g:ycm_key_list_previous_completion = ['<C-p>']
	"autoclose preview window after exiting insertion mode
	let g:ycm_autoclose_preview_window_after_insertion=1
	"add preview to completeopt
	let g:ycm_add_preview_to_completeopt = 1

"EasyAlign
	" start interactive EasyAlign in visual mode 
	vmap <Enter> <Plug>(EasyAlign)
	" start interactive EasyAlign for a motion/text object
	nmap ga <Plug>(EasyAlign)

"UltiSnips
	"let g:UltiSnipsSnippetDirectories=["/Users/jiangwenjiaowa/Google Drive/Vim/MySnips/vim-snippets/UltiSnips"]
	"let g:UltiSnipsNoPythonWarning = 1
	"let g:UltiSnipsExpandTrigger='<C-e>'
	"let g:UltiSnipsJumpForwardTrigger='<C-n>'
	"let g:UltiSnipsJumpBackwardTrigger='<C-p>'

"multiple cursors
	let g:multi_cursor_use_default_mapping=0
	let g:multi_cursor_next_key='<S-n>'
	let g:multi_cursor_prev_key='<S-p>'
	let g:multi_cursor_skip_key='<S-x>'
	let g:multi_cursor_quit_key='<Esc>'

"Python-Mode
	let g:pymode_folding = 1
	let g:pymode_indent = 1
	let g:pymode_motion = 1

"Screen in Python
	autocmd FileType python map \p :ScreenShellVertical python<cr>
	autocmd FileType python map \p2 :ScreenShellVertical python<cr>
	autocmd FileType python map \p3 :ScreenShellVertical python3<cr>
	autocmd FileType python map \pq :ScreenQuit<cr>
	"send commands
	" line
	autocmd FileType python map \d V:ScreenSend<CR>0j
	" block
	autocmd FileType python map \ff {jv}:ScreenSend<CR>}
	" selection
	autocmd FileType python map \aa :ScreenSend<CR>`>}0j

"Faster Syntax Highlighting in Large File
	set re=1
	set ttyfast
	set lazyredraw
