" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq

"set pastetoggle keybinding
set pastetoggle=<F2>

" Make Y consistent with D and C
map Y           y$

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Undo/redo - Doesn't MacVim already have this?
map <D-z>       :earlier 1<CR>
map <D-Z>       :later 1<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" Tab in insert mode should just indent
autocmd VimEnter * iunmap <tab>

" FuzzyFinder
map <D-e>       :FufBuffer<CR>
map <leader>rb  :FufBuffer<CR>

" Command-T
map <D-N>       :CommandTFlush<CR>:CommandT<CR>
map <leader>F   :CommandTFlush<CR>:CommandT<CR>
nmap <C-p>      :CommandT<CR>
map <leader>f   :CommandT<CR>

" ctags with rails load path
map <leader>rt :!bundle exec rails runner 'puts $LOAD_PATH.select{\|x\| x.include?(Dir.pwd) && x \!~ \%r{/(vendor\|spec)\b} }.join(" ")' \| xargs /usr/local/bin/ctags -R public/javascripts<CR>
map <leader>rT :!bundle exec rails runner 'puts $LOAD_PATH.select{\|x\| x.include?(Dir.pwd) && x \!~ \%r{/(vendor\|spec)\b} }.join(" ")' \| xargs bundle exec rdoc -f tags; /usr/local/bin/ctags --append -R public/javascripts<CR>

" Git blame
map <leader>g   :Gblame<CR>

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" Copy current file path to system pasteboard
map <leader>cp :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

" Run tests
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>

" Easy access to the shell
map <Leader><Leader> :!

" AG current word
map <leader>ag :Ag <cword><CR>
" AG current selection
vmap <leader>ag :Ag <cword><CR>

" Recalculate diff when it gets messed up.
nmap du :diffupdate<CR>

" Gundo.vim
map <leader>u :GundoToggle<CR>

" See init/story_id.vim
autocmd FileType gitcommit nnoremap <leader>i :Sid<CR>

" Make :EP! work like :e!
cabbrev EP! e!

" A rough opposite of J: inserts new-line. Real opposite of J, though, is: r<CR>
nmap <C-J> i<CR><ESC>

" Replace tildes with new lines to view X12
map <leader>X    :%s/\~/\~\r/g<CR>

" Open specs
nnoremap <Leader>a :A<CR>
nnoremap <Leader>A :AV<CR>

map <leader>V   :CommandT app/views<CR>
map <leader>M   :CommandT app/models<CR>
map <leader>C   :CommandT app/controllers<CR>
map <leader>S   :CommandT spec/<CR>

" remap escape because the touch bar sucks!
inoremap jj <ESC>
