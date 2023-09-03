#!/bin/bash
# Title: ezGIT to replace long git commands for one simple and short command
# Use: bully pages: man pages but for developers

# uDev: Do not allow this software to run without the proper file ~/.gitconfig
   # if [ -z ~/.gitconfig ]; then echo "ezGIT: Please configure ~/.gitconfig first with the command X"; exit 1; fi
   # uDev: add info on how to install our dot. Add info on how to run this script anyways without such config instaled

declare v_repo="ezGIT"

function f_cor1 {	
   # For figlet titles
   tput setaf 5 
}
function f_cor2 { 
   tput setaf 2 
}
function f_cor3 { 
   # Mentioning user input or valiable input
   tput setaf 3
}
function f_cor4 { 
   # Similar to Bold
   tput setaf 4
}
function f_resetCor { 
   tput sgr0
}

function f_greet {
   f_cor4
   figlet "ezGIT" || echo -e "( ezGIT )\n"
   f_resetCor 
}

function f_stroken {
    # Display text based credential while app is in beta
       echo -e "\nInside the ezGIT app I found this: "
       f_cor4
       echo -n "seivadarve"; f_resetCor; echo " and this:"; f_cor4;
       echo "ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
       f_resetCor
}

function f_find_basename {
   v_relPWD=$(pwd)
   echo $v_relPWD
   v_relRepo=$(echo $v_relPWD | sed 's/"$v_REPOS_CENTER"//g')
   echo $v_relRepo
   cut -d '/' -f 1 $v_relRepo
      
   # uDev: can be changed by the command 'basename'
}

function setGlobalConfig_menu {
   # Confir everytime if .gitconfig is configured
   # Can also be called by a command

   # Display thr intention of this function
      echo "ezGIT: Function meant to configure git file"
      echo "   # uDev: if file does not exist, display this message"

#
#		# Inform that this menu is under construction:
#		echo -e "$(f_cor4)\n  menu under construction;)\n${RESTORE}"; read; G
#
#      v_whoami=$(whoami)
#		# Entry to adjust Seiva D'Arve:
#		#git config --global user.email "flowreshe.seiva.d.arve@gmail.com"
#		#git config --global user.name "SeivaDArve"	
#
#
#
# C) # Configure git manually with vim
#	 f_cor4
#	 echo -e "\nIf your email is not configured properly, your commits won't show in your github.com's contribution graph"
#	 echo " > Type any key to continue... "
#	 f_resetCor
#	 read
#
#	 if [ -f ./users/set-SeivaDArve.sh ]
#	 	then
#	 		f_cor4
#	 		echo -e "there is a file set-seivadarve.sh"
#	 		echo -e "To configure this profile, type \"seiva\""
#	 		echo -e "To configure ~/.gitconfig manually type \"manl\""
#			echo ""
#			echo -e "To display ~/.gitconfig type \"list\""
#	 		f_resetCor
#	 		read _ans
#
#				if [ $_ans == "seiva" ]
#				then
#					bash ./users/set-SeivaDArve.sh
#					echo " > done"
#				elif [ $_ans == "manl" ]
#				then
#	 				vim ~/.gitconfig
#					echo " > done"
#				elif [ $_ans == "list" ]
#				then
#					cat ~/.gitconfig
#				else
#					echo " > You did not type any specific option therefore, not doing anything"
#				fi
#
#		else
#	 		vim ~/.gitconfig
#	 fi
#	 ;;

}


function f_git_pull_dot_files {
   echo "ezGIT: git pull and install: dot-files"
   echo " > (files stored at repo: drya)"
   echo " > cd drya; git pull; cp .../filss .../places"
}


function f_colors-without-tput {
	# Text Colors before discovering '$ tput setaf'
	   _RED=$(echo -en '\001\033[00;31m\002')
	   _RESTORE=$(echo -en '\001\033[0m\002')

	# Text formating before discovering '$ tput'
	   #echo ${_RED}To do something, specify an argument like \"G 2\"${_RESTORE}
}

function f_underscore_creator {
   # At every 'select' menu, I want the first 
      # and last option of the menu to be an
      # horizontal split.
      # If there was no nested loops, there was no need
      # for these. Another reasob to create these horizontal
      # split lines, is force the menu to be vertical 
   # I want the last line of the menu to be all dashes
      # That forces the menu to be vertical always
      # For that, I will count hoe many lines does the
      # terminal has, store that into a variable v_cols
      # and insert it into the menu

         v_cols="$COLUMNS"
         let "v_count = $v_cols - 5"
            #echo -e "There are currently $v_cols columns in the screen \n and from that number, $v_count is the\n number of dashes '-' that the menu will have "
            #read

         # You may choose the apropriate symbol here
            v_underscore="-"

         # Store in a var, how many dashes can be replaced by empty spaces (according to the specific amount of available columns)
            v_underscoreCount=""

            for i in $(seq $v_count); do 
               v_underscoreCount="$v_underscoreCount$v_underscore"
            done

         # The result is an horizontal line
            #echo "var is $v_underscoreCount"
            #read
            v_line=$v_underscoreCount
}


function f_git_pull-recursive {
   # bully-pages: script to give git status of ALL repos

      clear

      f_greet
      f_cor3
      echo -e "Trying \"git pull\" at: \n${v_REPOS_CENTER}\n"
      f_resetCor

      function f_output {
         f_horizontal_line
         f_cor4
         echo -n " > Repository: "
         f_cor3
         echo "$i"
         echo
         f_resetCor
         git status
      }

      # Mention one possible password
         f_stroken
         echo

      cd ${v_REPOS_CENTER}
      for i in $(ls); do 
         # Filter directories from files
            g=$(file $i)

         # If the variable g returns a directory, we navigate into it
            if [[ $g =~ "dir" ]]; then 
               cd $i
               
         # Echo out what Repo is being mentioned
            basename $(pwd)

         # Saving the git status into a variable without outputing it to the screen
            # It sends an error if dir is not repository. Therefore we send Sandard error do /dev/null
            s=$(git pull 2>/dev/null) 

         #  # Search for git words that indicate work yo be done
         #     # uDev: there must be more words, therefore this function must be tested
         #     if [[ $s =~ "added" ]]; then f_output;
         #        elif [[ $s =~ "Changes" ]]; then f_output;
         #        elif [[ $s =~ "Untracked" ]]; then f_output;
         #     fi

            cd ..
         fi
         
      done

   # Display a message to indicat it is finished:
      # uDev: lacks color
      f_horizontal_line
      echo "git pull to all repos under:"
      echo " > $v_REPOS_CENTER"
      echo "Finished!"
      f_horizontal_line
}
function f_git_status-recursive {
   # bully-pages: script to give git status of ALL repos

      clear

      f_greet
      f_cor3
      echo -e "Searching for \"git status\" at: \n${v_REPOS_CENTER}\n"
      f_resetCor

      function f_output {
         f_horizontal_line
         f_cor4
         echo -n " > Repository: "
         f_cor3
         echo "$i"
         echo
         f_resetCor
         git status
      }

      cd ${v_REPOS_CENTER}
      for i in $(ls); do 
         # Filter directories from files
            g=$(file $i)

         # If the variable g returns a directory, we navigate into it
            if [[ $g =~ "dir" ]]; then 
               cd $i
               

         # Saving the git status into a variable without outputing it to the screen
            # It sends an error if dir is not repository. Therefore we send Sandard error do /dev/null
            s=$(git status 2>/dev/null) 

         # Search for git words that indicate work yo be done
            # uDev: there must be more words, therefore this function must be tested
            if [[ $s =~ "added" ]]; then f_output;
               elif [[ $s =~ "Changes" ]]; then f_output;
               elif [[ $s =~ "Untracked" ]]; then f_output;
            fi

            cd ..
         fi
         
      done

   # Display a message to indicat it is finished:
      # uDev: lacks color
      f_horizontal_line
      echo "git status to all repos under:"
      echo " > $v_REPOS_CENTER"
      echo "Finished!"
      f_horizontal_line
}

function f_horizontal_line {
   # This function calculates the amount of line present in the terminal window for the current zoom and creates an horizontal line across the screen

         v_count="$COLUMNS"
            #echo -e "There are currently $v_cols columns in the screen \n and from that number, $v_count is the\n number of dashes '-' that the menu will have "
            #read

         # You may choose the apropriate symbol here
            v_underscore="-"

         # Store in a var, how many dashes can be replaced by empty spaces (according to the specific amount of available columns)
            v_underscoreCount=""

            for e in $(seq $v_count); do 
               v_underscoreCount="$v_underscoreCount$v_underscore"
            done

         # The result is an horizontal line
            #echo "var is $v_underscoreCount"
            #read
            v_line=$v_underscoreCount
            echo $v_underscoreCount
}

function f_tell_repo_name { 
   # Function to simply tell what the repository's name is
   
   # Utility 1:
      # If a specific list of repositories are found, ezGIT will deny the push before encryption
   
   # Get the current directory name
      v_name=$(basename $(pwd))
      #echo $v_name

   # Test if basename is on blacklist or not (There are repositories that have to be encrypted everytime before pushing to github)
      if [[ $v_name == "ezGIT" ]]; then
         # $v_name is on blacklist
         echo "Repo may contain encryptions"
         v_blackList=1
      elif [[ $v_name == "dWiki" ]]; then
         # $v_name is on blacklist
         echo "Repo may contain encryptions"
         v_blackList=1
      else 
         # $v_name is not on blacklist
         echo "Repo does not contain encryptions"
         v_blackList=0
      fi

      # uDev: in the future: Creating an external text file to describe all blaklist repos would be better that hard coding them here

   # Find a .git directory inside our current dir location´
      v_git_dir=$(find . -maxdepth 1 -name .git)

      if [[ -z $v_git_dir ]]; then 
         # If dir .git in not found:
         echo -n "The directory "
         f_cor4
         echo -n "$v_name "
         f_cor3
         echo -n "is not "
         f_resetCor
         echo "a repository"

      elif [[ $v_git_dir == "./.git" ]] # && basename is on blacklist: test if it's decripted directory is empty
         then 
         # If at our location ./ a dire called .git is found:
         echo -n "The directory "
         f_cor4
         echo -n "$v_name "
         f_cor3
         echo -n "is "
         f_resetCor
         echo "a repository"
      fi 
}

# uDev: Check at every run if email and username exist and are configured according a personal database of emails and usernames
	# Without a proper email, github will not count your commits for their graph of your activity

# uDev: if the chosen repo to 'git push' is a repo that is usually encripted, do not allow to push before using encryption

# uDev: Instead of creating repos at github.com, then clone, then use: instead, create a function with git init and then push to the remote

function f_heredoc {
   # Describes all finctionality
   # uDev: the BEST documentation happens if you can open the source code and read it
      # Therefore: uDev: Create a grep function to grep all 'if [' and 'elif' in this document and along with that, search one more line below with the comment that tells what that function does

f_horizontal_line

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

(Quit this page with the key: Q)

heredooc
}

function f_curl_uploads_count {

   # Description: Counts how many uploads were made to GitHub.com

   echo "ezGIT: uploads counter"

   function f_get_day {
      # Gets the desired day for web scraping the github's profile page

      # Day

      echo "type the day number OR leave empty for today"
      echo -n " > "
      read v_day
      
      if [[ -z $v_day ]]; then # if no argument is given, then:
         v_day2=$(date +%d)

         # If v_day is less than 10, there is a problem:
         #
         # When web scraping github.com, we notice 
         # that it's output not matching the output if the 
         # command '$ date'
         # 
         # curl + grep OUTPUT: February 8
         # date OUTPUT: February 08
         #
         # Therefore, for day numbers under 10, we must
         # remove the prefix zero '0'
         #
         # '$ curl' OUTPUT must be: February 8
         # '$ date' OUTPUT must be: February 8
         #

         # Cutting the '0' from the number:
            # If day < 10
               if [[ $v_day2 < 10 ]]; then
                  f=$(echo $v_day2 | cut -d "0" -f 2)
                  v_day2=$f
               fi

            # If day =< 10; then do nothing because it matches github webpage and such number is ready for webscraping




      elif [[ ! -z $v_day ]]; then 
         # ^ If any argument was given, use that arg for webscraping
            v_day2=$v_day

         # Due to the fact the user can input invalid numbers, lets test the number:
            # uDev
      fi

      # Testing if variable $v_day2 is ready to be used for web scraping
         echo "result day: $v_day2"

         v_day=$v_day2
   }

   function f_get_month {
      #echo "# uDev: type the month number OR leave empty for this month"
      v_month2=$(date +%B)
      echo "result month: $v_month2"
      #read v_month

      v_month=$v_month2
   }

   function f_get_year {
      #echo "type the year number OR leave empty for this year"
      #echo -n " > "
      #read v_year
      v_year=2023
      echo "result year: $v_year"
   }

   f_get_day
   f_get_month
   f_get_year

   echo

   # echo "Curl test: $v_day $v_month"
   #curl -s https://github.com/SeivaDArve | grep "contributions on $v_month $v_day, 2023" | cut -d ">" -f 2 | cut -d "<" -f 1
   curl -s https://github.com/SeivaDArve | grep "contributions on " | cut -d ">" -f 2 | cut -d "<" -f 1 | grep Feb | grep " $v_day" | grep "$v_year"
   echo 
   echo "uDev: Bugs: Some days may not give any output, but may have uploads" 
   echo "uDev: While bug is not fixed: Check the source graph at: "
   echo " > https://github.com/SeivaDArve"
}






#  ^^ Functions to be called by G arguments
#  vv Arguments to be called by G itself and command line










# Before evaluating ezGIT arguments, check if git is configured properly
   #setGlobalConfig_menu  #uDev
   
if [ -z "$*" ]; then
   # Do something else if there are no arguments
      echo "ezGIT: No arguments were given"
      echo " > An old list of arguments is going to be given (old, uDev):"
      echo
      echo "uDev: when no args are given, show git config info for this device"
      echo
      sleep 1
      f_cor1; echo -n "   $ G "; f_cor2; echo -n "1"; f_resetCor; echo "  (It means \"git pull\")"

      f_heredoc

elif [ $1 == "eg" ]; then
   # Do something if arg 1 is equal to "eg":
      echo "you don\'t need to source G.sh at the file \"source-all-drya-files\""
      echo "Start using if conditions instead"

elif [ $1 == "config" ]; then
   # Confirming that configurations exist
      echo "Opening file of configurations for git with vim editor"
      read -s
      echo 
      echo "Example of content inside ~/.gitconfig file:"
      echo "[user]"
      echo "      name = seivadarve"
      echo "      email = flowreshe.seiva.d.arve@gmail.com"
      read -s -n 1
      vim ~/.gitconfig
      # uDev: Create a file at ~/.config/h.h/ezGIT/ with data from "uname -a"

elif [ $1 == "alias" ]; then
      vim ${v_REPOS_CENTER}/ezGIT/all/etc/config-bash-alias

elif [ $1 == "k" ] || [ $1 == "gkp" ] || [ $1 == "kp" ]; then
   # Create a file .gitkeep
      touch .gitkeep
      echo "ezGIT: file .gitkeep was created"

elif [ $1 == "f" ] || [ $1 == "gfv" ]; then
	# List favorite git commands
		clear
		echo -e "Favorits menu\n" 
		echo -e "git status \ngit reset  #To unstage files \ngit rebase -i HEAD~2 && reword  #To change old commit messages"

elif [ $1 == "lg" ] || [ $1 == "log" ]; then
   git log

elif [[ $1 == "global" ]]; then
	 setGlobalConfig_menu

elif [ $1 == "msg" ]; then
   clear
   f_greet
   if [ -z $2 ]; then
      echo " > The file 'msg' is always only one. After editing it, just send it"
      echo "   G msg send || G msg receive"
      /mnt/c/windows/explorer.exe "C:\Repositories\scratch-paper" 
   
   elif [ $2 == "send" ]; then
      # uDev: edit a specific text file
      # uDev: In future, the this file is public text in git, mix its letters before sending
      # uDev: if git status sais that there are modifications, git push
      # uDev: it must read if "nothing to commit, working tree clean" exists at the git status, and if it is found: do nothing
      vv=$(pwd)
      cd ${v_REPOS_CENTER}/scratch-paper
      git add --all
      v_date=$(date)
      git commit -m "$v_date"
       f_cor4
       echo -n "seivadarve"; f_resetCor; echo " and this:"; f_cor4;
       echo "ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
       f_resetCor
      git push
      cd $vv
   elif [ $2 == "receive" ]; then
      # uDev: rm repo entirely 'scratch-paper' is a possibility, then clone it back in with info. Then open the text file  
      # uDev: if git status sais that there are no modifications, git pull
      # uDev: if git status sais that there are modifications, warn user about it
      echo "receiving is not ready yet"
   elif [ $2 == "edit" ]; then
     vim ${v_REPOS_CENTER}/scratch-paper/some-text.txt 
   else
      echo "G msg: Choose 'send' or 'receive'"
   fi

elif [ $1 == "." ]; then
   # Git status
   
   if [[ -z $2 ]]; then
      clear; f_greet 

         #f_find_basename
         #sleep 2
         #echo
         #echo -n "Repository name: "
         #f_cor3
         #echo "$v_repo "
         f_cor4
         echo
         echo "git status:"
         f_resetCor
         git status
         echo " >> uDev: Tell how many branches are there"

   elif [[ $2 == "all" ]]; then
      # Whenever code complexity is found, a function is created to enable better code reading
         f_git_status-recursive
      
      # uDev: At windows, if git does not have this config (see line below), then this function will not take effect:
         # git config --global --add safe.directory /mnt/c/Repositories/upK
   fi
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

elif [ $1 == "count^" ]; then
   clear
   f_greet
   f_curl_uploads_count

elif [ $1 == "B" ]; then
   if [ -z $2 ]; then
      clear
      f_greet
      echo "ezGIT: Local branches"
      git branch

      echo
      echo "ezGIT: Remote branches"
      git branch -r

      # To see all branches at once (remote and local): git branch -a
      # To see more details: git branch -v
      # To see more details: git branch -vv
      # To see more details: git branch -vr
      # To see more details: git branch -vva
      # To see more details: git branch -vvr

   elif [ $2 == "new" ]; then
      clear
      f_greet
      echo "ezGIT: This command will create a new branch based on the branch you are currently on"
      echo "uDev: Tell which branch is currently on"
      echo "The new branch's history will start at the current place of the branch you \"branched off of.\""
      git checkout -b

   elif [ $2 == ".." ]; then
      clear
      f_greet
      echo "ezGIT: This command will allow to to switch between branches"
      git checkout
   fi

elif [ $1 == "new" ]; then
   # Creates a new repository
   echo "ezGIT: Do you want to create a new repository?"


elif [ $1 == "+" ]; then
   # 1. Test if $2 was specified
   # 2. git add $2
   # 3. Ask if user wants git diff
   # 4. git status
   # 5. git commim -m "i" 

      clear
      f_greet


      function f_1 {
         echo "insert 1 file first"
         exit 1
      }
      # If var $2 is empty, ask for one
         [ -z $2 ] && f_1

      
      # Git add <file>
         f_cor3
         echo -n "'"
			f_cor4
			echo -n "git add <insert file>"
         f_cor3
         echo "'"
         
         # When git adding files, we want 'G' to add all files input as arguments. BUT there is one prombem: '+' is the input value that indicates 'git add'. Therefore, the the second arg '+' is not discarded, then 'git add' will throw an error saying "there is no such file called '+'. The next line of code lists all arguments starting at 
         # arg $2 wich is '+'
			git add ${*:2}

         # For each argument given starting at arg 2, list it colorfully
         for i in ${*:2}; do
            f_cor4
            echo -n "git add "
            f_cor3
            echo $i
            f_resetCor
         done



      # Asking for 3 seconds if the user wants 'git diff'
			f_cor4
         echo -e "\nDo you want to see the differences between the 2 files? \n(the last version and the current version) "
			f_resetCor
         echo " > If no, press Any key"
         echo -n " > If so, press: "
			f_cor4
         echo "D"
         echo
         echo -n "git diff? "
			f_resetCor
         echo -n "(press D or ANY key): "
         read -sn 1 v_ans
         
         case $v_ans in
            d | D)
                # Display text based cresential while app is in beta
                   echo "Starting..."
                   f_cor3
                   echo $3
                   f_resetCor
                   sleep 1
                   git diff --staged
                   read -s -n 1
            ;;
            *)
               echo "You dind't choose anything..."
               echo
            ;;
         esac

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
         f_cor3
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
            p | P)
                # Display text based credential while app is in beta
                   echo
                   f_stroken

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

elif [ $1 == "-" ]; then 
   # unStages a file
	# uDev: lacks colored text

      f_cor4
      echo -en "git reset "
      f_cor3
      echo -e "$2"
      f_resetCor

      # uDev: unstage all files given as args besides $1. the argument $1 '-' is not a file. (See 'G +' where this line of code already works)
      git reset $2


elif [ $1 == "+-" ] || [ $1 == "g-ad-cm-amend" ]; then
   # git commit --ammend
      # Used in cases where you want to update your last commit (for example you forgot a line of code or you found a bug that you can easily fix. 
      # It is usefull to keep the git log clean and easy to read.
      # If you didn't use this option, the are many times creating 3 commits to accomplish things you wanted to do imediatly at the first try
      # This also avoids git commits -m "same as last commit" because the new commit merges with the last one
   # It can also change the last commit message

      clear 
      f_greet

		f_cor4
         echo "git commit --amend? (press anter to confirm)"
		f_resetCor
         echo " > Remember: This merges staged files: do you have any?"

      git commit --amend

      #uDev: if you do not need to change the commit message, then you can even do git commit --amend --no-edit
      #uDev: to change the commit message on the terminal without text editor: git commit --ammend -m "new commit message"
      #uDev: if you want to ammed a commit that was ALREADY PUSHED to github there is a method: (warning doind this when working as a team od developers, because it may erase code): ammed you repo locally and then: "git push -f origin main"



elif [ $1 == "v" ] || [ $1 == "gpull" ]; then
   # git pull
   # Download
   if [[ -z $2 ]]; then
      clear; f_greet 
   
      echo
      f_stroken
      echo

		f_cor4
         echo -n "git pull? (press ANY key to confirm) "
		f_resetCor
      read -sn 1 
      echo "Starting git pull..."
      git pull

   # Git status
      f_cor4
      echo -e "\ngit status:"
      f_resetCor
      git status


   elif [[ $2 == "all" ]]; then
      f_git_pull-recursive

   elif [[ $2 == "dot" ]]; then
      f_git_pull_dot_files

   fi

# uDev: 'G vv' git fetch 
# uDev: 'G vv all' git fetch all repos
# uDev: 'G ^^' git push (blind upload)

elif [ $1 == "^" ] || [ $1 == "gpush" ]; then
   # git push
   # Upload
      clear 
      f_greet

		f_cor4
         echo "git push"
		f_resetCor

      f_stroken

      git push

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


elif [ $1 == "," ]; then
   # Info about the current directory (versose version. # uDev: 'G ,,' for non verbose functionality) 
      # Tells if the current directory name is part of a list of names that may have a dedicated dir for encryption
         # Some repos will not be allowed do 'git push' with sensitive data exposed

      # Gives the name of the curent repository
         # If the current directori is not a repository, that is also mentioned

      f_tell_repo_name

elif [ $1 == "upk" ]; then
   case $2 in
      v)
         clear
         f_greet
         echo "ezGIT: Pulling requirements for upk stuff"
         echo
         # If there is no file ~/.netrc configured for automatic git pull and git push, you might uncomment f_stroken:
            # f_stroken; echo
         echo "ezGIT: You are about to \"git pull\" all these repos:"
         echo -n " > DRYa; upk; ezGIT; upK-diario-Dv ... "
         f_cor4
         read -s -n 1 -p "Press any key to continue"
         f_resetCor
         echo ; echo
         f_horizontal_line
         cd ${v_REPOS_CENTER}/DRYa && echo "GIT PULL: DRYa" && echo -n " > " && git pull && echo
         cd ${v_REPOS_CENTER}/ezGIT && echo "GIT PULL: ezGIT" && echo -n " > " && git pull && echo
         cd ${v_REPOS_CENTER}/upK && echo "GIT PULL: upK" && echo -n " > " && git pull && echo
         cd ${v_REPOS_CENTER}/upK-diario-Dv && echo "GIT PULL: upK-diario-Dv" && echo -n " > " && git pull && echo
         

         # ----------------------------------------------------------
            # Info about Emacs init file location in Microsoft Windows
               # On {Windows 10, Windows 8, Windows 7, Windows Vista} , by default, emacs looks at the following directory/file.

               # $HOMEPATH/AppData/Roaming/.emacs
               # The .emacs file is old emacs convention, used in 1990s and 2000s.

               # $HOMEPATH/AppData/Roaming/.emacs.d/init.el
               # The .emacs.d/init.el is modern convention.
         # ----------------------------------------------------------


         # After updating repositories, lets move their updated dot-files across the system:
            # Emacs init.el file:
               echo "Management of init.el file (from inside DRYa repo)"
               cp ${v_REPOS_CENTER}/DRYa/all/dot-files/emacs/init.el ~/.emacs.d/init.el && \
               echo " > Was copied to ~/.emacs.d/init.el" || echo " > Not copyed!"
               echo 

            # Deleting other emacs init files to prevent conflicts:
               echo "Management of file ~/.emacs (removing it to prevent conflicts)"
               rm ~/.emacs 2>/dev/null && \
               echo " > File removed: ~/.emacs" || echo " > File ~/.emacs would be deleted if it was existent" 
               echo 

            # If we are on windows, the init file will be somewhere at %appdata%
               if [ -d /mnt/c/Users/Dv-User/AppData/Roaming/.emacs.d ]; then
                  echo "Windows adjustment: "
                  echo " > %AppData% exists: managing init.el files to their correct places:"
                     rm /mnt/c/Users/Dv-User/AppData/Roaming/.emacs 2>/dev/null && \
                     echo " > ...AppData/Roaming/.emacs was deleted " || echo " > ...AppData/Roaming/.emacs would be deleted on windows if it was existent "
                     cp ${v_REPOS_CENTER}/DRYa/all/dot-files/emacs/init.el /mnt/c/Users/Dv-User/AppData/Roaming/.emacs.d/init.el \
                  && echo " > file copied from DRYa to .../AppData/Roaming/.emacs.d/init.el"
                  echo
               fi
            
            # Info: This function also exists at DRYa repo. function name is: ,...
      ;;
      vv)
         clear
         echo "ezGIT: Fetching requirements for upk stuff"
         f_stroken; echo
         f_horizontal_line
         echo "ezGIT: fetching: DRYa; upk; ezGIT; upK-diario-Dv"
         echo 
         cd ${v_REPOS_CENTER}/DRYa && echo " > fetching DRYa" \
            && git fetch && echo " > git status" && git status && f_horizontal_line
         
         cd ${v_REPOS_CENTER}/ezGIT && echo " > fetching ezGIT" \
            && git fetch && echo " > git status" && git status && f_horizontal_line

         cd ${v_REPOS_CENTER}/upK && echo " > fetching upK" \
            && git fetch && echo " > git status" && git status && f_horizontal_line

         cd ${v_REPOS_CENTER}/upK-diario-Dv && echo " > fetching upK-diario-Dv" \
            && git fetch && echo " > git status" && git status && f_horizontal_line
         echo 
         echo "uDev: should check diff between init.el files"
      ;;
      *)
         # If no args are given,  tell what it is supposed to do
         echo "ezGIT: uDev: Repos needed to UPK:"
         echo " > DRYa"
         echo " > upK"
         echo " > upK-diario-Dv"
         echo " > ezGIT"
      ;;
   esac

elif [ $1 == "-1" ]; then
   echo "ezGIT: Moving HEAD 1 commit below (previous one)"
   git checkout HEAD^1
   echo "ezGIT: Attach HEAD with command: git switch -"

elif [ $1 == "+1" ]; then
   echo "ezGIT: Moving HEAD 1 commit above (next one)"
   git log --reverse --pretty=%H main | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout 
   echo "ezGIT: Attach HEAD with command: git switch -"

elif [ $1 == "reset-head" ]; then
   git checkout main

elif [ $1 == "diff-between-head" ]; then
   # When navigating between commits like 'G -1' and 'G +1' gif diff might be needed.
   # If you want to see what is the difference between your current commit and the head commit, use this command
   #
   # Usualy we use: gif diff <newest-commit>..<oldest-commit>
   #
   # Now we will detect what is the current commit, detect the head commit and 'git diff' both

   echo "uDev: git diff between this commit and head commit is not yet developed (written/programed)"


elif [ $1 == "diff" ]; then
   clear
   figlet ezGIT
   echo "This option is the same as: '$ git diff --staged'"
   git diff --staged
   
elif [ $1 == "rebase-false" ]; then
   git config pull.rebase false

elif [ $1 == "rebase-true" ]; then
   git config pull.rebase true

elif [ $1 == "rb" ]; then

   if [ -z $2 ]; then
      clear
      figlet ezGIT
      echo "ezGIT: \"G rb\" (git rebase) requires an extra arg, either t of f (true or false respectively)"

   elif [ $2 == "f" ]; then
      echo "git config pull.rebase false"
      git config pull.rebase false
   
   elif [ $2 == "t" ]; then
      echo "git config pull.rebase true"
      git config pull.rebase true

   fi

elif [ $1 == "uDev" ]; then
   echo "This function uses the find command to search \"# uDev\" comments om the code"



elif [ $1 == "stash" ] || [ $1 == "st" ]; then
  f_greet
  echo "ezGIT: saving current commits for later "
  echo "       (pulling first and applying current commits later)"
  echo " > git stash "
  git stash

elif [ $1 == "unstash" ] || [ $1 == "ust" ] || [ $1 == "apply" ] || [ $1 == "ap" ]; then
  echo "ezGIT: Apllying saved commits now, to this state"
  echo " > git stash apply"
  git stash apply


elif [ $1 == "file-host" ]; then
   echo "If you want to use github to download single files just like any other cloud storage instead of cloning entire repos, you can. Github supports that. Here is a link to teach how to do that while this function is under development"
   echo " > https://www.howtogeek.com/devops/how-to-download-single-files-from-a-github-repository/"

elif [ $1 == "new-repo" ]; then

   echo '
uDev: Create a script for this heredoc

      source: https://gist.github.com/alexpchin/dc91e723d4db5018fef8

# Setting up a new Git Repo
   ## Create a new repository on the command line
      touch README.md
      $ git init
      $ git add README.md
      $ git commit -m "first commit"
      $ git remote add origin git@github.com:alexpchin/<reponame>.git
      $ git push -u origin master

   ## Push an existing repository from the command line
      $ git remote add origin git@github.com:alexpchin/<reponame>.git
      $ git push -u origin master
'
   clear
   figlet ezGIT
   echo "ezGIT: create new repo (uDev)"
   echo
   echo "Note: When ezGIT is working with DRYa, all repos are at first created at:"
   echo " > ${v_REPOS_CENTER}"

else
   # If the arguments you input are neither empty nor listed, then run:
      echo "That option does not exist."
      echo "In case of doubt, run the app again without any option in order for the instructions to be presented to you"
fi


#uDev: You may start deleting "case" and "esac" and adding 'if [ $1 == "K" ]; then' because it is better to create menus
#uDev: add an option for: "mkdir" + "touch .gitkeep"
#uDev: add: "alias "G (*)"="git stash"' and 'alias "G )*("="git unstash"'








# ---------------------------------------------



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
      f_stroken

       git push

       echo ""
       f_cor4
       echo "git status:"
       f_resetCor
       git status
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
