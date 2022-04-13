#!/bin/bash
# Title: ezGIT to replace long git commands for one simple and short command
G () {

	# In order to use easyGIT, one way is to navigate to it's dir and from there
	# You could type "source easyGIT". This method only works for that terminal
	# instance and will be unavailable after you close the terminal. So, you
	# could also add "source <relative path/easyGIT>" to your .bashrc 
	
	# stroken location at your Butler's Pocket (jarve-pocket in my case)
	_stroken="/data/data/com.termux/files/home/home.home/repositories/jarve/stroken"

	# Text Colors
	_RED=$(echo -en '\001\033[00;31m\002')
	_RESTORE=$(echo -en '\001\033[0m\002')

	function setGlobalConfig_menu {

		#This will be a menu soon that can list, edit, remove... to set as global configs. For example the configurations for SeivaDArve"

		# Inform that this menu is under construction:
		echo -e "$(tput setaf 3)\n  menu under construction;)\n${RESTORE}"; read; G

		# Entry to adjust Seiva D'Arve:
		#git config --global user.email "flowreshe.seiva.d.arve@gmail.com"
		#git config --global user.name "SeivaDArve"
	}

	case $1 in
		F) echo "Favorits menu" ;;
		0) # Option: git status && git remote show origin
			tput setaf 3
			echo -e "git status\n"
			tput sgr0
			git status

			tput setaf 3
			echo -e "\ngit remote show origin"
			tput sgr0
			git remote show origin

		;;
		1) # Option: git pull
			tput setaf 3
			echo "git pull"; tput sgr0
			git pull 
		;;
		2) # Option: git push

			tput setaf 3
			echo "git push"
			tput sgr0
			git push

		;;
		3) # Option: git add .
			tput sgr0
			tput setaf 3
			echo "git add ."
			tput sgr0
			git add .
		;;
		4) # Option: git add --all
			tput setaf 3
			echo "git add --all"
			tput sgr0
			git add --all
		;;
		5) # Option: git commit -m "..."
			echo "In order to commit to git, what is your commit message?"
			read _ans
			git commit -m "$_ans"
		;;
		6) # Option: git add . && git commit -m "..."
			tput setaf 3
			echo "git add ."
			tput sgr0
			git add . 

			echo "In order to commit to git, what is your commit message?"
			read _ans
			git commit -m "$_ans"
		;;
		7) # Option: git add --all && git commit -m "..." && git status
			tput setaf 3
			echo "git add --all"
			tput sgr0
			git add --all

			echo "In order to commit to git, what is your commit message?"
			read _ans
			git commit -m "$_ans"

			tput setaf 3
			echo -e "\n\ngit status\n\n"
			tput sgr0
			git status
		;;
		8) # Option: git log
			tput setaf 3
			echo "git log"
			tput sgr0
			git log
		;;
		9) # Option: cat stroken && git push
			# If you try to cat this file and it does not exist, it should mean DRYa is not installed and it should display a message TO INSTALL DRYa, so yes, easyGIT can should be able to call DRYa into de business; BTW, drya is meant to be holistic first and only then it should fit you. So in the end, easyGIT calls DRYa in order for it to call your PERSONAL credentials, it means it should read from your 'Butler-Pocket'. In my case (username: Dv) my butler is jarve, so drya would get information from my jarve-Pocket to fit me, Dv
			cat ${_stroken}
			echo "Inside the easyGIT app I found this: ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
			git push

		;;
		A) # Option: "menu to set global configuration for the user"
			setGlobalConfig_menu
		;;
		m1) # Option: Menu 1

			# Inform that this menu is under construction:
			echo -e "$(tput setaf 3)\n  menu under construction;)\n${RESTORE}"; read; G

		;;
		m2) # Option: Menu 2

			# Inform that this menu is under construction:
			echo -e "$(tput setaf 3)\n  menu under construction;)\n${RESTORE}"; read; G
		;;
		S) # Option: Stop and Clear the screen from this menu

			clear
			tput setaf 3
			echo "clear"
			tput sgr0
		;;
		*) # If you type an incorrect option OR if you type nothing, the menu is displayed (this is not a bug)

			clear
			tput setaf 3; echo "ezGIT       (type "G" to display this menu)"; tput sgr0

			cat << heredoc
------------ git menu - page 1 ------------
F) Favourites
0) git status
1) git pull
2) git push
3) git add .
4) git add --all
5) git commit "..."

6) git add .      &&  git commit -m "..."
7) git add --all  &&  git commit -m "..."

8) git log
9) cat stroken && git push

A) menu to set global configurations for the user
-------------------------------------------
m1) goto menu 1
m2) goto menu 2

heredoc
			echo -e "S) Stop and Clear the screen from this menu\n"
			echo ${_RED}To do something, specify an argument like \"G 2\"${_RESTORE}
		;;

	esac

}
G
