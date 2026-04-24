#!/bin/bash
TEMPDIR="$PWD/temp"
OS=$(cat /etc/*release | grep -m 1 "NAME=" | awk -F = '{ print $2 }' | tr -d '"')
ARCH=$(uname -m)

case $ARCH in
	"aarch64" | "arm64")
		NVIM_URL='https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz'
		;;

	"x86_64" | "amd64")
		NVIM_URL='https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz'
		;;

	*)
		echo "Unable to determine architecture!"
		echo "Exiting..."
		exit 1
		;;
esac

FILENAME="$(basename "$NVIM_URL")"
SUBDIR="$TEMPDIR/${FILENAME%%.*}"

if [[ -z $OS ]]; then
	echo 'The OS was not detected successfully'
	echo 'Exiting...'
	exit 1
fi

echo 'The OS was detected as:'
echo "$OS"

case $OS in
	"Arch Linux")
		echo 'Installing with pacman...'
		sudo pacman -S --needed neovim tmux git unzip
		;;
		
	"Ubuntu" | "noble" | "questing")
		echo 'Installing with apt...'
		sudo apt install tmux git unzip

		# Manual install because some ubuntu installs
		# may not have updated packages sources
		mkdir $TEMPDIR
		curl -L $NVIM_URL | tar -zx -C $TEMPDIR
		sudo cp -R $SUBDIR/* /usr
		rm -Rf $TEMPDIR
		;;

	*)
		echo 'OS not supported by the script.'
		echo 'Exiting'
		exit 1
		;;
esac

echo 'Done!'
