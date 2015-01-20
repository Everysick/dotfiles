# color
autoload colors
colors

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() {
    LANG=en_US.UTF-8 vcs_info
    PROMPT="%{${fg[green]}%}${vcs_info_msg_0_}%F{200}%~%f%(!.#.$) "
    #psvar=()
    #psvar[1]=$(osx-cpu-temp)
    #RPROMPT="%{${fg[red]}%}[%1v]%{${reset_color}%}"
}
#setopt transient_rprompt

# completion
autoload -U compinit
compinit
autoload bashcompinit
bashcompinit

# npm completion
source "${HOME}/.zsh/npm-completion.bash"

zstyle ':completion:*:default' menu select=1

setopt auto_pushd
setopt auto_cd
setopt nolistbeep
setopt correct

# history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
setopt share_history

if [[ "${terminfo[kcuu1]}" != "" ]]; then
    bindkey "${terminfo[kcuu1]}" up-line-or-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
    bindkey "${terminfo[kcud1]}" down-line-or-search
fi

# editor
export EDITOR='emacs'

# key map
bindkey -e
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

# PATH
export PATH="${PATH}:/usr/local/bin:/usr/local/sbin"
export PATH="${HOME}/bin:${PATH}"

# copy alias
alias -g C="| pbcopy"
alias -g E="| ./a.out"
alias -g TMP="cat /Users/everysick/competition/MyLibrary/contest_template.cpp >"

# ls aliases
alias l="ls"
alias la="ls"
alias ll="ls -la"
alias sl="ls"

# git aliases
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gmg="git merge"
alias gcp="git cherry-pick"
alias glg="git log"

# heroku command
alias brew-heroku="/usr/local/bin/heroku"

# pkgconfig
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig"

# make sandbox
MKSDBX="${HOME}/src/mksdbx/mksdbx"
if [ -f $MKSDBX ]; then
    source $MKSDBX
fi
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#start redis
alias sredis="redis-server /usr/local/etc/redis.conf"
