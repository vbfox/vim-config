execute pathogen#infect()

lang C " Passage en anglais
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Block from mswin.vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim specific stuff

if has("gui_macvim")
  set guifont=Menlo\ Regular:h13
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  filetype on
  filetype plugin on
  filetype indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif

set autoindent
set smartindent

""" RECHERCHE
set ignorecase "Les commandes de recherche ignorent la case
set smartcase "Ignorer la case seulement si on recherche qqch en minuscule
set gdefault "La commande :s remplace par défaut sur toute la ligne
if has("extra_search")
  set hlsearch "Surligne tout les résultats de recherche
  set incsearch "Surligne des la frappe
endif

if  &t_Co > 2 || has("gui_running")
  "Active la coloration syntaxique
  syntax on
endif


set mousemodel=extend "Click droit sélectionne en mode visuel, au lieu de faire un popup
if has("gui_running")
  colorscheme duskfox
  set cursorline "Change la couleur de la ligne ou est le curseur
  set guioptions-=tT "Pas de toolbar, pas de menus détachables
  set guioptions-=m " Pas de menu
endif

""" COMPORTEMENT DES TABS
set tabstop=4 "Caractère tab
set shiftwidth=4 "Auto indent
"set expandtab "Transforme les tabs en espaces automatiquement

""" SWAP ET BACKUPS
let tmpdir=''
if has("win16") || has("win32") || has("win64")
  let tmpdir='%TEMP%'
endif
if has("unix")
  let tmpdir='~/.vimbackup,~/.backup,~/.tmp,/tmp'
endif

if tmpdir != ''
  execute('set directory='.tmpdir)
  execute('set backupdir='.tmpdir)
endif
set nobackup "Pas de backups

""" AUTRES
set number "Numérotation des lignes
set linebreak "Coupe joliment les lignes, pas brutablement
set shortmess+=A "Rajoute 'A' aux options de messages pour enlever les 'ATTENTION' liés au swap
"set laststatus=2 "Toujours afficher la ligne de status, meme avec un seul buffer
set clipboard+=unnamed "Redirect the unnamed buffer to the OS clipboard (For Yank, Delete, ...)

"Large command line history
if has("cmdline_hist")
  set history=10000
endif

"Allow to move to another buffer without saving
set hidden

"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Enable modelines
set modeline

"Display incomplete commands
set showcmd

"Always show the cursor position
if has("cmdline_info")
  set ruler
endif

""" LIST CHARS
"set list
set listchars=extends:>,precedes:<
"execute 'set listchars+=trail:'.nr2char(164)
execute 'set listchars+=trail:·'
execute 'set listchars+=tab:'.nr2char(187).nr2char(183)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("windows") && v:version > 700
  " Tabs Ctrl-F4, Ctrl-Tab, Ctrl-Shift-Tab
  noremap <silent> <C-F4> :tabclose<CR>
  inoremap <silent> <C-F4> <C-O>:tabclose<CR>
  cnoremap <silent> <C-F4> <C-C>:tabclose<CR>
  noremap <silent> <C-Tab> :tabnext<CR>
  inoremap <silent> <C-Tab> <C-O>:tabnext<CR>
  cnoremap <silent> <C-Tab> <C-C>:tabnext<CR>
  noremap <silent> <C-S-Tab> :tabprevious<CR>
  inoremap <silent> <C-S-Tab> <C-O>:tabprevious<CR>
  cnoremap <silent> <C-S-Tab> <C-C>:tabprevious<CR>
endif

" Se déplacer normalement dans les lignes wrapés
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" En mode visuel les touches de déplacement agissent comme hjkl
" Etrangement par défaut elle sortent du mode visuel.
" xmap est utilisé au lieu de vmap pour ne pas que le mode SELECT soit affecté
" Car sinon les touches du clavier n'annulent plus une sélection débutée en
" appuyant sur shift
xmap <silent> <Down> j
xmap <silent> <Up> k
xmap <silent> <Left> h
xmap <silent> <Right> l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+' 
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    let label .= wincount
  endif
  if label != ''
    let label .= ' '
  endif
  
  "Display only the name, never any folder
  let tabname = fnamemodify(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')

  "Buffer without name are displayed as [No Name] instead of blank space
  if tabname == ''
    let tabname = '[No Name]'
  endif

  " Append the buffer name
  return label . tabname
endfunction

set guitablabel=%{GuiTabLabel()}


"""""""""""""""""""""""""""""""""
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
set runtimepath+=C:\Go\misc\vim
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" vim:set ts=2 sw=2 et:
