# inits
#for f in $(ls ${HOME}/.zsh/*.zsh | sort); do
#    source $f
#done

# theme

if [ -z $THEME_COLOR ]; then
    # default is raspberry
    THEME_COLOR=raspberry
fi

case $THEME_COLOR in
    orange    ) THEME_COLOR=166-172;;
    green     ) THEME_COLOR=28-35;;
    blue      ) THEME_COLOR=25-32;;
    sky       ) THEME_COLOR=32-39;;
    red       ) THEME_COLOR=124-160;;
    raspberry ) THEME_COLOR=125-126;;
    pink      ) THEME_COLOR=198-199;;
    purple    ) THEME_COLOR=90-91;;
    gray      ) THEME_COLOR=240-242;;
esac

export COLOR_DARK=${THEME_COLOR%-*}
export COLOR_LIGHT=${THEME_COLOR#*-}

# profile
PROFILE_DEFAULT_USER=eveysick
PROFILE_DEFAULT_HOST=MBA

# color
autoload colors
colors

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '#%b'
zstyle ':vcs_info:*' actionformats '#%b|%a'
PR_USER="%n%F{250}%f"
PR_HOST="%m"
PR_HOST_H="%B%K{$COLOR_DARK}%m%k%b${PR_COLON}"
precmd() {
    LANG=en_US.UTF-8 vcs_info
    PROMPT="%F{32}%~%F{93}${vcs_info_msg_0_}%F{250}%(!.#.$)%f "
    #if [ $PROFILE_DEFAULT_HOST != $(hostname -s) ]; then
    #    PROMPT="${PR_HOST_H}%% ${PROMPT}"
    #else
    #    PROMPT="${PROMPT}"
    #fi
    #    PROMPT="${PR_HOST_H}${PROMPT}"
    #    if [ $PROFILE_DEFAULT_USER != $(whoami) ]; then
    #        PROMPT="${PR_USER}${PROMPT}"
    #    fi
    #elif [ $PROFILE_DEFAULT_USER != $(whoami) ]; then
    #    PROMPT="${PR_USER}${PR_HOST}${PROMPT}"
    #fi
}

# completion
autoload -U compinit
compinit
autoload bashcompinit
bashcompinit
zstyle ":completion:*:commands" rehash 1

# npm completion
if [ -e "${HOME}/.zsh/npm-completion.bash" ]; then
    source "${HOME}/.zsh/npm-completion.bash"
fi

zstyle ':completion:*:default' menu select=1

setopt auto_pushd
setopt auto_cd
setopt nolistbeep
setopt hist_ignore_space

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
export PATH="${HOME}/.rbenv/bin:${PATH}"
export PATH="$PATH:./node_modules/.bin"
export GOPATH="/Users/everysick/go"

# copy alias
alias -g C="| pbcopy"
alias -g E="| ./a.out"
alias -g TMP="curl https://gist.githubusercontent.com/Everysick/5b9f8f7c57e55af0b135/raw/65530108f901fa5453849ae96935b0fe667533da/contest_template.cpp >"

# rbenv
which rbenv > /dev/null 2>&1
if [ $? = 0 ]; then
    eval "$(rbenv init -)"
fi


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
