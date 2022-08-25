# 1. Markdown

## 1.1 Headers

    # H1
    ## H2
    ### H3
    #### H4
    ##### H5
    ###### H6

## 1.2 Emphasis

    Emphasis (italic):      *Example* or _Example_
    Strong emphasis (bold): **Example** or __Example__
    Combined emphasis:      ***Example*** or ___Example___
    Strikethrouch:          ~~Example~~

## 1.3 Lists

    1. Ordered list item
        1. Ordered sub-list
    2. Ordered list item
        - Unordered sub-list
    3. Ordered list item

## 1.4 Unordered List

    - Unordered list item
    - Unordered list item
    - Unordered list item

    + Unordered list item
    + Unordered list item
    + Unordered list item

    * Unordered list item
    * Unordered list item
    * Unordered list item

## 1.5 Tasks

    - [ ] unchecked
    - [x] checked

## 1.6 Tables

    | Left | Center | Right |
    | :--- | :----: | ----: |
    | 1    |1       |1      |
    | 2    |2       |2      |
    | 3    |3       |3      |

## 1.7 Blockquotes

    > Blockquote
    >> Sub-blockquote

## 1.8 Links

    [Link text](https://example.com/ "Hover Text")

    [Link text][reference]
    …
    [reference]: https://example.com/

    <https://example.com>

    <john@doe.org>

## 1.9 Codeblock

At least four spaces or a tab to create a codeblock.

Inline `code` has `back-ticks around` it.

## 1.10 Highlighting

```python
#!/usr/bin/env python3
"""
path:   /home/klassiker/.local/share/repos/python/link_parser.py
author: klassiker [mrdotx]
github: https://github.com/mrdotx/python
date:   2020-07-09T14:54:45+0200
"""

import sys
from urllib.parse import urlparse
import requests
from bs4 import BeautifulSoup

HELP = """link_parser.sh -- script to grab links from websites
  Usage:
    link_parser.py [url]
  Setting:
    [url] = url to grab links from
  Example:
    link_parser.py https://www.youtube.com/user/.../videos"""

try:
    URL = sys.argv[1]
    URL_PART = urlparse(URL)

    SITE = URL_PART.scheme + "://" + URL_PART.netloc
    SITE_PATH = URL_PART.path

    PAGE = requests.get(str(SITE + SITE_PATH))
    SOUP = BeautifulSoup(PAGE.content, 'html.parser')
    LINK_LIST = SOUP.find_all('a')

    for link in LINK_LIST:
        if 'href' in link.attrs:
            print(str(SITE + link.attrs['href']))
except IndexError:
    print(HELP)
```

Supported languages:

- cucumber ('*.feature')
- abap ('*.abap')
- ada ('*.adb', '*.ads', '*.ada')
- ahk ('*.ahk', '*.ahkl')
- apacheconf ('.htaccess', 'apache.conf', 'apache2.conf')
- applescript ('*.applescript')
- as ('*.as')
- as3 ('*.as')
- asy ('*.asy')
- bash ('*.sh', '*.ksh', '*.bash', '*.ebuild', '*.eclass')
- bat ('*.bat', '*.cmd')
- befunge ('*.befunge')
- blitzmax ('*.bmx')
- boo ('*.boo')
- brainfuck ('*.bf', '*.b')
- c ('*.c', '*.h')
- cfm ('*.cfm', '*.cfml', '*.cfc')
- cheetah ('*.tmpl', '*.spt')
- cl ('*.cl', '*.lisp', '*.el')
- clojure ('*.clj', '*.cljs')
- cmake ('*.cmake', 'CMakeLists.txt')
- coffeescript ('*.coffee')
- console ('*.sh-session')
- control ('control')
- cpp ('*.cpp', '*.hpp', '*.c++', '*.h++', '*.cc', '*.hh', '*.cxx', '*.hxx', '*.pde')
- csharp ('*.cs')
- css ('*.css')
- cython ('*.pyx', '*.pxd', '*.pxi')
- d ('*.d', '*.di')
- delphi ('*.pas')
- diff ('*.diff', '*.patch')
- dpatch ('*.dpatch', '*.darcspatch')
- duel ('*.duel', '*.jbst')
- dylan ('*.dylan', '*.dyl')
- erb ('*.erb')
- erl ('*.erl-sh')
- erlang ('*.erl', '*.hrl')
- evoque ('*.evoque')
- factor ('*.factor')
- felix ('*.flx', '*.flxh')
- fortran ('*.f', '*.f90')
- gas ('*.s', '*.S')
- genshi ('*.kid')
- glsl ('*.vert', '*.frag', '*.geo')
- gnuplot ('*.plot', '*.plt')
- go ('*.go')
- groff ('*.(1234567)', '*.man')
- haml ('*.haml')
- haskell ('*.hs')
- html ('*.html', '*.htm', '*.xhtml', '*.xslt')
- hx ('*.hx')
- hybris ('*.hy', '*.hyb')
- ini ('*.ini', '*.cfg')
- io ('*.io')
- ioke ('*.ik')
- irc ('*.weechatlog')
- jade ('*.jade')
- java ('*.java')
- js ('*.js')
- jsp ('*.jsp')
- lhs ('*.lhs')
- llvm ('*.ll')
- logtalk ('*.lgt')
- lua ('*.lua', '*.wlua')
- make ('*.mak', 'Makefile', 'makefile', 'Makefile.*', 'GNUmakefile')
- mako ('*.mao')
- maql ('*.maql')
- mason ('*.mhtml', '*.mc', '*.mi', 'autohandler', 'dhandler')
- markdown ('*.md')
- modelica ('*.mo')
- modula2 ('*.def', '*.mod')
- moocode ('*.moo')
- mupad ('*.mu')
- mxml ('*.mxml')
- myghty ('*.myt', 'autodelegate')
- nasm ('*.asm', '*.ASM')
- newspeak ('*.ns2')
- objdump ('*.objdump')
- objectivec ('*.m')
- objectivej ('*.j')
- ocaml ('*.ml', '*.mli', '*.mll', '*.mly')
- ooc ('*.ooc')
- perl ('*.pl', '*.pm')
- php ('*.php', '*.php(345)')
- postscript ('*.ps', '*.eps')
- pot ('*.pot', '*.po')
- pov ('*.pov', '*.inc')
- prolog ('*.prolog', '*.pro', '*.pl')
- properties ('*.properties')
- protobuf ('*.proto')
- py3tb ('*.py3tb')
- pytb ('*.pytb')
- python ('*.py', '*.pyw', '*.sc', 'SConstruct', 'SConscript', '*.tac')
- rb ('*.rb', '*.rbw', 'Rakefile', '*.rake', '*.gemspec', '*.rbx', '*.duby')
- rconsole ('*.Rout')
- rebol ('*.r', '*.r3')
- redcode ('*.cw')
- rhtml ('*.rhtml')
- rst ('*.rst', '*.rest')
- sass ('*.sass')
- scala ('*.scala')
- scaml ('*.scaml')
- scheme ('*.scm')
- scss ('*.scss')
- smalltalk ('*.st')
- smarty ('*.tpl')
- sourceslist ('sources.list')
- splus ('*.S', '*.R')
- sql ('*.sql')
- sqlite3 ('*.sqlite3-console')
- squidconf ('squid.conf')
- ssp ('*.ssp')
- tcl ('*.tcl')
- tcsh ('*.tcsh', '*.csh')
- tex ('*.tex', '*.aux', '*.toc')
- text ('*.txt')
- v ('*.v', '*.sv')
- vala ('*.vala', '*.vapi')
- vbnet ('*.vb', '*.bas')
- velocity ('*.vm', '*.fhtml')
- vim ('*.vim', '.vimrc')
- xml ('*.xml', '*.xsl', '*.rss', '*.xslt', '*.xsd', '*.wsdl')
- xquery ('*.xqy', '*.xquery')
- xslt ('*.xsl', '*.xslt')
- yaml ('*.yaml', '*.yml')

## 1.11 Footnote

    A text with a footnote [^1].
    …
    [^1]: the footnote at the end of the document.

## 1.12 Inline footnote

    A text with a footnote [^This is the actual footnote.].

## 1.13 Horizontal rule

    ***
    ---
    ___
    * * *
    - - -
    _ _ _

## 1.14 Content blocks

    `/chapter1.txt`

    `/program.py`

    `/table.csv`
