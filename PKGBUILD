pkgname="fixme-arch"
pkgver=0
pkgrel=1
pkgdesc="A dummpy package for build up my favorite archlinux environment"
arch=('any')
depends=()
# apps
## editor
depends+=(gvim)
## version control
depends+=(git)
## email
depends+=(mutt getmail msmtp)
## privacy
depends+=(gnupg pass)
## network tool
depends+=(openssh mosh gnu-netcat mtr dnsutils)
## chatting
depends+=(weechat freetalk)
## compilers and interpretes
depends+=(ghc go rust)
## language package managers
depends+=(cabal-install)
## debugger
depends+=(gdb)
## others
depends+=(bash-completion pv)

# X drivers
depends+=(xf86-input-mouse xf86-input-evdev xf86-input-keyboard xf86-input-synaptics xf86-video-intel)

# X services
depends+=(xorg-server xorg-xinit xorg-font-utils ttf-dejavu wqy-zenhei wqy-microhei)

# X applications
depends+=(xorg-xrandr xorg-setxkbmap xorg-xsetroot xorg-xrdb xorg-xdpyinfo xorg-xinput xclip scrot)

# desktop environment, use cabal to install xmonad manually
depends+=(dmenu rxvt-unicode xlockmore hsetroot)

# fcitx input method
depends+=(fcitx fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5)

# GUI apps
depends+=(chromium)

license=('GPL')

package() {
	echo "amazing things happen with ArchLinux"
	echo "ArchLinux require a package() function in PKGBUILD"
}
