#!/bin/bash
# Title: ezGIT to replace long git commands for one simple and short command


# ---------------------------------------------

function f_cor1 {
	tput setaf 5
}

function f_cor2 {
	tput setaf 6
}

function f_cor3 {
	tput setaf 8
}

function f_resetCor {
	tput sgr0
}

# ---------------------------------------------



if [ -z $@ ]; then
   # Do something else if there are no arguments
      echo " > No arguments where given"
      sleep 1
      echo " > Here is a list of arguments you may use:"
      f_cor1; echo -n "   $ G "; f_cor2; echo -n "1"; f_resetCor; echo "  (It means \"git pull\")"


elif [ $1 == "K" ]
   # Do something if arg 1 is equal to "K":
   then
      echo "you don\'t need to source G.sh at the file \"source-all-drya-files\""
      echo "Start using if conditions instead"
else
   # If the arguments you input are neither empty nor listed, then run:
      echo "doing something if option does not exist"
fi


#uDev: You may start deleting "case" and "esac" and adding 'if [ $1 == "K" ]; then' because it is better to create menus











# ---------------------------------------------






# How to use:
# One way to use this app without installing it at "/bin" is to navigate to this directory where G.sh is located and execute "source G.sh". This way all functions inside itself is loaded into do $PATH variable

G () {

	# In order to use ezGIT, one way is to navigate to it's dir and from there
	# You could type "source ezGIT". This method only works for that terminal
	# instance and will be unavailable after you close the terminal. So, you
	# could also add "source <relative path/ezGIT>" to your .bashrc 

	# stroken location at your Butler's Pocket (jarve-pocket in my case)
	_stroken="/data/data/com.termux/files/home/home.home/Repositories/jarve/stroken"

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
		F) # List git commands
			clear
			echo -e "Favorits menu\n" 
			echo -e "git status \ngit reset  #To unstage files \ngit rebase -i HEAD~2 && reword  #To change old commit messages"

			;;
		-R) # Check recursively all dirs and see their git status 
			;;
		0) # Option: git status
			tput setaf 3
			echo -e "git status:\n"
			tput sgr0
			git status
			;;
		0+) # Option: git status && git remote show origin
			tput setaf 3
			echo -e "git status:\n"
			tput sgr0
			git status

			tput setaf 3
			echo -e "\ngit remote show origin:"
			tput sgr0
			git remote show origin

			;;
		1) # Option: git pull
			tput setaf 3
			echo "git pull:"
			tput sgr0
			git pull 
			;;
		2) # Option: git push

			tput setaf 3
			echo "git push:"
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
			echo -n "git add --all"
			tput setaf 4
			echo -n "?"
			tput sgr0
			read
			tput setaf 4
			echo -n "git add --all"
			tput sgr0
			echo ":"
			git add --all
			tput setaf 3
			echo "git add --all"
			tput sgr0
			;;
		5) # Option: git commit -m '...'
			tput setaf 3
			echo -en "git commit -m \"...\""
			tput sgr0
			echo ":"
			echo -en "In order to commit to git, what is your commit message?\n > "
			read _ans

			tput setaf 3
			echo -en "git commit -m \""
			tput setaf 4
			echo -en "${_ans}"
			tput setaf 3
			echo -e "\""
			tput sgr0

			git commit -m "$_ans"
			;;
		+) # Stages a file
			# Alias to "git add ..."
			# uDev: lacks colored text
			# uDev: "git add " as an alias gad="git add " ## uDev: Put this into menu 2
			git add $2
			;;
		-) # unStages a file
			# uDev: lacks colored text

			tput setaf 3
			echo -en "git reset "
			tput setaf 4
			echo -e "$2"
			tput setaf 3
			#echo -e "\""
			tput sgr0

			git reset $2
			;;
		6) # Option: git add . && git commit -m '...'
			# Dev: lacks colored text
			tput setaf 3
			echo "git add ."
			tput sgr0
			git add . 

			echo -en "\nIn order to commit to git, what is your commit message?\n > "
			read _ans
			git commit -m "$_ans"
			;;
		7) # Option: git add --all && git commit -m '...' && git status
			tput setaf 3
			echo "git add --all"
			tput sgr0
			git add --all

			echo -en "\nIn order to commit to git, what is your commit message?\n > "
			read _ans

			tput setaf 3
			echo -en "git commit -m \""
			tput setaf 4
			echo -en "${_ans}"
			tput setaf 3
			echo -e "\""
			tput sgr0
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
		9) # Option: cat stroken && git push && git status
			# uDev: lacks colored text
			echo "ezGIT: continue with: \"cat stroken && git push\" ?"
			echo "   yes = [ENTER] || no = [Ctrl+C]"; read  ##uDev: add a message like these for each one. Make it a function

			# If you try to cat this file and it does not exist, it should mean DRYa is not installed and it should display a message TO INSTALL DRYa, so yes, ezGIT can should be able to call DRYa into de business; BTW, drya is meant to be holistic first and only then it should fit you. So in the end, ezGIT calls DRYa in order for it to call your PERSONAL credentials, it means it should read from your 'Butler-Pocket'. In my case (username: Dv) my butler is jarve, so drya would get information from my jarve-Pocket to fit me, Dv
			cat ${_stroken}

	 # Display text based cresential while app is in beta
	 echo -e "\nInside the ezGIT app I found this: "
	 tput setaf 3
	 echo -n "seivadarve"; tput sgr0; echo " and this:"; tput setaf 3;
	 echo "ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
	 tput sgr0

	 git push

	 echo ""
	 tput setaf 3
	 echo "git status:"
	 tput sgr0
	 git status

	 ;;
 A) # Option: "menu to set global configuration for the user"
	 setGlobalConfig_menu
	 ;;
 C) # Configure git manually with vim
	 tput setaf 3
	 echo -e "\nIf your email is not configured properly, your commits won't show in your github.com's contribution graph"
	 echo " > Type any key to continue... "
	 tput sgr0
	 read

	 if [ -f ./users/set-SeivaDArve.sh ]
	 	then
	 		tput setaf 3
	 		echo -e "there is a file set-seivadarve.sh"
	 		echo -e "To configure this profile, type \"seiva\""
	 		echo -e "To configure ~/.gitconfig manually type \"manl\""
			echo ""
			echo -e "To display ~/.gitconfig type \"list\""
	 		tput sgr0
	 		read _ans

				if [ $_ans == "seiva" ]
				then
					bash ./users/set-SeivaDArve.sh
					echo " > done"
				elif [ $_ans == "manl" ]
				then
	 				vim ~/.gitconfig
					echo " > done"
				elif [ $_ans == "list" ]
				then
					cat ~/.gitconfig
				else
					echo " > You did not type any specific option therefore, not doing anything"
				fi

		else
	 		vim ~/.gitconfig
	 fi
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
			tput setaf 3; echo "ezGIT       (type \"G\" to display this menu)"; tput sgr0

			cat << heredoc
------------ git menu - page 1 ------------

RECOGNIZE REPOSITORY: OFF

G    | Displays this menu
G F  | Favourites
G 0  | git status
G 0+ | git status && git show origin
G 1  | git pull
G 2  | git push
G 3  | git add .
G 4  | git add --all
G 5  | git commit -m '...'

G +  | gad | "git add ..."    (stages a file)
G -  |       "git reset ..."  (unStages a file)

G 6  | git add .      &&  git commit -m '...'
G 7  | git add --all  &&  git commit -m '...'

G 8  | git log
G 9  | cat stroken && git push && git status

G A  | menu to set global configurations for the user
G C  | Configure git manually with vim (under construction) 
-------------------------------------------
G m1 | goto menu 1
G m2 | goto menu 2

heredoc
echo -e "G S) Stop and Clear the screen from this menu\n"

			# Text formating before discovering tput:
			#echo ${_RED}To do something, specify an argument like \"G 2\"${_RESTORE}

			tput setaf 3
			echo "Example:"
			echo "To do something, specify an argument like \"G 2\""
			tput sgr0
			;;

		esac

	}
