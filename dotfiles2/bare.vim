" This file works only with vim 5.4a and newer
" Overwrite some of the syntax defaults
hi NonText         cterm=NONE ctermfg=0 
hi StatusLine      cterm=NONE           ctermbg=6
hi FillColumn      cterm=NONE           ctermbg=4 ctermfg=4
hi StatusLineNC    cterm=NONE           ctermbg=4
hi Cursor          cterm=bold ctermfg=7 
hi ModeMsg         cterm=bold ctermfg=6
hi Visual          cterm=NONE           ctermbg=0
hi LineNr          cterm=NONE ctermfg=4
hi Search          cterm=NONE ctermfg=0 ctermbg=3
hi IncSearch       cterm=NONE ctermfg=1 ctermbg=3

if has("syntax")
  " let java_mark_braces_in_parens_as_errors=1
  let java_highlight_functions=1
  let java_highlight_debug=1
  let java_sapce_errors=1
  let java_highlight_java_lang_ids=1
  let java_highlight_all=1
  " let java_allow_cpp_keywords=1
  let html_my_rendering=1
  " let java_javascript=1
  " let java_css=1
  " let java_ignore_javadoc=1
  " colors for color terminal (xterm) normal / bold


  " 0 : gray 
  hi Constant                       term=NONE      cterm=NONE		ctermfg=0 
  " 0b: dirty white
  hi htmlBold                       term=underline cterm=bold           ctermfg=0 gui=bold      guifg=grey80
  hi htmlBoldUnderline         term=bold,underline cterm=underline,bold ctermfg=0 gui=bold      guifg=grey80

  " 1 : red
  hi Statement start=t_md stop=t_me term=NONE      cterm=NONE           ctermfg=1 gui=NONE      guifg=#B00000
  " 1b: orange
  hi Exception start=t_md stop=t_me term=NONE      cterm=bold           ctermfg=1 gui=NONE      guifg=#FF3030

  " 2 : green
  hi Identifier                     term=underline cterm=NONE           ctermfg=2 gui=NONE      guifg=green4
  hi Type                           term=NONE      cterm=NONE           ctermfg=2 gui=NONE      guifg=green4

  " 2b: light green
  hi Special                        term=bold      cterm=bold           ctermfg=2 gui=NONE      guifg=#70FF70

  " 3 : yellow
  hi htmlItalic 	            term=underline cterm=NONE           ctermfg=3 gui=NONE      guifg=yellow3
  hi htmlUnderlineItalic 	    term=underline cterm=underline      ctermfg=3 gui=underline guifg=yellow3

  " 3b: light yellow
  hi String                         term=italic    cterm=bold           ctermfg=3 gui=NONE      guifg=#F0F080
  hi htmlBoldItalic 	            term=underline,bold cterm=bold           ctermfg=3 gui=bold      guifg=#F0F080
  hi htmlBoldUnderlineItalic        term=underline,bold cterm=underline,bold ctermfg=3 gui=bold,underline guifg=#F0F080

  " 4 : blue
  hi Comment                        term=bold      cterm=NONE           ctermfg=4 gui=NONE      guifg=blue3
  hi htmlLink			    term=underline cterm=underline      ctermfg=4 gui=underline guifg=blue3

  " 4b: light blue
  hi SpecialComment                 term=NONE      cterm=bold           ctermfg=4 gui=NONE      guifg=#B0B0FF
  hi javaUserLabel                  term=NONE      cterm=bold           ctermfg=4 gui=NONE      guifg=#B0B0FF

  " 5 : magenta
  hi StorageClass                   term=underline cterm=NONE           ctermfg=5 gui=NONE      guifg=#A000A0
  hi Structure                      term=underline cterm=NONE           ctermfg=5 gui=NONE      guifg=#A000A0
  hi Typedef                        term=underline cterm=bold           ctermfg=5 gui=NONE      guifg=#EFA0BF

  " 5b: light magenta
  hi Boolean                        term=italic    cterm=bold           ctermfg=5 gui=NONE      guifg=#F0F080

  " 6 : cyan
  " hi htmlItalic	                    term=italic    cterm=NONE           ctermfg=6 gui=italic    guifg=#009999
  hi Number	                    term=italic    cterm=NONE           ctermfg=6 gui=italic    guifg=#009999

  " 6b: light cyan
  hi Title			    term=bold      cterm=bold,underline ctermfg=6 gui=bold,underline guifg=#A0FFFF
  hi htmlH2			    term=bold      cterm=bold           ctermfg=6 gui=bold      guifg=#A0FFFF

  " 7 : light brown
  hi PreCondit                      term=underline cterm=NONE           ctermfg=7 gui=NONE      guifg=#D0B099
  hi PreProc                        term=underline cterm=NONE           ctermfg=7 gui=NONE      guifg=#D0B099

  " 7b: white
  hi Function  start=t_md stop=t_me term=NONE      cterm=bold           ctermfg=7 gui=NONE      guifg=white

  " normal: black
  " bold  : bluegreen

  hi Todo                           term=standout  cterm=bold ctermbg=4 ctermfg=7 gui=NONE guifg=white   guibg=blue3
  hi Error                          term=reverse   cterm=bold ctermbg=1           gui=NONE guibg=#B00000
  hi Debug                          term=NONE      cterm=NONE ctermbg=7 ctermfg=1 gui=NONE guifg=#B00000 guibg=#D0B099
  hi DebugString                    term=italic    cterm=NONE ctermbg=7 ctermfg=2 gui=NONE guifg=green4  guibg=#D0B099
  hi DebugType                      term=underline cterm=NONE ctermbg=7 ctermfg=5 gui=NONE guifg=#A000A0 guibg=#D0B099 gui=NONE
  hi DebugSpecial                   term=bold      cterm=bold ctermbg=7 ctermfg=2 gui=NONE guifg=#70FF70 guibg=#D0B099 gui=NONE
  hi htmlUnderline		    term=underline cterm=underline                gui=underline

  hi Normal                                                                                guifg=#000000 guibg=#AD926E

  if has("gui_running") 
    if $DISPLAY =~ '^\(mergoscia\|:0\)'
      set guifont=-misc-fixed-bold-r-normal--13-120-75-75-c-80-iso8859-1
    else
      hi Error	 	gui=NONE guibg=red3
      hi Statement	gui=NONE guifg=red3
      hi Exception	gui=NONE guifg=red
      hi PreCondit	gui=NONE guifg=antiquewhite
      hi PreProc	gui=NONE guifg=antiquewhite
      hi StorageClass	gui=NONE guifg=magenta3
      hi Structure	gui=NONE guifg=magenta3
      hi Typedef	gui=NONE guifg=#FFD0FF
      hi String	   	gui=NONE guifg=#FFFFA0
      hi Comment	gui=NONE guifg=blue3
      hi htmlLink       gui=underline guifg=blue3
      hi Special	gui=NONE guifg=green1
      hi Todo	    	gui=NONE guifg=white 	guibg=blue3
      hi Identifier	gui=NONE guifg=green4
      hi Function	gui=NONE guifg=white
      hi htmlBold       gui=bold guifg=white
      hi Type        	gui=NONE guifg=green4
      hi SpecialComment gui=NONE guifg=lightblue1
      hi Debug        	gui=NONE guifg=red3 	guibg=antiquewhite
      hi DebugString 	gui=NONE guifg=green4 	guibg=antiquewhite
      hi DebugType	gui=NONE guifg=magenta3 guibg=antiquewhite
      hi DebugSpecial	gui=NONE guifg=green1 	guibg=antiquewhite
    endif
  endif

  hi link CommentTitle SpecialComment
  " hi link Number 	NONE
  hi link Character	String
  hi link DebugBoolean  Debug
  hi link Boolean  Typedef

  " ADSM opt file
  au! Syntax adsm source $VIM/mysyntax/adsm.vim

  " ASP
  au! Syntax asp source $VIM/mysyntax/asp.vim

  " Bytecode
  au! Syntax maxima source $VIM/mysyntax/maxima.vim

  " Bytecode
  au! Syntax bytecode source $VIM/mysyntax/bytecode.vim
  " Bytecode Traces
  au! Syntax bytecodetr source $VIM/mysyntax/bytecodetr.vim

  " CT log files
  au! Syntax ctlog source $VIM/mysyntax/log.vim

  " ASN
  au! Syntax asn source $VIM/mysyntax/asn.vim

  " GCS Config
  au! Syntax gcscfg source $VIM/mysyntax/cfg.vim

  " CSS Files
  au! Syntax css source $VIM/mysyntax/css.vim

  " GDB
  au! Syntax gdb source $VIM/mysyntax/gdb.vim

  " GDB
  au! Syntax m4 source $VIM/mysyntax/m4.vim

  " Test
  au! Syntax test source $VIM/mysyntax/test.vim

  au! Syntax lng source $VIM/mysyntax/lng.vim

  au! Syntax html source $VIM/mysyntax/html.vim

  au! Syntax webmacro source $VIM/mysyntax/webmacro.vim

  au! Syntax httplog source $VIM/mysyntax/httplog.vim

  " JavaScript
  au! Syntax javascript source $VIM/mysyntax/javascript.vim

  " Java
  au! Syntax java source $VIM/mysyntax/java.vim

  " JavaCC
  au Syntax javacc source $VIM/mysyntax/javacc.vim

  " Makefile
  au! Syntax make	source $VIM/mysyntax/make.vim

  " asm S
  au! Syntax asms	source $VIM/mysyntax/asms.vim

  " asm S
  au! Syntax myasm	source $VIM/mysyntax/myasm.vim

  " html.m4 
  au! Syntax htmlm4	source $VIM/mysyntax/htmlm4.vim

  " CONFIG
  au! Syntax CONFIG	source $VIM/mysyntax/config.vim

  " DTD
  " au! Syntax dtd	source $VIM/mysyntax/dtd.vim

  " XML
  " au! Syntax xml	source $VIM/mysyntax/xml.vim

  " jsp 
  " au! Syntax jsp	source $VIM/mysyntax/jsp.vim

  augroup END

endif
