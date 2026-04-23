#!/bin/bash
OS=$(cat /etc/*release | grep -m 1 "NAME=" | awk -F = '{ print $2 }' | tr -d '"')

if [[ -z $OS ]]; then
	echo 'The OS was not detected successfully'
	echo 'Exiting...'
	exit
fi

echo 'The OS was detected as:'
echo "$OS"

case $OS in
	"Arch Linux")
		echo 'Installing with pacman...'
		sudo pacman -S neovim tmux
		;;
		
	"Ubuntu")
		echo 'Installing with apt...'
		sudo apt install neovim tmux
		;;

	*)
		echo 'OS not supported by the script.'
		echo 'Exiting'
		exit
		;;
esac

echo 'Done!'

