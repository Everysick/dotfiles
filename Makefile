all: emacs zsh tmux npm_completion brew_completion git macos

emacs:
	ln -s -f ${PWD}/.emacs ${HOME}/.emacs

	mkdir -p ${HOME}/.emacs.d/inits
	ln -s -f ${PWD}/.emacs.d/inits/* ${HOME}/.emacs.d/inits

	mkdir -p ${HOME}/.emacs.d/themes
	ln -s -f ${PWD}/.emacs.d/themes/dark-laptop-theme.el ${HOME}/.emacs.d/themes/dark-laptop-theme.el
	ln -s -f ${PWD}/.emacs.d/themes/sky-color-clock.el ${HOME}/.emacs.d/themes/sky-color-clock.el

	mkdir -p ${HOME}/.emacs.d/elisp

	emacs --batch -q -l ${PWD}/package-install.el -f 'bundle-install'

zsh:
	ln -s -f ${PWD}/.zshrc ${HOME}/.zshrc
	mkdir -p ${HOME}/.zsh/functions
	if [ ! -e ${HOME}/.zsh/00-machine.zsh ]; then cp ${PWD}/.zsh/00-machine.zsh ${HOME}/.zsh/00-machine.zsh; fi
	ln -s -f ${PWD}/.zsh/ext-* ${HOME}/.zsh/

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
	ln -s -f ${PWD}/.tmux-reattach-to-user-namespace.conf ${HOME}/.tmux-reattach-to-user-namespace.conf

git:
	ln -s -f ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -s -f ${PWD}/.gitignore_ ${HOME}/.gitignore
	touch ${HOME}/.gitconfig.local

macos:
	if [ "$(uname)" == 'Darwin' ]; then \
		defaults write -g InitialKeyRepeat -int 13; \
		defaults write -g KeyRepeat -int 1; \
		echo "Need Reboot"; \
	fi

.PHONY: all emacs zsh npm_completion brew_completion tmux git macos
