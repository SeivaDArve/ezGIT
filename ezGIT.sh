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
function f_cor4 { 
   tput setaf 4
}
function f_resetCor { 
   tput sgr0
}

function f_greet {
   f_cor4
   figlet "ezGIT" 2>/dev/null || echo -n
   f_resetCor 
}

function f_colors-without-tput {
	# Text Colors before discovering '$ tput setaf'
	   _RED=$(echo -en '\001\033[00;31m\002')
	   _RESTORE=$(echo -en '\001\033[0m\002')

	# Text formating before discovering '$ tput'
	   #echo ${_RED}To do something, specify an argument like \"G 2\"${_RESTORE}
}

# ---------------------------------------------



if [ -z $@ ]; then
   # Do something else if there are no arguments
      echo " > No arguments where given"
      sleep 1
      echo " > Here is a list of arguments you may use:"
      f_cor1; echo -n "   $ G "; f_cor2; echo -n "1"; f_resetCor; echo "  (It means \"git pull\")"
less << heredooc

ezGIT------------ git menu --------- page 1

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
G S  | Stop and Clear the screen from this menu
-------------------------------------------
G m1 | goto menu 1
G m2 | goto menu 2

Example: To do something, specify an argument like "G 2"
heredooc


elif [ $1 == "eg" ]; then
   # Do something if arg 1 is equal to "eg":
      echo "you don\'t need to source G.sh at the file \"source-all-drya-files\""
      echo "Start using if conditions instead"

elif [ $1 == "k" ] || [ $1 == "gkp" ]; then
   # Create a file .gitkeep
      touch .gitkeep

elif [ $1 == "f" ] || [ $1 == "gfv" ]; then
	# List favorite git commands
		clear
		echo -e "Favorits menu\n" 
		echo -e "git status \ngit reset  #To unstage files \ngit rebase -i HEAD~2 && reword  #To change old commit messages"

elif [ $1 == "." ] || [ $1 == "gst" ]; then
   # Git status

   clear; f_greet 

      f_cor4
      echo -e "\ngit status:"
      f_resetCor
      git status

elif [ $1 == "ad" ]; then
   # Git add ...

   clear; f_greet 

      git status
      f_cor4
      echo -ne "\ngit add "
      f_resetCor
      echo "<your option here>"
      git add $2
      git status

elif [ $1 == "cm" ]; then
   # Git commit ...

   clear; f_greet 

      git status
      f_cor4
      echo -ne "\ngit commit "
      f_resetCor
      echo "<your option here>"
      read v_ans
      git commit -m "$v_ans"
      git status





elif [ $1 == "multi" ]; then
   # Git commit multiple messages

   clear; f_greet 

      git status
      f_cor4
      echo -e "\ngit commit multiple messages"
      f_resetCor
      echo 
      declare -a messages
      declare n=1
      while true; do
         read -p "Insert commit n.$n: " v_ans

         if [[ $v_ans == "done" ]]; then
            break
         fi
         messages+=$v_ans

         for i in ${messages[@]}; do
            echo -e "$i\n"
         done
         ((n=n+1))
      done




elif [ $1 == "++" ] || [ $1 == "g-ad-cm-m" ]; then
	# 'git add --all' + 'git status' + 'git commim -m "" '
   # Almost Equivalent to 'G 7'

      clear
      f_greet

      # Git add --all
			f_cor4
			echo "git add --all"
			f_resetCor
			git add --all

      # Git status
			f_cor4
			echo -e "git status:\n"
			f_resetCor
         git status

      # Git commit -m ""
			f_cor4
			echo -e "Creating a message i to git commit -m \"i\":"
			f_resetCor

			echo -en "In order to commit to git, what is your commit message?\n > "
			read _ans
         echo

			f_cor4
			echo -en "git commit -m \""
			tput setaf 4
			echo -en "${_ans}"
			f_cor4
			echo -e "\""
			f_resetCor
			git commit -m "$_ans"

      # Git status
			f_cor4
			echo -e "\ngit status:"
			f_resetCor
			git status

      # Asking for 3 seconds if the user wants to push the code to github.com
			f_cor4
			echo -e "\nDo you want to push to Guthub.com?"
			f_resetCor
         echo -n " > If so, press: "
			f_cor4
			read -s -N 1 -t 5 -p "P " v_ans
			f_resetCor
         
         case $v_ans in
            P)
                # Display text based cresential while app is in beta
                   echo
                   echo -e "\nInside the ezGIT app I found this: "
                   f_cor4
                   echo -n "seivadarve"; f_resetCor; echo " and this:"; f_cor4;
                   echo "ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
                   f_resetCor

                   git push

                # Git status one last time
                  f_cor4
                  echo -e "\ngit status:"
                  f_resetCor
                  git status

            ;;
            *)
               echo
            ;;
         esac











elif [ $1 == "+" ] || [ $1 == "g-ad-cm-m" ]; then
	# 'git add --all' + 'git status' + 'git commim -m "" '
   # Almost Equivalent to 'G 7'

      clear
      f_greet

      # Git add <file>
			f_cor4
			echo "git add <insert file>"
			f_resetCor
			git add $2

      # Git status
			f_cor4
			echo -e "git status:\n"
			f_resetCor
         git status

      # Git commit -m ""
			f_cor4
			echo -e "Creating a message i to git commit -m \"i\":"
			f_resetCor

			echo -en "In order to commit to git, what is your commit message?\n > "
			read _ans
         echo

			f_cor4
			echo -en "git commit -m \""
			tput setaf 4
			echo -en "${_ans}"
			f_cor4
			echo -e "\""
			f_resetCor
			git commit -m "$_ans"

      # Git status
			f_cor4
			echo -e "\ngit status:"
			f_resetCor
			git status










elif [ $1 == "+++" ] || [ $1 == "g-ad-cm-m-pu" ]; then
	# 'git add --all' + 'git commim -m "" ' + 'git push'
		clear
		echo "git add --all"
      echo "git commit -m"
      echo "git push"
      echo "#uDev: not ready yet"














else
   # If the arguments you input are neither empty nor listed, then run:
      echo "doing something if option does not exist"
fi


#uDev: You may start deleting "case" and "esac" and adding 'if [ $1 == "K" ]; then' because it is better to create menus
#uDev: add an option for: "mkdir" + "touch .gitkeep"
#uDev: add: "alias "G (*)"="git stash"' and 'alias "G )*("="git unstash"'








# ---------------------------------------------



function setGlobalConfig_menu {

		#This will be a menu soon that can list, edit, remove... to set as global configs. For example the configurations for SeivaDArve"

		# Inform that this menu is under construction:
		echo -e "$(f_cor4)\n  menu under construction;)\n${RESTORE}"; read; G

		# Entry to adjust Seiva D'Arve:
		#git config --global user.email "flowreshe.seiva.d.arve@gmail.com"
		#git config --global user.name "SeivaDArve"	
}



# How to use:
# One way to use this app without installing it at "/bin" is to navigate to this directory where G.sh is located and execute "source G.sh". This way all functions inside itself is loaded into do $PATH variable

#G () {

	# In order to use ezGIT, one way is to navigate to it's dir and from there
	# You could type "source ezGIT". This method only works for that terminal
	# instance and will be unavailable after you close the terminal. So, you
	# could also add "source <relative path/ezGIT>" to your .bashrc 

	# stroken location at your Butler's Pocket (jarve-pocket in my case)
	_stroken="/data/data/com.termux/files/home/home.home/Repositories/jarve/stroken"



	case $1 in
		-R) # Check recursively all dirs and see their git status 
			;;
		0) # Option: git status
         #gst
			f_cor4
			echo -e "git status:\n"
			f_resetCor
			git status
			;;
		0+) # Option: git status && git remote show origin
         #gst+
			f_cor4
			echo -e "git status:\n"
			f_resetCor
			git status

			f_cor4
			echo -e "\ngit remote show origin:"
			f_resetCor
			git remote show origin

			;;
		1) # Option: git pull
         #gpl
			f_cor4
			echo "git pull:"
			f_resetCor
			git pull 
			;;
		2) # Option: git push
         #gpu
			f_cor4
			echo "git push:"
			f_resetCor
			git push

			;;


		3) # Option: git add .
         #gad.
			f_resetCor
			f_cor4
			echo "git add ."
			f_resetCor
			git add .
			;;
		4) # Option: git add --all
         #gad*
			echo -n "git add --all"
			tput setaf 4
			echo -n "?"
			f_resetCor
			read
			tput setaf 4
			echo -n "git add --all"
			f_resetCor
			echo ":"
			git add --all
			f_cor4
			echo "git add --all"
			f_resetCor
			;;
		5) # Option: git commit -m '...'
			f_cor4
			echo -en "git commit -m \"...\""
			f_resetCor
			echo ":"
			echo -en "In order to commit to git, what is your commit message?\n > "
			read _ans

			f_cor4
			echo -en "git commit -m \""
			tput setaf 4
			echo -en "${_ans}"
			f_cor4
			echo -e "\""
			f_resetCor

			git commit -m "$_ans"
			;;
		+) # Stages a file
			# Alias to "git add ..."
			# uDev: lacks colored text
			# uDev: "git add " as an alias gad="git add " ## uDev: Put this into menu 2
			git add $2


         #uDev: case $2 in
         #        \*)
         #
         #           # Command:
         #           # '$ G + *'
         #
         #           # Same as:
         #           git add *
         #
         #           # Same as:
         #           "git add --all"
         #
         #         ;;
         #           
			;;
		-) # unStages a file
			# uDev: lacks colored text

			f_cor4
			echo -en "git reset "
			tput setaf 4
			echo -e "$2"
			f_cor4
			#echo -e "\""
			f_resetCor

			git reset $2
			;;
		6) # Option: git add . && git commit -m '...'
			# Dev: lacks colored text
			f_cor4
			echo "git add ."
			f_resetCor
			git add . 

			echo -en "\nIn order to commit to git, what is your commit message?\n > "
			read _ans
			git commit -m "$_ans"
			;;
		7) # Option: git add --all && git commit -m '...' && git status
			f_cor4
			echo "git add --all"
			f_resetCor
			git add --all

			echo -en "\nIn order to commit to git, what is your commit message?\n > "
			read _ans

			f_cor4
			echo -en "git commit -m \""
			tput setaf 4
			echo -en "${_ans}"
			f_cor4
			echo -e "\""
			f_resetCor
			git commit -m "$_ans"

			f_cor4
			echo -e "\n\ngit status\n\n"
			f_resetCor
			git status
			;;
		8) # Option: git log
			f_cor4
			echo "git log"
			f_resetCor
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
	 f_cor4
	 echo -n "seivadarve"; f_resetCor; echo " and this:"; f_cor4;
	 echo "ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
	 f_resetCor

	 git push

	 echo ""
	 f_cor4
	 echo "git status:"
	 f_resetCor
	 git status

	 ;;
 A) # Option: "menu to set global configuration for the user"
	 setGlobalConfig_menu
	 ;;
 C) # Configure git manually with vim
	 f_cor4
	 echo -e "\nIf your email is not configured properly, your commits won't show in your github.com's contribution graph"
	 echo " > Type any key to continue... "
	 f_resetCor
	 read

	 if [ -f ./users/set-SeivaDArve.sh ]
	 	then
	 		f_cor4
	 		echo -e "there is a file set-seivadarve.sh"
	 		echo -e "To configure this profile, type \"seiva\""
	 		echo -e "To configure ~/.gitconfig manually type \"manl\""
			echo ""
			echo -e "To display ~/.gitconfig type \"list\""
	 		f_resetCor
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
			echo -e "$(f_cor4)\n  menu under construction;)\n${RESTORE}"; read; G

			;;
		m2) # Option: Menu 2

			# Inform that this menu is under construction:
			echo -e "$(f_cor4)\n  menu under construction;)\n${RESTORE}"; read; G
			;;
		S) # Option: Stop and Clear the screen from this menu

			clear
			f_cor4
			echo "clear"
			f_resetCor
			;;
		*) # If you type an incorrect option OR if you type nothing, the menu is displayed (this is not a bug)
      ;;
	esac

#}
