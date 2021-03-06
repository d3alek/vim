" $Id: 2html.vim 33 2008-02-19 01:26:11Z luc.hermitte $
" deactivate mu-template.vim
let s:mu_template = 
      \ exists('g:mt_IDontWantTemplatesAutomaticallyInserted')
      \ ? g:mt_IDontWantTemplatesAutomaticallyInserted : 0
let g:mt_IDontWantTemplatesAutomaticallyInserted = 1

" convert the file
source $VIMRUNTIME/syntax/2html.vim

" restore mu-template.vim
let g:mt_IDontWantTemplatesAutomaticallyInserted = s:mu_template
