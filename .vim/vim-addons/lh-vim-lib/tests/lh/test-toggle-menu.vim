"=============================================================================
" $Id: test-toggle-menu.vim 520 2012-03-19 18:09:15Z luc.hermitte $
" File:         tests/lh/test-toggle-menu.vim                            {{{1
" Author:       Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"               <URL:http://code.google.com/p/lh-vim/>
" License:      GPLv3 with exceptions
"               <URL:http://code.google.com/p/lh-vim/wiki/License>
" Version:      3.0.0
" Created:      17th Apr 2007
" Last Update:  $Date: 2012-03-19 11:09:15 -0700 (Mon, 19 Mar 2012) $
"------------------------------------------------------------------------
" Description:  
"       Tests for lh-vim-lib . lh#menu#def_toggle_item()
"
"------------------------------------------------------------------------
" Installation: �install details�
" History:      �history�
" TODO:         �missing features�
" }}}1
"=============================================================================

runtime autoload/lh/menu.vim

let Data = {
      \ "variable": "bar",
      \ "idx_crt_value": 1,
      \ "values": [ 'a', 'b', 'c', 'd' ],
      \ "menu": { "priority": '42.50.10', "name": '&LH-Tests.&TogMenu.&bar'}
      \}

call lh#menu#def_toggle_item(Data)

let Data2 = {
      \ "variable": "foo",
      \ "idx_crt_value": 3,
      \ "texts": [ 'un', 'deux', 'trois', 'quatre' ],
      \ "values": [ 1, 2, 3, 4 ],
      \ "menu": { "priority": '42.50.11', "name": '&LH-Tests.&TogMenu.&foo'}
      \}

call lh#menu#def_toggle_item(Data2)

" No default
let Data3 = {
      \ "variable": "nodef",
      \ "texts": [ 'one', 'two', 'three', 'four' ],
      \ "values": [ 1, 2, 3, 4 ],
      \ "menu": { "priority": '42.50.12', "name": '&LH-Tests.&TogMenu.&nodef'}
      \}
call lh#menu#def_toggle_item(Data3)

" No default
let g:def = 2
let Data4 = {
      \ "variable": "def",
      \ "values": [ 1, 2, 3, 4 ],
      \ "menu": { "priority": '42.50.13', "name": '&LH-Tests.&TogMenu.&def'}
      \}
call lh#menu#def_toggle_item(Data4)

" What follows does not work because we can't build an exportable FuncRef on top
" of a script local function
" finish

function! s:getSNR()
  if !exists("s:SNR")
    let s:SNR=matchstr(expand("<sfile>"), "<SNR>\\d\\+_\\zegetSNR$")
  endif
  return s:SNR 
endfunction

function! s:Yes()
  echomsg "Yes"
endfunction

function! s:No()
  echomsg "No"
endfunction
let Data4 = {
      \ "variable": "yesno",
      \ "values": [ 1, 2 ],
      \ "text": [ "No", "Yes" ],
      \ "actions": [ function(s:getSNR()."No"), function(s:getSNR()."Yes") ],
      \ "menu": { "priority": '42.50.20', "name": '&LH-Tests.&TogMenu.&yesno'}
      \}
call lh#menu#def_toggle_item(Data4)
