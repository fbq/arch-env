HOME=fakehome
PERSONAL_CONFIG_FILE_LIST= \
	${HOME}/.vimrc \
	${HOME}/.Xdefaults \
	${HOME}/.xinitrc \
	${HOME}/.Xmodmap \
	${HOME}/.xmonad/xmonad.hs \
	${HOME}/.fontconfig/fonts.conf \
	${HOME}/.tmux.conf
	 
all: ${PERSONAL_CONFIG_FILE_LIST}

${HOME}/.fontconfig/fonts.conf : fontconfig/fonts.conf
	mkdir -p ${HOME}/.config/fontconfig/
	cp fontconfig/fonts.conf ${HOME}/.config/fontconfig/

${HOME}/.vimrc : vim/vimrc
	mkdir -p ${HOME}
	cp vim/vimrc ${HOME}/.vimrc

${HOME}/.tmux.conf : tmux/tmux.conf
	mkdir -p ${HOME}
	cp tmux/tmux.conf ${HOME}/.tmux.conf

${HOME}/.Xdefaults : X/Xdefaults
	mkdir -p ${HOME}
	cp X/Xdefaults ${HOME}/.Xdefaults

${HOME}/.xinitrc : X/xinitrc
	mkdir -p ${HOME}
	cp X/xinitrc ${HOME}/.xinitrc

${HOME}/.Xmodmap : X/Xmodmap
	mkdir -p ${HOME}
	cp X/Xmodmap ${HOME}/.Xmodmap

${HOME}/.xmonad/xmonad.hs : X/xmonad.hs
	mkdir -p ${HOME}/.xmonad
	cp X/xmonad.hs ${HOME}/.xmonad/xmonad.hs
