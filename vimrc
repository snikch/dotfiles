set nocompatible " vi is dead, long live vim

" Pathogen
call pathogen#infect()
call pathogen#helptags()

syntax on

"colorscheme tir_black
colorscheme vividchalk
set number
set tabstop=4 shiftwidth=4
set smartindent

" Ruby whitespace: two spaces, no tabs
autocmd FileType ruby setlocal sts=2 ts=2 sw=2 et
autocmd FileType cucumber setlocal sts=2 ts=2 sw=2 et

" highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" see http://items.sjbach.com/319/configuring-vim-right
" essential
set hidden
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
" recommended
set ignorecase
set smartcase
set scrolloff=3
set backupdir=~/.vim/swap
set background=dark
set directory=~/.vim/swap
set ruler
set visualbell
" The following will make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
" short info tokens, short command line messages, no intro.
set shortmess=atI

" see http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set history=1000
" Prevent exploits re modelines in files.
set modelines=0
" Make things better
set encoding=utf-8
set cursorline
set ttyfast
set laststatus=2
set t_Co=256

" Make j & k sane, instead of archaic “movement by file line instead of screen line”
nnoremap j gj
nnoremap k gk
" save on losing focus
autocmd FocusLost \f\+ :wa

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Quick-edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Alternate exit from insert mode
inoremap jj <ESC>

" Map leader s to save all open buffer, including in insert mode
nnoremap <silent> <leader>s :wa<cr>
nnoremap <silent> <leader>q :qa<cr>
imap <leader>s <Esc><leader>si

" For tmux
set mouse=a
set mousemodel=popup_setpos

" Hide mouse while typing.
set mousehide

" Tmux copy paste
set clipboard=unnamed

" Backspace fix
set backspace=2
""""""""""
" Plugins


" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'max:30,results:30'
let g:ctrlp_cache_dir = $HOME . '/.cache/ct'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
nnoremap <leader>f :CtrlPMixed<CR>
nnoremap <silent> <leader>c :CtrlPClearCache<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlP<CR>
set wildignore+=**node_modules/**
set wildignore+=examples/node_modules/**
set wildignore+=node_modules/**
set wildignore+=tmp/**
set wildignore+=.tmp/**
set wildignore+=lib/vendor/**
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)'

" Syntastic
let g:syntastic_javascript_checkers=['jsl']
let g:syntastic_coffee_checkers=['coffee']
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" Ack
nnoremap <leader>a :Ack 

" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

set nopaste
filetype on
filetype plugin on
filetype plugin indent on


au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufRead,BufNewFile *.hamlc set ft=haml
au BufNewFile,BufReadPost *.php setl shiftwidth=4 expandtab
au BufNewFile,BufReadPost *.json setl shiftwidth=4 expandtab
au BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab


"""
" Status Bar Config
"""
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set guifont=Meslo\ LG\ L\ DZ\ Regular\ for\ Powerline:h12
"set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12

" Powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

" Numbers
nnoremap <leader>z :NumbersToggle<CR>

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Git (Fugitive)
nnoremap <silent><leader>gs :Gstatus<CR>
nnoremap <silent><leader>gc :Gcommit<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gd :Gdiff<CR>
nnoremap <leader>gm :Gmove


" PHP CS Fixer
nnoremap <silent><leader>pd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

" PHP
let php_folding = 1
let g:phpunit_cmd = "bin/phpunit"
" Let PHPUnitQf use the callback function
let g:phpunit_callback = "VendPHPTextCallback"
nnoremap <silent><leader>u :Test<CR>

function! VendPHPTextCallback(args)
    " Trim white space
    let l:args = substitute(a:args, '^\s*\(.\{-}\)\s*$', '\1', '')

    " If no arguments are passed to :Test
    if len(l:args) is 0
        let l:file = expand('%')
        "if l:file =~ "^app/Test/Case.*"
        if l:file =~ "^test/phpunit/unit/Vend.*"
            " If the current file is a unit test
            let l:args = l:file
        else
            " Otherwise try and run the test for this file
            let l:args = substitute(l:file,'^lib/Vend\(.\{-}\)\(\.php\)$','test/phpunit/unit/Vend\1Test\2','')
        endif
    endif
    return l:args
endfunction

function! RunPHPUnitTest()
	"cd %:p:h
	let current = expand("%")
	let tmp_file = "/tmp/vim_remote_phpunit_out"

	if current =~ "^test/phpunit/unit/Vend.*"
		let file = current
	else
		" Otherwise try and run the test for this file
		let file = substitute(current,'^lib/Vend\(.\{-}\)\(\.php\)$','test/phpunit/unit/Vend\1Test\2','')
	endif
	let test_cmd = "ssh vend 'cd /var/www/web.vendhq.localdomain/current/; sudo -su www-data -H bin/phpunit " . file . "'"
	call system("> ".tmp_file)
	exe "!" . test_cmd . " 2>&1 | tee " . tmp_file
endfunction

nnoremap <leader>ru :call RunPHPUnitTest()<cr>

" Folding
set foldlevelstart=20

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
