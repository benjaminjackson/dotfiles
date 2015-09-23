## Terminal customizations ---

# custom bash prompt with git goodies
# installation: https://github.com/michaeldfallen/git-radar
PS1='(\[$(tput md)\]\t <\w>\[$(tput me)\])$(git-radar --bash --fetch) \$ '

# Colors!
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

## Share history across terminal windows  ---

# make bash append rather than overwrite the history on disk:
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# 2henever displaying the prompt, write the previous line to disk:
PROMPT_COMMAND='history -a'

## Native text editors from command line  ---

# open Sublime Text for commands that prompt for input
export EDITOR='subl -w'
export GIT_EDITOR="subl -w"

## Useful aliases  ---

# `pushd` and `popd` > `cd`, retains directory history like a browser's back button
alias cd="pushd"
alias bd="popd"

# fuck .DS_Store
alias rmds="find . -name '.DS_STORE' -exec rm -rf '{}' \;"

# git shortcuts
alias st="git status"
alias gd="git diff | subl"

# help with speeling
alias sduo="sudo"
alias suod="sudo"
alias usdo="sudo"
alias arke="rake"
alias raek="rake"
alias rkae="rake"
alias rkea="rake"
alias reak="rake"
alias rrake="rake"

# go from Finder to Terminal and vice-versa with `cdf` and `fdc`
function ff { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\
function cdf { cd "`ff $@`"; };
alias fdc="open -a Finder ."