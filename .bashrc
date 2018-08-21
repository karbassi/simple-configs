# Don't set any of this if prompt is not available
[ -z "$PS1" ] && return

# Set the username you don’t want to see in the prompt
# local_username="karbassi"

# Tell ls to be colourful
export CLICOLOR=1
export LS_OPTIONS='--color=auto'
# eval "$(dircolors -b)"
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS


# Aliases
# List Directory ---------------------------------------------------
alias ls='ls $LS_OPTIONS'
alias l='ls -lah'
alias la='ls -lAh'
alias ld='ls -ld -- */'
alias ll='ls -lh'
alias lla='ls -lah'
alias lsa='ls -lah'

if [ "$(uname)" == "Darwin" ]; then
  alias ls='ls -G'
fi

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'

# Catch Mistakes ---------------------------------------------------
alias rm='rm -ir'

# Other aliases ----------------------------------------------------
alias m='more'
alias df='df -h'


# Tell grep to highlight matches and ignore version control files
export GREP_OPTIONS='--color=auto --exclude="*\.svn*" --exclude="*\.git*"'
alias grep='grep $GREP_OPTIONS'


# Default editor: Code, then Sublime Text, then Nano
if command -v code >/dev/null 2>&1; then
  export EDITOR='code'
else
  export EDITOR='nano'
fi


# Allow to search with arrow keys
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
bind Space:magic-space

# Set history length. File: 1,000,000,000
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

# Don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%F %T '

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Save all lines of a multiple-line command in the same history entry (allows
# easy re-editing of multi-line commands)
shopt -s cmdhist

# Do not autocomplete when accidentally pressing Tab on an empty line.
# (It takes forever and yields "Display all 15 gazillion possibilites?")
shopt -s no_empty_cmd_completion

# bash completion settings (actually, these are readline settings)
# note: bind used instead of sticking these in .inputrc
bind "set completion-ignore-case on"

# Do not overwrite files when redirecting using ">".
# Note that you can still override this with ">|"
set -o noclobber

# no bell
bind "set bell-style none"

# show list automatically, without double tab
bind "set show-all-if-ambiguous On"

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done


# Locale
export LC_ALL=en_US.UTF-8
export LANG="en_US"

# Construct $PATH
PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
[ -d /usr/local/bin ] && PATH="/usr/local/bin:$PATH"
[ -d /usr/local/heroku/bin ] && PATH="/usr/local/heroku/bin:$PATH"
[ -d /usr/local/opt/ruby/bin ] && PATH="/usr/local/opt/ruby/bin:$PATH"
[ -d /usr/local/share/npm/bin ] && PATH="/usr/local/share/npm/bin:$PATH"
export PATH

# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

# If possible, add tab completion for many commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Bash completion (installed via Homebrew; source after `brew` is added to PATH)
command -v brew >/dev/null 2>&1 && [ -r "$(brew --prefix)/etc/bash_completion" ] && source "$(brew --prefix)/etc/bash_completion"

# Tell ls to be colourful
export CLICOLOR=1

# Make less the default pager, add some options and enable syntax highlight
# using source-highlight
export PAGER='less'

# Check if git is installed
git --version 2>&1 >/dev/null
export IS_GIT_AVAILABLE=$?

#
# Clean and minimalistic Bash prompt
# Author: Artem Sapegin, sapegin.me
#
# Inspired by: https://github.com/sindresorhus/pure & https://github.com/dreadatour/dotfiles/blob/master/.bash_profile
#
# Notes:
# - $local_username - username you don’t want to see in the prompt
#


# User color
case $(id -u) in
    0) user_color="$RED" ;;  # root
    *) user_color="$GREEN" ;;
esac

# Symbols
prompt_symbol="❯"
prompt_clean_symbol="✔"
prompt_dirty_symbol="✘"
prompt_venv_symbol="☁"
prompt_git_down_arrow="⇣"
prompt_git_up_arrow="⇡"
# in seconds
git_fetch_time="600"

# function prompt_pure_async_git_arrows() {
# 	# setopt localoptions noshwordsplit
# 	# builtin cd -q $1
# 	command git rev-list --left-right --count HEAD...@'{u}'
# }

function prompt_check_git_arrows() {
    set -- $(git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)
    local arrows left=${1:-0} right=${2:-0}

    (( right > 0 )) && arrows+=${prompt_git_down_arrow:-⇣}
    (( left > 0 )) && arrows+=${prompt_git_up_arrow:-⇡}

    [[ -n $arrows ]] || return
    typeset REPLY=$arrows
}

function prompt_command() {

    # Save and reload the history after each command finishes
    history -a

    # Local or SSH session?
    local remote=
    [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && remote=1

    # Git branch name and work tree status.
    # Only when we are inside Git working tree.
    local git_prompt=
    if [[ $IS_GIT_AVAILABLE -eq 0 && "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then

        # Update remote
        if [[ -f .git/FETCH_HEAD ]]; then
            local git_last_updated=$(date +%s -r ".git/FETCH_HEAD" 2>/dev/null)
            local current_time=$(date +%s)

            if [[ $(($current_time - $git_last_updated)) -gt $git_fetch_time ]]; then
                command git -c gc.auto=0 fetch &>/dev/null
            fi
        fi

        # Figure out if we need to push or pull
        set -- $(git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)
        local arrows left=${1:-0} right=${2:-0}
        (( right > 0 )) && arrows+=${prompt_git_down_arrow:-⇣}
        (( left > 0 )) && arrows+=${prompt_git_up_arrow:-⇡}

        # Branch name
        local branch="$(git symbolic-ref HEAD 2>/dev/null)"
        branch="${branch##refs/heads/}"

        # Working tree status (red when dirty)
        local dirty=
        # Modified files
        git diff --no-ext-diff --quiet --exit-code --ignore-submodules 2>/dev/null || dirty=1
        # Untracked files
        [ -z "$dirty" ] && test -n "$(git status --porcelain)" && dirty=1

        # Format Git info
        if [ -n "$dirty" ]; then
            git_prompt=" on $RED$branch $prompt_dirty_symbol$NOCOLOR $arrows"
        else
            git_prompt=" on $GREEN$branch $prompt_clean_symbol$NOCOLOR $arrows"
        fi
    fi

    # Only show username if not default
    local user_prompt=
    [ "$USER" != "$local_username" ] && user_prompt="$user_color$USER$NOCOLOR"

    # Show hostname inside SSH session
    local host_prompt=
    [ -n "$remote" ] && host_prompt="@$YELLOW$HOSTNAME$NOCOLOR"

    # Show delimiter if user or host visible
    local login_delimiter=
    [ -n "$user_prompt" ] || [ -n "$host_prompt" ] && login_delimiter=":"

    # Format prompt
    first_line="$user_prompt$host_prompt$login_delimiter$CYAN\w$NOCOLOR$git_prompt$venv_prompt"
    second_line="\[$MAGENTA\]$prompt_symbol\[$NOCOLOR\] "
    PS1="\n$first_line\n$second_line"

    # Multiline command
    PS2="\[$MAGENTA\]$prompt_symbol\[$NOCOLOR\] "

    # Terminal title
    local title="$(basename "$PWD")"
    [ -n "$remote" ] && title="$title \xE2\x80\x94 $HOSTNAME"
    echo -ne "\033]0;$title"; echo -ne "\007"
}

# Show awesome prompt
PROMPT_COMMAND=prompt_command
