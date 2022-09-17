#!/bash

# source this file in any of the following shells to activate (% pkg %)

# Note: tcsh must come first or this won't work (for tcsh).

# tcsh
test -n "$tcsh" && eval '\
set s = ($_) \
@ i = $#s - 1 \
set d = `dirname $s[$i]` \
setenv (% NAME %)_ROOT `cd $d && pwd -P` \
setenv PATH "$(% NAME %)_ROOT/bin:$(% NAME %)_ROOT/local/bin:$PATH" \
setenv MANPATH "$(% NAME %)_ROOT/man:$(% NAME %)_ROOT/local/man:`manpath -q`" \
exit 0 \
'

# bash
test -n "$BASH_VERSION" && eval '
(% NAME %)_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
PATH=$(% NAME %)_ROOT/bin:$(% NAME %)_ROOT/local/bin:$PATH
MANPATH=$(% NAME %)_ROOT/man:$(% NAME %)_ROOT/local/man:$(manpath -q)
export (% NAME %)_ROOT PATH MANPATH
return
'

# zsh
test -n "$ZSH_VERSION" && eval '
(% NAME %)_ROOT=$(cd "$(dirname "$0")" && pwd -P)
PATH=$(% NAME %)_ROOT/bin:$(% NAME %)_ROOT/local/bin:$PATH
MANPATH=$(% NAME %)_ROOT/man:$(% NAME %)_ROOT/local/man:$(manpath -q)
export (% NAME %)_ROOT PATH MANPATH
return
'

# fish
test -n "$FISH_VERSION" && eval '
set (% NAME %)_ROOT (cd (dirname (status filename)) && pwd -P)
set PATH $(% NAME %)_ROOT/bin:$(% NAME %)_ROOT/local/bin:$PATH
set MANPATH $(% NAME %)_ROOT/man:$(% NAME %)_ROOT/local/man:(manpath -q)
export (% NAME %)_ROOT PATH MANPATH
exit
'

# Other shells including:
# ash, dash, ksh, mksh, posh, sh
test -d "$(% NAME %)_ROOT" && eval '
PATH=$(% NAME %)_ROOT/bin:$(% NAME %)_ROOT/local/bin:$PATH
MANPATH=$(% NAME %)_ROOT/man:$(% NAME %)_ROOT/local/man:$(manpath -q)
export (% NAME %)_ROOT PATH MANPATH
return
'

echo "ERROR: for shell '$0', set (% NAME %)_ROOT=/path/to/(% name %) before sourcing .rc"

# vim: ft=sh:
