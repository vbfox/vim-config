" Vim color file
" Maintainer:	Ajit J. Thakkar (ajit AT unb DOT ca)
" Last Change:	2003 Sep. 02
" Version:	1.0
" URL:		http://www.unb.ca/chem/ajit/vim.htm

" This GUI-only color scheme has a blue-black background

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "duskfox"

"hi Normal	guifg=ivory guibg=#0f2038
hi Normal gui=NONE guifg=ivory guibg=#001028

hi Cursor gui=NONE guifg=white guibg=darkviolet

hi IncSearch gui=NONE guifg=black guibg=lightgreen
hi Search gui=NONE guifg=fg guibg=#054010

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg	gui=NONE guifg=Red guibg=bg
hi ModeMsg	gui=NONE guifg=#BfD0F8 guibg=bg
hi StatusLine	gui=NONE guifg=#9fB0D8 guibg=#0f2038
hi StatusLineNC	gui=NONE guifg=#2f4058 guibg=#0f2038
hi VertSplit	gui=NONE guifg=Grey guibg=Grey
hi Visual	gui=reverse guifg=fg guibg=LightSkyBlue4
hi VisualNOS	gui=underline guifg=fg guibg=bg
hi DiffText	gui=NONE guifg=Yellow guibg=LightSkyBlue4
hi lCursor	guibg=Cyan guifg=Black
hi Directory	guifg=LightGreen guibg=bg
hi LineNr	guifg=#5f7088 guibg=#1f3048
hi MoreMsg	gui=NONE guifg=SeaGreen guibg=bg
hi NonText	gui=NONE guifg=bg guibg=bg
hi Question	gui=NONE guifg=LimeGreen guibg=bg
hi SpecialKey	guifg=Cyan guibg=bg
hi Title	gui=NONE guifg=Yellow2 guibg=bg
hi WarningMsg	guifg=Yellow guibg=bg
hi WildMenu	gui=NONE guifg=SkyBlue4 guibg=Bisque
hi Folded	guifg=MistyRose2 guibg=bg
hi FoldColumn	guifg=DarkBlue guibg=Grey
hi DiffAdd	gui=NONE guifg=Blue guibg=LightCyan
hi DiffChange	gui=NONE guifg=white guibg=LightCyan4
hi DiffDelete	gui=NONE guifg=LightBlue guibg=LightCyan

" Colors for syntax highlighting
hi Constant	gui=NONE guifg=MistyRose3 guibg=bg
hi String	gui=NONE guifg=LightBlue3 guibg=bg
hi Special	gui=NONE guifg=GoldenRod guibg=bg
hi Statement	gui=NONE guifg=khaki guibg=bg
"hi Statement	gui=NONE guifg=#d7cd7b guibg=bg
hi Operator	gui=NONE guifg=Chartreuse guibg=bg
hi Ignore	gui=NONE guifg=bg guibg=bg
hi ToDo		gui=NONE guifg=DodgerBlue guibg=bg
hi Error	gui=NONE guifg=Red guibg=Linen
hi Comment	gui=NONE guifg=SlateGrey guibg=bg
"hi Comment	gui=NONE guifg=Lavender guibg=bg
hi Identifier	gui=NONE guifg=BlanchedAlmond guibg=bg
hi PreProc	gui=NONE guifg=#ffa0a0 guibg=bg
hi Type		gui=NONE guifg=NavajoWhite guibg=bg
hi Underlined	gui=underline guifg=fg guibg=bg

hi MatchParen gui=NONE guibg=#2f4058
hi CursorLine gui=NONE guibg=#101038 

" vim: sw=2