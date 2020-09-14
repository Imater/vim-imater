func! mappings#bind()
  " Шорткаты
  let g:mapleader = ","
  nmap <F12> :NERDTreeToggle<CR>

  inoremap jj <ESC>:w<CR>
  nnoremap <silent> <F10> :YRShow<cr>
  inoremap <silent> <F10> <ESC>:YRShow<cr>
  map <Leader>l :NERDTreeFind<CR>
  nmap <space> :CtrlPBuffer<CR>
  nmap <Tab> <Plug>(ctrlp)

  map <leader>td :TernDoc<CR>
  map <leader>tb :TernDocBrowse<CR>
  map <leader>tt :TernType<CR>
  map <leader>td :TernDef<CR>
  map <leader>tpd :TernDefPreview<CR>
  map <leader>tr :TernRefs<CR>
  map <leader>tR :TernRename<CR>

  set autochdir

  " map <Leader>1 :source ~/.config/nvim/sessions/imater.vim<CR>
  " map <Leader>2 :mksession! ~/.config/nvim/sessions/imater.vim<CR>
  " Save session on quitting Vim
  " autocmd VimLeave * NERDTreeClose
  " autocmd VimLeave * mksession! ~/.config/nvim/sessions/imater.vim

  " Restore session on starting Vim
  " autocmd VimEnter * :source ~/.config/nvim/sessions/imater.vim
  " autocmd VimEnter * NERDTree


  nnoremap <Leader>a :Gcd <bar> Ack! --literal ''<left>
  nnoremap <Leader>A :execute "Gcd <bar> Ack! --literal " . expand("<cword>") <Bar> cw<CR>

  map <Leader>H :HardTimeToggl

  nnoremap <leader>c :%s/class=\"\(\w*\)\"/class={styles.\1}<cr>
  " ,m
  " Toggle mouse support in Normal mode
  set mouse=a
  "nnoremap <leader>m :call ToggleMouse()<CR>

  " Clear the search highlight in Normal mode
  nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

  map <C-c> "*y

  " < >
  vnoremap < <gv
  vnoremap > >gv

  " ,p
  " Toggle the 'paste' option
  set pastetoggle=<Leader>p

  " ,nm
  " Switch type of line numbers
  " http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
  " Vim 7.3 required
  map <Leader>nm :call ToogleRelativeNumber()<cr>
  "
  " {{{ easymotion
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
  "
  " " s{char}{char} to move to {char}{char}
  nmap <Leader><space> <Plug>(easymotion-overwin-f2)
  "
  " " Move to line
  map <Leader>L <Plug>(easymotion-bd-jk)
  nmap <Leader>L <Plug>(easymotion-overwin-line)
  "
  " " Move to word
  map  <Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader>w <Plug>(easymotion-overwin-w)

  " ,a
  " Fast grep
  " Recursive search in current directory for matches with current word
  " map <Leader>a :execute "Ack " . expand("<cword>") <Bar> cw<CR>

  " ,s
  " Shortcut for :%s//
  nnoremap <leader>s :%s//<left>
  vnoremap <leader>s :s//<left>

  " Move lines
  " Move one line
  nmap <C-S-j> ddp
  " Move selected lines
  " See http://www.vim.org/scripts/script.php?script_id=1590
  vmap <C-S-k> xkP'[V']
  vmap <C-S-j> xp'[V']

  " Y from cursor position to the end of line
  nnoremap Y "*y

  " Pasting with correct indention
  nmap p p=`]
  nmap P P=`[

  " Disable <Arrow keys>
  " Warning: nightmare mode!
  " inoremap <Up> <NOP>
  " inoremap <Down> <NOP>
  " inoremap <Left> <NOP>
  " inoremap <Right> <NOP>
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
  " Navigate with <Ctrl>-hjkl in Insert mode
  imap <C-h> <C-o>h
  imap <C-j> <C-o>j
  imap <C-k> <C-o>k
  imap <C-l> <C-o>l

  " Switch splits
  nmap <C-h> <C-W>h
  nmap <C-j> <C-W>j
  nmap <C-k> <C-W>k
  nmap <C-l> <C-W>l

  " ,v
  " Open the .vimrc in a new buffer
  nmap <leader>v :e $MYVIMRC<CR>
  nmap <leader>m :e ~/coding/vim-imater/.config/nvim/autoload/mappings.vim<CR>
  " :cabbrev e NERDTreeClose<CR>:e!
  nmap <leader>h :e /private/etc/hosts<CR>
  nmap <leader>ng :e /usr/local/etc/nginx/nginx.conf<CR>

  " ,sn - snippets
  nmap <leader>sn :e ~/.vim/UltiSnips/all.snippets<CR>
  let g:UltiSnipsListSnippets="<s-z>"


  " <Space> = <PageDown>
  " nmap <Space> <PageDown>

  " n и N
  " Search matches are always in center
  nmap n nzz
  nmap N Nzz
  nmap * *zz
  nmap # #zz
  nmap g* g*zz
  nmap g# g#zz

  " K to split
  nnoremap K <nop>
  nnoremap K r<cr>f<space>

  " Navigate through wrapped lines
  " noremap j gj
  " noremap k gk

  " gf
  " Open file under cursor in a new vertical split
  nmap gf :below wincmd f<CR>

  map <F8> :let mycurf=expand("<cfile>")<cr><c-w> w :execute("e ".mycurf)<cr><c-w>p

  " Create a new window relative to the current one
  nmap <Leader><left>  :leftabove  vnew<CR>
  nmap <Leader><right> :rightbelow vnew<CR>
  nmap <Leader><up>    :leftabove  new<CR>
  nmap <Leader><down>  :rightbelow new<CR>

  " Copy indented line without spaces
  nnoremap ,y ^yg_"_dd

  " ,c
  " camelCase => camel_case
  " vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

  " <Space><Space>
  " Double space to ". "
  " imap <Space><Space> .

  " ,ts
  " Fix trailing white space
  map <leader>ts :%s/\s\+$//e<CR>

  " ,bl
  " Show buffers
  nmap <Leader>bl :ls<cr>:b

  " ,bp
  " Go to prev buffer
  nmap <Leader>bp :bp<cr>

  " ,bn
  " Go to next buffer
  nmap <Leader>bn :bn<cr>

  " ,u
  " Change case to uppercase
  nnoremap <Leader>u gUiw
  inoremap <Leader>u <esc>gUiwea

  " В коммандном режиме разрешить прыгать в конец и начало строки,
  " как в консоли
  cnoremap <c-e> <end>
  imap     <c-e> <c-o>$
  cnoremap <c-a> <home>
  imap     <c-a> <c-o>^

  " ,b
  " In Visual mode exec git blame with selected text
  vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

  " ,w
  " Jump to next split
  " map <Leader>w <C-w>v<C-w>1

  " Ctrl+s
  "
  map <C-s> <esc>:w<CR>
  imap <C-s> <esc>:w<CR>

  map <End> <esc>:w<CR>
  imap <End> <esc>:w<CR>

  :map <Leader>w :wa<kEnter>
  :imap <Leader>w <Esc>:wa<kEnter>

  " ,n
  " Edit another file in the same directory with the current one
  map <Leader>n :vnew <C-R>=expand("%:p:h") . '/'<CR>

  " Bind :Q to :q
  command! Q q

  " {<CR>
  " auto complete {} indent and position the cursor in the middle line
  inoremap {<CR> {<CR>}<Esc>O
  inoremap (<CR> (<CR>)<Esc>O
  inoremap [<CR> [<CR>]<Esc>O

  " Fold with space
  " nnoremap <Space> za
  " vnoremap <Space> zf

  " Switch tabs with <Tab>
  nmap <PageDown> :BuffergatorMruCycleNext<CR>
  nmap <PageUp> :BuffergatorMruCyclePrev<CR>
  nmap <Del> :bp <BAR> bd #<CR>
  map <Leader>g :BufOnly<CR>
  map <Leader>t :25Term<CR>
  map <Leader>tv :100VTerm<CR>

  nmap <Leader>d :new \| :resize 15 \| :VimwikiMakeDiaryNote<CR>

  nmap <S-PageDown> :bn<CR>
  nmap <S-PageUp> :bp<CR>

  nmap <Leader><PageDown> :VimwikiDiaryNextDay<CR>
  nmap <Leader><PageUp> :VimwikiDiaryPrevDay<CR>

  " Ремапим русские символы
  set keymap=russian-jcukenwin

  " Make it easy to jump around from term emu to Vim.
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

endfunc

function! Replace()
  let s:word = input("Replace " . expand('<cword>') . " with:")
  :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
  :unlet! s:word
endfunction

function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

function! ToogleRelativeNumber()
  if g:relativenumber == 0
    let g:relativenumber = 1
    set norelativenumber
    set number
    echo "Show line numbers"
  elseif g:relativenumber == 1
    let g:relativenumber = 2
    set nonumber
    set relativenumber
    echo "Show relative line numbers"
  else
    let g:relativenumber = 0
    set nonumber
    set norelativenumber
    echo "Show no line numbers"
  endif
endfunction

function! ToggleGUINoise()
  if &go==''
    exec('se go=mTrL')
    echo "Show GUI elements"
  else
    exec('se go=')
    echo "Show no GUI elements"
  endif
endfunction

function! Replace()
  let s:word = input("Replace " . expand('<cword>') . " with:")
  :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
  :unlet! s:word
endfunction

au BufAdd * exe "cd" fnameescape(getcwd())

autocmd FileType javascript,css,typescript nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,typescript imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

set scrolloff=3
set shell=sh
set noshiftround
set shiftwidth=2
set shortmess+=A
set shortmess+=I
set shortmess+=O
set shortmess+=T
set shortmess+=W
set shortmess+=a
set shortmess+=o
set shortmess+=t

if exists('##TextYankPost')
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 200)
endif
