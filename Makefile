all: emacs zsh tmux npm_completion brew_completion

emacs:
	ln -s -f ${PWD}/.emacs ${HOME}/.emacs

	mkdir -p ${HOME}/.emacs.d/inits
	ln -s -f ${PWD}/.emacs.d/inits/* ${HOME}/.emacs.d/inits

	mkdir -p ${HOME}/.emacs.d/themes
	ln -s -f ${PWD}/.emacs.d/themes/dark-laptop-theme.el ${HOME}/.emacs.d/themes/dark-laptop-theme.el

	mkdir -p ${HOME}/.emacs.d/elisp

	emacs --batch -q -l ${PWD}/package-install.el -f 'bundle-install'

zsh:
	ln -s -f ${PWD}/.zshrc ~/.zshrc
	mkdir -p ${HOME}/.zsh/functions

npm_completion: zsh
	if [ $(shell which npm 2>&1 > /dev/null; echo $$?) -eq 0 ]; then \
		npm completion > ${HOME}/.zsh/npm-completion.bash; \
	fi

brew_completion: zsh
	if [ $(shell which brew 2>&1 > /dev/null; echo $$?) -eq 0 ]; then \
		ln -s -f /usr/local/Library/Contributions/brew_zsh_completion.zsh ${HOME}/.zsh/functions/_brew; \
	fi

tmux:
	ln -s -f ${PWD}/.tmux.conf ${HOME}/.tmux.conf

.PHONY: all emacs zsh npm_completion brew_completion tmux
