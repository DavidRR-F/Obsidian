set clipboard=unnamed

vmap <Tab> >gv
vmap <S-Tab> <gv
vmap jk <Esc>
imap jk <Esc>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

exmap focusRight obcommand editor:focus-right
nmap <C-l> :focusRight

exmap focusLeft obcommand editor:focus-left
nmap <C-h> :focusLeft

exmap togglefold obcommand editor:toggle-fold
nmap za :togglefold 

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall
