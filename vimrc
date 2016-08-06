set nocompatible  " Enables Vim specific features
filetype off      " Reset filetype detection

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

Plugin 'Valloric/YouCompleteMe'

"Plugin 'bling/vim-airline'
"let g:airline#extensions#default#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = '**'
"let g:airline#extensions#tabline#left_alt_sep = '|'

call vundle#end()

filetype plugin indent on       " Re-enable filetype detection

set bg=dark                     " I like dark backgrounds
set ttyfast                     " Indicate fast terminal conn for faster redraw
set laststatus=1                " Show status line iff 2+ windows
set modeline                    " Allow file-embedded modelines
set hlsearch                    " Highlight search terms
set showcmd                     " Show last command
set completeopt=menuone         " Show insertion menu for completions
set list                        " Show listchars
set listchars=tab:>-,trail:_    " Render tabs and trailing spaces
set tabstop=4                   " Tab width
set shiftwidth=4                " How much to shoft text
set ai                          " Auto-indent
syn on                          " Syntax highlighting
set textwidth=78                " Default text width
set backspace=indent,eol,start  " Makes backspace key more powerful
set autowrite                   " Automatically save before :next, :make etc.

" Keyboard shortcuts
nnoremap % :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap ww :wincmd w<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap n nzzzv
nnoremap N Nzzzv

if has("autocmd")
    " When editing a file, always jump to the last cursor position
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" markdown
au BufRead,BufNewFile *.md set filetype=markdown

" go
au FileType go setl tabstop=4
au FileType go setl shiftwidth=4
au FileType go setl textwidth=1000
au FileType go setl number
au FileType go setl nolist

" yaml
au FileType yaml setl indentkeys-=<:>
au FileType yaml setl tabstop=2
au FileType yaml setl shiftwidth=2
au FileType yaml setl expandtab
au FileType yaml setl number


"""-au FileType python setlocal errorformat=%+P[%f],%t:\ %#%l:%m
"""-au FileType python setlocal makeprg=/home/build/static/projects/gpylint/gpylint.par\ %
"""-
"""-" make tw=0 when lines in the file are already longer than 80.
"""-" see   :help fo-table
"""-au BufEnter * setlocal formatoptions+=l
"""-
"""-augroup cprog
"""-  " Remove all cprog autocommands
"""-  au!
"""-
"""-  " When starting to edit a file:
"""-  "   For *.c and *.h files set formatting of comments and set C-indenting on.
"""-  "   For other files switch it off.
"""-  "   Don't change the order, it's important that the line with * comes first.
"""-
"""-  " i dont like cindent autoindent is fine with me.
"""- " autocmd BufRead *       set formatoptions=tcql nocindent comments&
"""- " autocmd BufRead *.c,*.h set formatoptions=croql nocindent ai comments=sr:/*,mb:*,el:*/,://
"""- "autocmd BufRead *.c,*.h,*.C,*.cc set formatoptions=croql cindent cinoptions={4 shiftwidth=4 comments=sr:/*,mb:*,el:*/,://
"""- "autocmd BufRead *.c,*.h,*.C,*.cc syn region myFold start="{" end="}" transparent fold
"""-" autocmd BufRead *.c,*.h,*.C,*.cc syn region myFold start="/\*" skip="/\*" end="\*/" transparent fold
"""- "autocmd BufRead *.c,*.h,*.C,*.cc syn region myComment	start=.^/\*. skip=./\*. end=.\*/. fold
"""- "autocmd BufRead *.c,*.h,*.C,*.cc hi def link myComment Comment
"""-
"""- "autocmd BufRead *.c,*.h,*.C,*.cc syn sync fromstart
"""- "autocmd BufRead *.c,*.h,*.C,*.cc set foldmethod=syntax
"""-augroup END

source ~/.exrc
