
" Sets line number
set number
-
" Set to show command typed
set showcmd

" Set highlight current line
set cursorline

let mapleader = ";"
let g:mapleader = ";"

" Fast visual block
nmap <Leader>v <C-V>

" Easy system clipboard copy/paste
noremap <space>Y "+Y
noremap <space>y "+y
noremap <space>p "+p
noremap <space>P "+P

noremap <space>j :%!python -m json.tool<CR>

try
    colorscheme peaksea
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>ct :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <leader>ct :!ctags -R .<CR><CR>
set tags=tags;

"Disable auto change current directory
" set autochdir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cs :!cscope -Rbq<CR>
if has("cscope")
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
""""""""""""" My cscope/vim key mappings
  "
  " The following maps all invoke one of the following cscope search types:
  "
  "   's'   symbol: find all references to the token under cursor
  "   'g'   global: find global definition(s) of the token under cursor
  "   'c'   calls:  find all calls to the function name under cursor
  "   't'   text:   find all instances of the text under cursor
  "   'e'   egrep:  egrep search for the word under cursor
  "   'f'   file:   open the filename under cursor
  "   'i'   includes: find files that include the filename under cursor
  "   'd'   called: find functions that function under cursor calls
  "
  " Below are three sets of the maps: one set that just jumps to your
  " search result, one that splits the existing vim window horizontally and
  " diplays your search result in the new window, and one that does the same
  " thing, but does a vertical split instead (vim 6 only).
  "
  " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
  " unlikely that you need their default mappings (CTRL-\'s default use is
  " as part of CTRL-\ CTRL-N typemap, which basically just does the same
  " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
  " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
  " of these maps to use other keys.  One likely candidate is 'CTRL-_'
  " (which also maps to CTRL-/, which is easier to type).  By default it is
  " used to switch between Hebrew and English keyboard mode.
  "
  " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
  " that searches over '#include <time.h>" return only references to
  " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
  " files that contain 'time.h' as part of their name).


  " To do the first type of search, hit 'CTRL-\', followed by one of the
  " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
  " search will be displayed in the current window.  You can use CTRL-T to
  " go back to where you were before the search.
  "

  "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

  nmap ;zs :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap ;zg :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap ;zc :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap ;zt :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap ;ze :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap ;zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap ;zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap ;zd :cs find d <C-R>=expand("<cword>")<CR><CR>



    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

  nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


  " Hitting CTRL-space *twice* before the search type does a vertical
  " split instead of a horizontal one (vim 6 and up only)
  "
  " (Note: you may wish to put a 'set splitright' in your .vimrc
  " if you prefer the new window on the right instead of the left

  nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


  """"""""""""" key map timeouts
  "
  " By default Vim will only wait 1 second for each keystroke in a mapping.
  " You may find that too short with the above typemaps.  If so, you should
  " either turn off mapping timeouts via 'notimeout'.
  "
  "set notimeout
  "
  " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
  " with your own personal favorite value (in milliseconds):
  "
  "set timeoutlen=4000
  "
  " Either way, since mapping timeout settings by default also set the
  " timeouts for multicharacter 'keys codes' (like <F1>), you should also
  " set ttimeout and ttimeoutlen: otherwise, you will experience strange
  " delays as vim waits for a keystroke after you hit ESC (it will be
  " waiting to see if the ESC is actually part of a key code like <F1>).
  "
  "set ttimeout
  "
  " personally, I find a tenth of a second to work well for key code
  " timeouts. If you experience problems and have a slow terminal or network
  " connection, set it higher.  If you don't set ttimeoutlen, the value for
  " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
  "
  "set ttimeoutlen=100
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

if has("gui_running")
    set background=dark
    colorscheme peaksea
       set guifont=courier_new:h13
       au GUIEnter * simalt ~x
       set guioptions-=m " Hide menu
       set guioptions-=T " Hide toolbar
       set guioptions-=b " Hide bottom scroll bar
       "set showtabline=0 " Hide Tab line
else
    colorscheme desert
    let g:colors_name="desert"
endif
" Full screen
" map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nnoremap <silent> <leader>tl :TlistToggle<CR>

" jsbeautify
nnoremap <silent> <leader>ff :call JsBeautify()<cr>
