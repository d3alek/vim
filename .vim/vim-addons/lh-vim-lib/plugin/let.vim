"=============================================================================
" $Id: let.vim 644 2012-09-11 08:41:02Z luc.hermitte@gmail.com $
" File:         plugin/let.vim                                    {{{1
" Author:       Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"		<URL:http://code.google.com/p/lh-vim/>
" License:      GPLv3 with exceptions
"               <URL:http://code.google.com/p/lh-vim/wiki/License>
" Version:      3.1.1
" Created:      31st May 2010
" Last Update:  $Date: 2012-09-11 01:41:02 -0700 (Tue, 11 Sep 2012) $
"------------------------------------------------------------------------
" Description:
"       Defines a command :LetIfUndef that sets a variable if undefined
" 
"------------------------------------------------------------------------
" Installation:
"       Drop this file into {rtp}/plugin
"       Requires Vim7+
" History:      
" 	v2.2.1: first version of this command into lh-vim-lib
" 	v3.0.0: GPLv3
" 	v3.0.1: :LetIfUndef works with dictionaries as well
" 	        function moved to its own autoload plugin
" TODO: 
" }}}1
"=============================================================================

" Avoid global reinclusion {{{1
let s:k_version = 300
if &cp || (exists("g:loaded_let")
      \ && (g:loaded_let >= s:k_version)
      \ && !exists('g:force_reload_let'))
  finish
endif
let g:loaded_let = s:k_version
let s:cpo_save=&cpo
set cpo&vim
" Avoid global reinclusion }}}1
"------------------------------------------------------------------------
" Commands and Mappings {{{1
command! -nargs=+ LetIfUndef call lh#let#if_undef(<f-args>)
" Commands and Mappings }}}1
"------------------------------------------------------------------------
" Functions {{{1
" Note: most functions are best placed into
" autoload/�your-initials�/�let�.vim
" Keep here only the functions are are required when the plugin is loaded,
" like functions that help building a vim-menu for this plugin.

" Functions }}}1
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
