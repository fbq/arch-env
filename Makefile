HOME=fakehome
PERSONAL_CONFIG_FILE_LIST= \
	${HOME}/.vimrc \
	${HOME}/.Xdefaults \
	${HOME}/.xinitrc \
	${HOME}/.Xmodmap \
	${HOME}/.xmonad/xmonad.hs \
	${HOME}/.fontconfig/fonts.conf \
	 
all: ${PERSONAL_CONFIG_FILE_LIST}

${HOME}/.fontconfig/fonts.conf : fonts.conf
	mkdir -p ${HOME}/.fontconfig/
	cp fonts.conf ${HOME}/.fontconfig/

${HOME}/.vimrc : vimrc
	mkdir -p ${HOME}
	cp vimrc ${HOME}/.vimrc

${HOME}/.Xdefaults : Xdefaults
	mkdir -p ${HOME}
	cp Xdefaults ${HOME}/.Xdefaults

${HOME}/.xinitrc : xinitrc
	mkdir -p ${HOME}
	cp xinitrc ${HOME}/.xinitrc

${HOME}/.Xmodmap : Xmodmap
	mkdir -p ${HOME}
	cp Xmodmap ${HOME}/.Xmodmap

${HOME}/.xmonad/xmonad.hs : xmonad.hs
	mkdir -p ${HOME}/.xmonad
	cp xmonad.hs ${HOME}/.xmonad/xmonad.hs

