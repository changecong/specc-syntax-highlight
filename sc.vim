" Vim syntax file
" Language:     SpecC
" Maintainer:   Zhicong Chen <chen.zhico@husky.neu.edu>
" Last Change:  2012 Oct 4
" Remark:       extend C syntax file for SpecC

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ ScHiLink hi link <args>
else
  command! -nargs=+ ScHiLink hi def link <args>
endif

" set new keyword

" SpecC extension
syn keyword scImport	import
syn keyword scType	this in out inout wait notify notifyone bit delta event piped
syn keyword scBehavior	behavior
syn keyword scChannel	channel interface
syn keyword scState	fsm par pipe
syn keyword scTiming	range timing waitfor
syn keyword scLogic	not
syn keyword scImplmnt	implements
" these names are reserved, can not be used in SpecC
syn keyword scError	asm catch class const_cast delete synamic_cast explicit export friend inline mutable namespace new operator private protected public reinterpret_cast static_cast template throw typeid typename using virtual
syn keyword scException	try trap interrupt 
syn match scComment	/note.*/

" define the x groupname

ScHiLink scImport	Include
ScHiLink scType		Type
ScHiLink scBehavior	Statement
ScHiLink scChannel	Statement
ScHiLink scState	Boolean
ScHiLink scTiming	Boolean
ScHiLink scLogic	Statement
ScHiLink scImplmnt	Structure
ScHiLink scError	Error
ScHiLink scException	Exception
ScHiLink scComment	Comment

let b:current_syntax = "sc"

":set ts=8 
