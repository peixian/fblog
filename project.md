project: fBlog
output_dir: ./doc
project_website: http://sourceforge.net/projects/fortranblog/
summary: Stand-alone static site generator for Linux console
author: Denis BERNARD
email: deber@users.sf.net
predocmark: >
docmark_alt: #
predocmark_alt: <
display: public
         private
         protected
sort:type
source: true
graph: true
macro: TEST
       LOGIC=.true.
extra_mods: json_module: http://jacobwilliams.github.io/json-fortran/
            futility: http://cmacmackin.github.io
license: gfdl
exclude: config.h
exclude_dir: tools
extra_filetypes: inc sh #
extensions: f08
            
preprocess: true

**fBlog is a stand-alone weblog page generator to be uploaded (website) or viewed on its own computer (diary or notebook).**

####Feature####

* Simple:
    - no templating,
    - themes comes only with style sheets,
    - no programming skills required,
    - standalone binary executable.
* Human interfaces:
    - command line,
    - console.
* Powerful:
    - generate thousands entries in few seconds (tested for 1 entry/day/50 years.),
    - low memory footprint.
* Secure:
    - no JavaScript,
    - no PHP,
    - no *SQL database but plain text files,
    - static web pages,
    - statically typed and compiled programming language.
* Internationalization:
    - right-to-left direction languages (not fully tested),
    - UTF-8 .
* Limitations:
    - no commentaries,
    - only 8 bits character length encoding (UTF-8 tested),
    - not yet Markdown support (scheduled),
    - not yet RSS-ATOM feed (coming soon).

####Target systems####

* Any UNIX/POSIX based systems (Linux x86_64 tested).

####Dependencies####

* Build time:
    - recent Fortran compiler (gfortran-5.3.0 tested).
* Web pages generation:
    - POSIX shell (Bash tested),
    - POSIX external commands (`ls rm cp mkdir stty` and `vi`).
* Online: 
    - Web server (Apache tested).
* Offline:
    - Web browser (Firefox tested).

####Quick start####

                  01     $  autoreconf --install
                  02     $ ./configure
                  03     # sudo make install
                  04     $ mkdir blog_dir
                  05     $ fblog blog_dir

####Environment####

By default, the text editor is launched according `EDITOR` environment variable. (If none, `vi` text editor is launched.) To override it, (i.g. to have `nano` editor), just enter at command line:

                  $ EDITOR=nano fblog -c blog_dir

Uncomment the line beginning by `EDITOR` and write the name of your preferred editor.

    Copyright (C) 2016 Denis Bernard
    License: GPLv3+
