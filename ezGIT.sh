#!/bin/bash
# Title: ezGIT to replace long git commands for one simple and short command

#----------------------------------------------------------------------------
# Instructions: 1. For instructions: 
#                  > run in the terminal: `bash ezGIT.sh h` (if not installed)
#                  > run in the terminal: `G h`             (if installed)
#
#                  > Read into this file: "function f_instructions {"
#                  >        with Hashtag: #78654
#                           It explains how to install and use.
#----------------------------------------------------------------------------


# uDev: Functions for text colors
#       If ezGIT gets byte compiled, there should be a file to configure it's color numbers
#       For example at: ~/.config/h.h/ezGIT

# uDev: criar fx para testar se a repo atual é publica ou privada (ou entao fazer logo a lista de todas)

# uDev: 1x por cada mes, fazer git pull para o HD externo no contexto de backup (pode ate ser usado git --bare)

# uDev: Check at every run if email and username exist and are configured according a personal database of emails and usernames
#       Without a proper email, github will not count your commits for their graph of your activity

# uDev: if the chosen repo to 'git push' is a repo that is usually encripted, do not allow to push before using encryption

# uDev: Instead of creating repos at github.com, then clone, then use: instead, create a function with git init and then push to the remote

# uDev: Create option to print: either public repo or privare repo

# If this script runs, a variable is set to tell which one repo was the last one to run
   v_repo="ezGIT"




# Calling DRYa libraries
   # uDev: failsafe: If drya repo does not exist, create alternatives

   # Sourcing DRYa Lib 1
      v_lib1=${v_REPOS_CENTER}/DRYa/all/lib/drya-lib-1-colors-greets.sh
      unset v_greet v_talk
      [[ -f $v_lib1 ]] && source $v_lib1 || (read -s -n 1 -p "DRYa: error: drya-lib-1 does not exist " && echo)

      v_greet="ezGIT"
      v_talk="ezGIT: "
      
      # Examples: f_c1; f_c2; f_c3; f_rc; f_talk


   # Sourcing DRYa Lib 2
      v_lib2=${v_REPOS_CENTER}/DRYa/all/lib/drya-lib-2-tmp-n-config-files.sh
      [[ -f $v_lib2 ]] && source $v_lib2 || (read -s -n 1 -p "DRYa: error: drya-lib-2 does not exist " && echo)

      # Examples: `f_create_tmp_file` will give a $v_tmp with a new file with abs path
     

   # Sourcing DRYa Lib 4: Color schemes
      v_lib4=${v_REPOS_CENTER}/DRYa/all/lib/drya-lib-4-dependencies-packages-git.sh
      [[ -f $v_lib4 ]] && source $v_lib4 || (read -s -n 1 -p "DRYa: error: drya-lib-4 does not exist " && echo)

      # Examples: f_lib4_stroken


function f_stroken_copy {
   # When automatic github.com authentication is not set, an alternative (as taxt based credential, but salted) is printed on the screen. This is usefull until the app remains as Beta.
   # While the app is in beta, this is usefull

   # If ~/.netrc exists, no need to print the rest
      if [ -f ~/.netrc ]; then
         #echo "~/.netrc exists"
         echo "it exists" 1>/dev/null
      else
         f_talk; echo -n "Presenting \""
           f_c3; echo -n "stroken"
           f_rc; echo    "\""
                 echo    " > Automatic sync (config file) not configured"
                 echo -n "   Use: "
           f_c2; echo    "seivadarve"
           f_rc; echo -n           "   And: ";
           f_c2; echo    "ghp_JGIFXMcvvzfizn9OwAMdMdGMSPu9E30yVogPk"
           f_rc; echo
      fi
}

function f_stroken_centralized {
   # In order for DRYa to keep the MOST up-to-date info and acess to credentials, allowing safety, then ezGIT `f_stroken` is now a copy of drya-lib-4 `f_lib4_stroken`
   # The fx f_stroken in this file has now the possibility to be outdated
   # So, f_stroken_centralized tests if drya-lib-4 exists. If it does, it uses f_lib4_stroken from DRYa, if it does not exist, maybe ezGIT f_stroken_copy may still work and will try to run

   # Attempting to use the original f_lib4_stroken from DRYa (if installed)... In case of falure, use f_stroken_copy instead
      [[ -f $v_lib4 ]] && f_lib4_stroken || f_stroken_copy
}



function f_instructions {
   # dee-up: 'Instructions for ezGIT functions'  #78654

   
   #   Instrunctions: Instalation process
   #    > Install ezGIT on "~/.bashrc" with an 'alias G=".../ezGIT.sh" '
   #    > Use: 'G byte-compile' (uDev)
   #
   #   Using without instalation (ezGIT is a simple Bash app)
   #    1. One way to use this app without installing it at "/bin" is to navigate to this directory where G.sh is located and execute "source G.sh" to load all functions inside itself into the Terminal's environment variables
   #
   #    2. You can also navigate to G.sh and run "bash G.sh" along with some argument like "?". If would be "bash G.sh ?"
   #
   #   (Quit this page with the hoykey: Q)
   

   # Lista de opcoes para o menu `fzf`
      Lz1='Save '; Lz2='G h'; Lz3="$Lz1\`$Lz2\`"; Lz4=$v_drya_fzf_menu_hist

      L30='30. | G h      |     | Displays this menu'
      L29='29. | G ?      |     | Displays this menu'
      L28='28. | G F      |     | Favourites'
      L27='27. | G .      |     | git status'
      L26='26. | G ,      |     | Show info and options of branches'
      L25='25. | G v      |     | git pull'
      L24='24. | G ^      |     | git push'
      L23='23. | G +      | gad | git add <file-name-here>    (stages a file)'
      L22='22. | G + .    |     | git add .'
      L21='21. | G + all  |     | git add --all'
      L20='20. | G + ^    | gcm | git commit -m "<your-commit-message>" (used for staged files)'
      L19='19. | G -      |     | git reset <file-name-here>  (unStages a file)'
      L18='18. | G @      | gcf | git config (menu)'
      L17='17. | G !      | glg | git log'
      L16='16. | G ++     |     | Stages ALL files and promps the user for a commit message'
      L15='15. | G ++ b   |     | automatic git commit with message with code/variable: b (for blind update)'
      L14='14. | G +-     |     | Ammends/Edits last commit message'
      L13='13. | G []     |     | git stash'
      L12='12. | G [      |     | git stash apply'
      L11='11. | G +1     |     | Move 1 commit up'
      L10='10. | G -1     |     | Move 1 commit down'
       L9='9.  | G 1      |     | Come back to HEAD'
       L8='8.  | G %      |     | See diference between current commit and HEAD'
       L7='7.  | G rb f   |     | git pull.rebase false'
       L6='6.  | G rb t   |     | git pull.rebase true'
       L5='5.  | G new    |     | Menu to create new GIT repositories'
       L4='4.  | G repo ^ |     | uDev: automatic sync + open + close + sync to given "repo"'
       L3='3.  | G c      |     | uDev: List all configs'
       L2='2.  | G config |     | uDev: Automatic configuration for fast start (DRY)'
       L1='1. Cancel'

      L0="ezGIT: Verbose instructions. Press [ENTER] to exec: "
      
      v_list=$(echo -e "$L1 \n$L2 \n$L3 \n$L4 \n$L5 \n$L6 \n$L7 \n$L8 \n$L9 \n$L10 \n$L11 \n$L12 \n$L13 \n$L14 \n$L15 \n$L16 \n$L17 \n$L18 \n$L19 \n$L20 \n$L21 \n$L22 \n$L23 \n$L24 \n$L25 \n$L26 \n$L27 \n$L28 \n$L29 \n$L30 \n\n$Lz3" | fzf --cycle --prompt="$L0")

   # Perceber qual foi a escolha da lista
      [[ $v_list =~ $Lz3  ]] && echo "$Lz2" && history -s "$Lz2"
      [[ $v_list =~ "30. " ]] && echo "uDev"
      [[ $v_list =~ "29. " ]] && echo "uDev"
      [[ $v_list =~ "28. " ]] && echo "uDev"
      [[ $v_list =~ "27. " ]] && echo "uDev"
      [[ $v_list =~ "26. " ]] && echo "uDev"
      [[ $v_list =~ "25. " ]] && echo "uDev"
      [[ $v_list =~ "24. " ]] && echo "uDev"
      [[ $v_list =~ "23. " ]] && echo "uDev"
      [[ $v_list =~ "22. " ]] && echo "uDev"
      [[ $v_list =~ "21. " ]] && echo "uDev"
      [[ $v_list =~ "20. " ]] && echo "uDev"
      [[ $v_list =~ "19. " ]] && echo "uDev"
      [[ $v_list =~ "18. " ]] && echo "uDev"
      [[ $v_list =~ "17. " ]] && echo "uDev"
      [[ $v_list =~ "16. " ]] && echo "uDev"
      [[ $v_list =~ "15. " ]] && echo "uDev"
      [[ $v_list =~ "14. " ]] && echo "uDev"
      [[ $v_list =~ "13. " ]] && echo "uDev"
      [[ $v_list =~ "12. " ]] && echo "uDev"
      [[ $v_list =~ "11. " ]] && echo "uDev"
      [[ $v_list =~ "10. " ]] && echo "uDev"
      [[ $v_list =~ "9.  " ]] && echo "uDev"
      [[ $v_list =~ "8.  " ]] && echo "uDev"
      [[ $v_list =~ "7.  " ]] && echo "uDev"
      [[ $v_list =~ "6.  " ]] && echo "uDev"
      [[ $v_list =~ "5.  " ]] && echo "uDev"
      [[ $v_list =~ "4.  " ]] && echo "uDev"
      [[ $v_list =~ "3.  " ]] && echo "uDev"
      [[ $v_list =~ "2.  " ]] && echo "uDev"
      [[ $v_list =~ "1.  " ]] && echo "Canceled: $Lz2" && history -s "$Lz2"
      unset v_list
}


function f_find_basename {
   # uDev" Needs to search for our .git directory
   # uDev: Search for .git dir, because it would maen that it's paralent dir is our repo name

   ls .git 1>/dev/null; 
   if [ $? == "0" ]; then echo "is a git repo"; fi

   v_current_pwd=$(pwd)
   basename $v_current_pwd
   echo "$v_current_pwd"

                  #echo -n "Repository name: $v_repo"
                  #f_c1
                  #echo "$v_repo "
                     
   #echo $v_relPWD
   #v_relRepo=$(echo $v_relPWD | sed 's/"$v_REPOS_CENTER"//g')
   #echo $v_relRepo
   #cut -d '/' -f 1 $v_relRepo
      
   # uDev: can be changed by the command 'basename'
}

function f_git_config_missing {
   # If .gitconfig does not exist, ask for configuration

   f_greet
   f_talk; echo "File .gitconfig does not exist"
           echo " > Without it, chart at github.com will be benefit with updates"
           echo
           echo 'You Configure it with:'
           echo ' > Menu `D dot install gitconfig` (uDev)'
           echo ' > ... or proceed this instalation'
           echo 
   
   # To install .gitconfig: 
      v_txt="Install and configure .gitconfig file" && f_anyK
      f_dot_file_install_gitconfig
}

function f_git_status {
   f_talk; echo -n 'Current State: '
     f_c3; echo    '`git status`'
     f_rc 

   git status
           echo
}

function f_git_fetch {
  # May use a while loop and waiting for upstream changes without downloading

   f_talk; echo -n 'Current State: '
     f_c3; echo -n '`git fetch`'
     f_rc; echo -n ' and '
     f_c3; echo    '`git status`'
     f_rc; echo

   git fetch
   git status; s=$(git status)
           echo
}

function f_git_push {
   f_talk; echo -n 'Sending to Github: '
     f_c3; echo    '`git push`'
     f_rc

   git push
           echo
}

function f_git_add_all {
   f_talk; echo -n 'Staging all files: '
     f_c3; echo    '`git add --all`'
     f_rc

   git add --all
}

function f_git_pull {
   f_talk; echo -n 'Receiving from Github: '
     f_c3; echo    '`git pull`'
     f_rc; echo

   git pull
}

function f_git_commit {
   # Git commit -m ""

   # uDev: If git status says "nothing to commit, working tree clean" then we must not ask for a commit message. Unless there are N number of commits to upload, which in that case, G ++ be used anyway

   f_talk; echo -en "Adding a commit message "
     f_c1; echo -n                          "i"
     f_rc; echo                              " (to staged files):"
           echo -n ' > `git commit -m "'
     f_c1; echo -n                    "i"
     f_rc; echo                        '" `'
           echo
           echo    " > What is your commit message?"
           echo    " > (leave empty to abort)"  # uDev: save cursor position here to overwrite text "leave empty to abort" 
     f_c1; read -p " > " v_ans
     f_rc; echo
   f_talk; echo -n 'git commit -m "'
     f_c1; echo -n               "$v_ans"
     f_rc; echo                        '"'

   git commit -m "$v_ans"  # uDev: Add f_sucess

           echo

}

function f_count_nr_branch_commits {
   # Counting total git commits for current branch
   
   # uDev: Bug happens if last command was `git init` and there is no commits yet (therefore, no HEAD to search)

   v_num=$(git rev-list --count HEAD)
   f_talk; echo -n "Counting git commits (current branch): "
     f_c3; echo    "$v_num"
     f_rc; echo
}

function f_unstage_all {
   # Unstage all files

   f_greet

   f_talk; echo -n 'Unstage all files: '
     f_c3; echo    '`git reset`'
     f_rc

   git reset
   echo
}

function f_test_if_currently_at_any_repo {
   # Test if we are actually at a git repository
      git status &>/dev/null

      [[ $? =~ "1" ]] && f_talk && echo -e "You are not currently at any repo \n" && exit 1
}

function f_test_if_any_unwanted_files_are_saved_at_repos_root {
   # When calling `G . A` or `G .` at the correct root directory of all repos, then test if there are files there that should not be there
   
   # uDev: This fx does not exist across the script yet
   echo "uDev: Mention unwanted files at \${v_REPO_CENTER}/"
}

function f_save_current_branch {
   # Guardar numa variavel qual o ramo atual

   v_current_ramo=$(git branch | grep "*" | sed "s/\* //g")
}

function f_tell_current_branch {
   # Print on the screen current branch without '*'

   f_talk; echo -n "Currently on branch: "

   f_save_current_branch

   f_c1; echo "$v_current_ramo"
   f_rc; echo

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

function f_blind_brain {
   # Antes do upload, verificar qual é o ramo atual, e implicar com o user caso seja 'main'
   # Porque blind updates terá a intençao de ser apenas para ramos 'dev' 
      f_save_current_branch   
      #echo $v_current_ramo 
      if [ $v_current_ramo == "main" ]; then 
         f_talk; echo "Blind Update and Upload"
                 echo  " > Voce está no ramo 'main' "
                 echo  " > Tem a certeza que quer um Blind-Update???"
                 echo

         # Asking if the user is sure and wants to proceed
            v_txt="G ++ b"; f_anyK
            echo
      fi

   # Sending automatically everything with an automated commit message
      # Message to use as commit: $v_aut_message

      f_talk; echo    "Running 'blind-upload' or 'b':"
              echo -e " > Commits and pushes all contents of the repo fully automatic "
              echo

      f_talk; echo "Default commit message:"
              echo " > $v_aut_message"
              echo

      f_talk; echo "Adding all files to make the automatic commit"
              git add --all && echo " > Done!"
              echo

      f_talk; echo "Creating an automatic commit"
              git commit -m "$v_aut_message"
              echo

      f_git_status

      f_stroken_centralized

      f_git_push

      f_git_status

      f_talk; echo "Done!"
}

function f_output {
   # Function used by: f_git_pull_recursive, f_git_status_recursive ...
      # To output it's Git Status
   f_horizontal_line

   f_c2; echo -n " > Repository: "
   f_c1; echo -e "$i \n"
   f_rc

   git status
}

function f_git_pull_recursive {
   # Pulling repository changes to ALL repos (recursive)

   f_greet

   # Describing to the user
      f_talk; echo    "git pull (to all repositories) at:"
              echo -n " > "
        f_c1; echo       "$v_REPOS_CENTER"
        f_rc; echo
              echo    "Starting:"

   # Mention one possible password
      f_stroken_centralized

   # function f_output must be loaded here (or previously)

      cd ${v_REPOS_CENTER}
      for i in $(ls); do 
         # Filter directories from files
            v_object_type=$(file $i)

         # If the variable v_object_type returns a directory, we navigate into it
            if [[ $v_object_type =~ "dir" ]]; then 
               cd $i
            
               f_output #sera?
               
         # Saving the git status into a variable without outputing it to the screen
            # It sends an error if dir is not repository. Therefore we send Sandard error do /dev/null
            s=$(git pull)  ## Or: s=$(git pull 2>/dev/null) 

         #  # Search for git words that indicate work to be done
         #     # uDev: there must be more words, therefore this function must be tested
         #     if [[ $s =~ "added" ]]; then f_output;
         #        elif [[ $s =~ "Changes" ]]; then f_output;
         #        elif [[ $s =~ "Untracked" ]]; then f_output;
         #     fi

         # Navigating backwards before restarting the 'for loop' 
            cd ..

         fi
      done

   # Finishing: Display a message to indicat it is finished:
      # uDev: lacks color

      f_horizontal_line

      f_talk; echo    "git pull recursive (to all repositories) at:"
              echo -n " > "
        f_c1; echo       "$v_REPOS_CENTER"
        f_rc; echo
              echo    "Finished!"

      f_horizontal_line
}

function f_git_push_recursive {
   # Pulling repository changes to ALL repos (recursive)

   f_greet

   # Describing to the user
      f_talk; echo    "git push (to all repositories) at:"
              echo -n " > "
        f_c1; echo       "$v_REPOS_CENTER"
        f_rc; echo
              echo    "Starting:"

   # Mention one possible password
      f_stroken_centralized

   # function f_output must be loaded here (or previously)

      cd ${v_REPOS_CENTER}
      for i in $(ls); do 
         # Filter directories from files
            v_object_type=$(file $i)

         # If the variable v_object_type returns a directory, we navigate into it
            if [[ $v_object_type =~ "dir" ]]; then 
               cd $i
            
               f_output #sera?
               
         # Saving the git status into a variable without outputing it to the screen
            # It sends an error if dir is not repository. Therefore we send Sandard error do /dev/null
            s=$(git push)  ## Or: s=$(git pull 2>/dev/null) 

         #  # Search for git words that indicate work to be done
         #     # uDev: there must be more words, therefore this function must be tested
         #     if [[ $s =~ "added" ]]; then f_output;
         #        elif [[ $s =~ "Changes" ]]; then f_output;
         #        elif [[ $s =~ "Untracked" ]]; then f_output;
         #     fi

         # Navigating backwards before restarting the 'for loop' 
            cd ..

         fi
      done

   # Finishing: Display a message to indicat it is finished:
      # uDev: lacks color

      f_horizontal_line

      f_talk; echo    "git push recursive (to all repositories) at:"
              echo -n " > "
        f_c1; echo       "$v_REPOS_CENTER"
        f_rc; echo
              echo    "Finished!"

      f_horizontal_line
}

function f_git_status_recursive {
   # git status (all repos)

   f_greet

   f_talk; echo '`git status` (to all repositories) at:'
           echo " > $v_REPOS_CENTER"

   # function f_output must be loaded here (or previously)

   cd ${v_REPOS_CENTER}

   # Contador de instancias nao regularizadas com o github.com
      v_contador=0

   for i in $(ls); do 
      # Filter directories from files
         v_object_type=$(file $i)

      # If the variable v_object_type returns a directory, we navigate into it
         if [[ $v_object_type =~ "dir" ]]; then 
            cd $i
            
           #echo "A verificar: $i"; read -sn 1  # Debug

            # Saving the git status into a variable without outputing it to the screen
               # It sends an error if dir is not repository. Therefore we send Sandard error do /dev/null
               s=$(git status 2>/dev/null) 

            # Search for git words that indicate work to be done
               # uDev: there must be more words (En and PT-PT) therefore this function must be tested
               #       uDev: replace all these words for `git status --short` if it does not print anything, means git staus Ok, nothing to commit, working tree clean
               if [[ $s =~ "added" ]]           || [[ $s =~ "Changes"          ]] \
               || [[ $s =~ "Untracked" ]]       || [[ $s =~ "modificado"       ]] \
               || [[ $s =~ "branch is ahead" ]] || [[ $s =~ "está à frente"    ]] \
               || [[ $s =~ "have diverged"   ]] || [[ $s =~ "desmonitorizados" ]]

               then 
                  f_output
                  v_contador=$(($v_contador+1))

                  # uDev: PRECISA INFORMAR TAMBEM QUANDO O git status ENCONTRA commited files SEM TER SIDO AINDA ENVIADOS PARA O GITHUB
                  # uDev: PRECISA INFORMAR TAMBEM STASHED ITEMS

               fi

            # Voltar para a pasta anterior
              cd ..
         fi
   done
      

   # Display a message to indicate it is finished:
      f_horizontal_line

      f_talk; echo "git status (to all repositories) at:"
              echo " > $v_REPOS_CENTER"
              echo "Finished!"

      f_horizontal_line

   # Se nao houver nenhuma instancia por regularizar (em que $v_contador = 0) entao, apaga todo o ecra
      #echo "contador: $v_contador"  # Debug
      
      [[ $v_contador == "0" ]] && f_greet && f_talk && echo "Git Status a todos os repositorios:" && echo -e " > Tudo OK (beta version)\n "
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
   # uDev: This function is like: dir-basename for git
   
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
         f_c2; echo -n "$v_name "
         f_c1; echo -n "is not "
         f_rc; echo    "a repository"

      elif [[ $v_git_dir == "./.git" ]]; then  # && basename is on blacklist: test if it's decripted directory is empty
         # If at our location ./ a dire called .git is found:

               echo -n "The directory "
         f_c2; echo -n "$v_name "
         f_c1; echo -n "is "
         f_rc; echo "a repository"
      fi 
}

function f_git_status_nr_1_all_repos_root {
   # Git Status (step 1): Runs when inside (DRYa-REPOS-CENTER)
   
   f_talk; echo -n 'Current State: '
     f_c3; echo                   '`git status`'
     f_rc; echo    " > Not at any repository (command only for repos)"
           echo

   f_talk; echo    'Current location:'
           echo -n ' > Name     : '
     f_c3; echo                  '(DRYa-REPOS-CENTER)'
     f_rc; echo    ' > Variable : ${v_REPOS_CENTER}'
           echo    " > Path     : ${v_REPOS_CENTER}/"
           echo

   f_talk; echo 'Use fluNav command `V <name>` to jump to:'
           echo ' > Full name or abreviated name of <name> repository'
           echo



   # Vai ser filtrado na pasta (DRYa-REPOS-CENTER) a existencia de:
   #     1. Pastas-repo
   #     2. Pastas-nao-repo
   #     3. Ficheiros.

   f_talk; echo "Listing all valid repositories: "

   # Limpar variaveis (para fazer um teste novo do zero)
      unset v_files     # Ficheiro que menciona ficheiros que convem mover para fora de Repos-Center
      unset v_non_repo  # Ficheiro que menciona diretorios que convem mover para fora de Repos-Center

      for i in $(ls -A)
      do
         # Listar recursivamente as pastas que sao repo (e enfiar em 2 variaveis todos os ficheiros e pastas que nao sao repo)

         # Verificar o tipo de TODOS os ficheiros
            v_tipo=$(file $i)


         if [[ $v_tipo =~ "directory" ]]; then
            # Saber se é pasta ou ficheiro

            # Se for pasta, testa se é repo ou nao
               cd $i                # Entra na pasta a testar se é repo
               ls .git &>/dev/null  # Procura por uma pasta especifica que so os repos tem (pasta .git)
               v_last_cmd=$?        # Guarda o estado de saida do "teste" se é ou nao é repositorio


            # Apos o teste feito, filtra para cada variavel, as pastas que sao repo e as que nao sao repo
               [[ $v_last_cmd == 0 ]] && echo " > $i/"               # Se o teste correu bem, listar com verbose
               [[ $v_last_cmd == 2 ]] && v_non_repo="$v_non_repo $i" # Se o teste correu mal, guardar essa info

            # Voltar a pasta inicial
               cd ..

         else
            # Se nao for pasta, é ficheiro e guarda o nome nesta variavel
            v_files="$v_files $i"
         fi

      done

   # Print a last echo (to distance text from `for` loop)
      echo

   # If any variables were set, run the fx that prints them
      ( [[ -n $v_non_repo ]] || [[ -n $v_files ]] ) && f_print_invalid_items
}

function f_git_status_nr_2_not_all_repos_root {
   # Git Status (step 2): Runs when outside (DRYa-REPOS-CENTER). Now current location/directory will be filtered: Either valid or invalid repo

   # Two steps to find if current path is valid
      # 3. Found invalid repo: Throw a beautifull error message
      # 4. Found valid repo:   Must be inside some repo BUT not at the root of all repos   

   # Possibility 1 and 2, (testing if valid or invalid):
      git status &>/dev/null  # Try a normal git status but with no output. MUST BE ONE COMMAND ONLY, becaus $? stores the status of the sucess only of the last command. If we run 'git status' inside .git we get the status code 128 instead of 0. so both numbers must be checked
      v_status_code=$?        # If variable $? is equal to 1 or is equal to 2, then the last command issued in bash was a failure, an error occured. If $? is 0, it means last function ran ok.

   if [[ $v_status_code != "0" ]] && [ $v_status_code == "128" ]; then  ## Test if last command was a failure (not equal to 0)
      # 3. Invalid: Not on a git repo

      v_pwd=$(pwd)

      f_talk; echo -n 'Current State: '
        f_c3; echo                   '`git status`'
        f_rc; echo    " > Not at any repository (command only for repos)"
              echo

      f_talk; echo    'Current location:'
              echo -n ' > 1. At: '
        f_c3; echo              "$v_pwd"
        f_rc; echo    " > 2. Neither at any repository"
              echo    " > 3. Neither at the central dir of repositories"
              echo
      f_talk; echo    'Use fluNav command `. G` to jump to:'
              echo    ' > Central, Root directory of repos (DRYa-REPOS-CENTER)'
              echo

   elif [[ $v_status_code == "0" ]] || [ $v_status_code != "128" ]; then
      # 4. Valid: It is a git repo, but further down the directory tree

      # Extrair do `pwd` o nome da repo atual (semelhante ao comando `basename`)
         v_repo=$(pwd | sed "s/Repositories\// /" | cut -d ' ' -f 2 | sed "s/\// /" | cut -d ' ' -f 1)

      # Verbose: name
         f_talk; echo -n "Repo Name: "
           f_c3; echo "$v_repo"
           f_rc; echo

      # Git commands (escolher apenas um deles. Comenear os que nao sao necessarios)
         f_git_fetch  # Ja inclui `git status` 
        #f_git_status

      # Tracking number of commits in `git` is better that tracking version numbers (specifically for Seiva's coding style (W.I.P.) that is done on-the-go using termux and smartphone. Changing the code ALL the time)
         f_count_nr_branch_commits  
   fi
}

function f_curl_uploads_count {

   # Description: Counts how many uploads were made to GitHub.com

   f_talk; echo "uploads counter"

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

function f_print_invalid_items {
   # Fx that prints both non-repos and files

   f_talk; echo "Invalid directories and files at (DRYa-REPOS-CENTER): "

   # Print non-repos
      for i in $v_non_repo
      do
         echo " > [dir] $i/"
      done


   # Print `echo` only if both variables exist (to make space between them)
      [[ -n $v_files ]] && [[ -n $v_non_repo ]] && echo


   # Print files
      for i in $v_files
      do
         echo " > [file] $i"
      done

   # Print a last echo (to distance from f_done)
      echo

}

function f_new_repo_step_0 {
   # Criar novo repositorio (from scratch, do zero)

   # Limpar ecra com welcome message
      f_greet

   # Asking repo name and `git init` repo
      f_new_repo_step_1

   # Criar e editar README file
      f_new_repo_step_2

   # Creating a remote, and pushing to it
      f_new_repo_step_3 

   # Verbose no fim
      f_talk; echo "Criada a repo: $v_name"
}

function f_new_repo_step_1 {
   # Asking repo name and `git init` repo

   # uDev: Perguntar se é repo publico ou privado

   f_talk; echo    "Creating new Repository (from scratch)"
           echo -n " > "
     f_c3; echo       '`mkdir -p .../new-name`'
     f_rc; echo
   f_talk; echo    "New repository name? (blank to cancel)"

           read -p " > " v_name

   # If no name is given, the whole process is aborted
      [[ -z $v_name ]] && echo "Aborted, name is required" && exit 1  # Abortar se o passo anterior nao foi usado pelo utilizador

   # Nome da repo que se pretende criar
      v_path=${v_REPOS_CENTER}/$v_name

   # Se ja existir algum repo com esse nome: Abortar
      [[ -d $v_path ]] && echo " > Abortado: Repo com esse nome ja existe" && exit 1
   
   # Se nao existir repo, criar do zero o diretorio e iniciar com git
      mkdir -p $v_path  &&  cd $v_path
      echo

      f_talk; echo -n "Initializing repo "
        f_c3; echo -n '`git init` '
        f_rc; echo               "at:"
              echo    " > $v_path"
              echo
        f_c1; git init
        f_rc; echo
}

function f_new_repo_step_2 {
   # Criar e editar README file


   function f_commit_readme {
      # Esta fx vai ser executada apenas se for decidido criar um ficheiro README
      f_c1; echo 
            git add --all
            git commit -m "Added README file"
      f_rc; echo
   }

   function f_create_txt_readme {
      f_talk; echo "Create README file?"
              echo " > Yes: .txt" 
              echo

      v_txt='Editar/Abrir README.org com `vim`' && f_anyK

      vim   $v_path/README.txt

      f_commit_readme
   }

   function f_create_org_readme {
      f_talk; echo "Create README file?"
              echo " > Yes: .org" 
              echo

      v_txt='Editar/Abrir README.org com `emacs`' && f_anyK

      emacs $v_path/README.org

      f_commit_readme
   }

   function f_create_md_readme {
      f_talk; echo "Create README file?"
              echo " > Yes: .md" 
              echo

      v_txt='Editar/Abrir README.md com `vim`' && f_anyK

      vim   $v_path/README.md

      f_commit_readme
   }

   function f_do_not_create_readme {
      f_talk; echo "[Nao] Nao sera Criado README file"
              echo 
   }

   function f_esc_do_not_create_readme {
      # If user escaped fzf menu with Esc Key, use this message instead
      f_talk; echo "[Esc] Nao sera Criado README file"
              echo 
   }

   # Lista de opcoes para o menu `fzf`
      L4='4. Sim | .md'                                      
      L3='3. Sim | .txt'                                      
      L2='2. Sim | .org'                                      
      L1='1. Nao'

      Lh="Repo name: $v_name"
      L0="ezGIT: Pretende criar README file? "
      
      v_list=$(echo -e "$L1 \n$L2 \n$L3 \n$L4" | fzf --cycle --no-info --header="$Lh" --prompt="$L0")

   # Perceber qual foi a escolha da lista
      [[    $v_list =~ $Lz3  ]] && echo "$Lz2" && history -s "$Lz2"
      [[    $v_list =~ "4. " ]] && f_create_md_readme
      [[    $v_list =~ "3. " ]] && f_create_txt_readme
      [[    $v_list =~ "2. " ]] && f_create_org_readme
      [[    $v_list =~ "1. " ]] && f_do_not_create_readme
      [[ -z $v_list          ]] && f_esc_do_not_create_readme
      unset  v_list
}

function f_new_repo_step_3 {
   # Creating a remote, and pushing to it

   v_mail=$(git config --get user.email)
   v_ramo=$(git branch | grep "*" | sed "s/\* //g")
   v_origin="git@github.com:$v_mail/$v_name.git"
   v_pwd=$(pwd)

   f_talk; echo "Variables for Remote and Origin:"
           echo " > branch: $v_origin"
           echo " > origin: $v_ramo"
           echo " > pwd:    $v_pwd"
           echo

   v_txt="Setting and Pushing Remote and Origin" && f_anyK
  
   # uDev: Set ...
      #git push --set-upstream origin main # Se apagarmos esta linha, o git vai dar uma msg de erro a informar como se automatiza isto no .gitconfig

   f_c1; echo
         git remote add origin $v_origin
         git push   -u  origin $v_ramo
   f_rc
}

function f_dot_file_install_gitconfig {
   bash ${v_REPOS_CENTER}/DRYa/drya.sh dot install git
}

function f_git_add_regex {
   # Fx for `G + *regex-file-to-add-for-commit*`  # Adding file without they full name

   # Using drya-lib-2 to create a temporary file. We call `f_create_tmp_file` and it will return an absulute path to a new file at $v_tmp
      f_create_tmp_file
      #echo $v_tmp  # Debug

   # Getting the list to files to be commited

      rm $v_tmp

      for i in $(git status --short | cut -f 3 -d " ")
      do
         echo $i >> $v_tmp
      done


      for i in $(grep "$v_arg2" $v_tmp)
      do
         echo " > $i"
         git add $i
      done

      echo
      f_git_status
}

function f_prsP_to_upload {
   # Press P to upload commits

   # Asking for 5 seconds if the user wants to push the code to github.com
      f_talk; echo -n "Do you want to send to github.com? "
        f_c3; echo    '`git push`'
        f_rc; echo " > Press any key to abort (wait 5 seconds)"
              echo -n " > To upload, press: "

        f_c2; read -s -N 1 -t 5 -p "P " v_ans
        f_rc; echo

   if [ -z $v_ans ]; then
      # If, after the prompt for "commit message" the time expires or the Field is left blank, then Uploading is aborted
      echo
      f_done

   elif [ $v_ans == "p" ] || [ $v_ans == "P" ]; then
      # If valid key "p" was given
      
      echo
      f_stroken_centralized
      f_git_push
      f_git_status
      f_done

   else
      # If invalid key was given
      echo
      echo
      f_done

   fi

}

# -----------------------------------------
# -- Functions above --+-- Arguments Below 
# -----------------------------------------







# Before evaluating ezGIT arguments:
   # uDev: Improve txt by creating fx for each line
   
   # Check if git and .gitconfig exists. If not, configure it
      [[ ! -f ~/.gitconfig ]] && f_git_config_missing

   # Check if variable ${v_REPOS_CENTER} is configured. Othewise, inform
      [[ -z ${v_REPOS_CENTER} ]] && f_greet && f_talk && echo 'Variables missing (this may be a problem)' && echo ' > $v_REPOS_CENTER ' && echo '   (It defines a centrar directory where repos are stored)' && read -sn1


         
if [ -z "$*" ]; then
   # Do something else if there are no arguments

   f_greet

   f_talk; echo "No arguments were given"
           echo
   f_talk; echo "Some help:"
           echo ' > To Open  ezGIT fzf Main Menu: `G m`'
           echo ' > To print ezGIT instructions:  `G h`'
           echo ' > To print ezGIT all configs:   `G cf h`'
           echo

   #git config --list

   #f_horizontal_line

   v_user=$(git config --get user.name)
   v_mail=$(git config --get user.email)

   f_talk; echo "User Name @ Host Machine (for github commits)"
           echo -n " > "
     f_c3; echo $v_user
     f_rc; echo 
   f_talk; echo "User mail @ github.com"
           echo -n " > "
     f_c3; echo $v_mail
     f_rc; echo

   # uDev: Give random instructions about how ezGIT works, no need to go and read the man pages
   
elif [ $1 == "h" ] || [ $1 == "-h" ] || [ $1 == "--help" ] || [ $1 == "?" ] || [ $1 == "-?" ]; then
   # Same as if no arg are given: Display help menu
      f_instructions

elif [ $1 == "eg" ]; then
   # Do something if arg 1 is equal to "eg" (a test):
      echo "you don\'t need to source G.sh at the file \"source-all-drya-files\""
      echo "Start using if conditions instead"

elif [ $1 == "stroken" ]; then
   # Print stroken even if .netrc exists (requires drya-lib-4)
   f_stroken_print

elif [ $1 == "github" ]; then
   # Open web bowser and navigate to githbu.com

   # uDev: Use traitsID

   xdg-open http://www.github.com

elif [ $1 == "psswd" ]; then
   f_stroken_centralized

elif [ $1 == "byte-compile" ]; then
   # Convert bash to binary
   # Send to /usr/bin
   # (for speed purposes)
   # One tutorial: https://www.baeldung.com/linux/convert-script-into-binary

   f_talk; echo "byte compile current version of ezGIT for speed reasons (uDev)"

elif [ $1 == "config" ] || [ $1 == "cf" ]; then
   # Confirming that configurations exist
    
   # Presenting ezGIT
      f_greet

   # uDev: 'G config ^' edits .gitconfig on DRYa repo
   # uDev: 'G config v' edits .gitconfig on the machine at $HOME
   # uDev: 'G config m' edits .confif/h.h/.gitconfig+machine to identify traitsID for this machine of the same user
   # uDev: 'G config h' listas all configs

   # To read better, put our spetial files into variable
      # At DRYa's repo
         v_drya_file="${v_REPOS_CENTER}/DRYa/all/etc/dot-files/git-github/.gitconfig"

      # Locally at ~/
         v_users_file=~/.gitconfig

   if [ -z $2 ]; then
      # Help, verbose instructions

      f_talk; echo "G config"
              echo 
              echo "Editing .gitconfig file"
              echo " > You need to specify: 'G config ^' (edit centrally (at DRYa's repo))"
              echo " >                  or: 'G config v' (edit locally only)"
              echo " >                  or: 'G config i' (install .gitconfig file)"
              echo " >                  or: 'G config m' (edit extra stuff, machine specific)"
              echo " >                  or: 'G config h' (list all configs)"
              echo 

   elif [ $2 == "^" ]; then
      # Edit DRY's file

      # Verbose small explanation
         f_talk; echo "Opening git configurations file"
                 echo " > using with vim editor"
                 echo " > changes will be made inside DRYa repo and copied to HOME afterwards"
                 echo 

                 echo "Example of content inside ~/.gitconfig file:"
                 echo "[user]"
                 echo "      name = seivadarve"
                 echo "      email = flowreshe.seiva.d.arve@gmail.com"
                 echo 

         # uDev: Replace timmer with: "Press Enter"
            read -s -t 3 -n 1

      # Edit file at it's Origin (inside DRYa's repo)
         vim $v_drya_file

      # Replacing the old file (at user's local machine) with the new edited one from DRYa's Repo:
         cp $v_drya_file ~ && echo -e "ezGIT: Changes were applied both places\n > On DRYa repository\n > On this machine at HOME: ~"

         echo
         echo "uDev: traitsID is not ready (to append this machine's name to local config - for the same user"

   elif [ $2 == "v" ]; then
      # Edit local file
         # uDev: Add verbose: "Press Enter"
         vim $v_users_file

   elif [ $2 == "i" ]; then
      # Installing .gitconfig using fx inside drya.sh

      # uDev: if repo DRYa does not exist, ask user to clone it

      f_dot_file_install_gitconfig

   elif [ $2 == "m" ]; then
      # For the same user with diferent devices, lets identify this device on the configs, to be listed on '$ git log' and apretiate on git's history which machine/device did what job
      # uDev: Add verbose: "Press Enter" when this fx gets developed
         
      f_talk; echo "uDev: Identifying this machine with traitsID for the same user is not ready"


   elif [ $2 == "h" ]; then
      f_talk; echo "Instructions:"
              echo
              echo "Para verificar o nome atual:"
              echo ' > `git config --global user.name` '
              echo
              echo "Para alterar o nome atual:"
              echo ' > `git config --global user.name "novo-nome"` '

   else
      f_talk; echo "Invalid function, or uDev"

   fi
   



   # uDev: Create a file at ~/.config/h.h/ezGIT/ with data from "uname -a"

elif [ $1 == "." ]; then
   # Git status (for current repo or for all)

   # uDev: Remind the user if there are stashed content
   #       List of stashed changes: git stash list
   #       Remove/delete last stashed item: git stash drop
   #       Drop/delete all stashed items: git stash clear
   
   # uDev: Perform git fetch before git status
   
   # uDev: Tell the user if "encript before push" + "decript after pull" is "on" (detects a directory .git-encrypt/ in the tree
 
   # uDev: After counting branch names, also tell Directory size in Mega Bytes

   if [[ -z $2 ]]; then
      # If only 1 arg is given: `G .` then `git status` only to current repo

      # Instructions: 3 possibilities when calling `G .`
      #  1. fx runs if: is root directory where all repos are found
      #  2. fx runs if: is not root directory where all repos are found
      #  3. fx runs if: outside a valid repository (somewhere else in the file system)
      #  4. fx runs if: inside a valid repository
      
      f_greet 

      if [[ $(pwd) == ${v_REPOS_CENTER} ]]; then 
         # 1. if we are exactly at the Repos Center. 
         #    For sure we are not inside a repo, 
         #    ... Listing all repos here

         f_git_status_nr_1_all_repos_root
            


      else  
         # 2. If we are not at Repos Center
         #    we may be either further into repositories sub-folders
         #    or outside even the root of repos
         #    We must detect which one it is now
         #    ... Starting to filter

         f_git_status_nr_2_not_all_repos_root

      fi

      # Nice verbose finish
         f_done

   elif [ $2 == "2" ]; then
      # Outputs a second option for git status, without f_greet
      f_git_status

   elif [ $2 == "short" ] || [ $2 == "s" ]; then
      # Outputs the shortest list of modified/added/etc... files without the verbose output of the app `git`
      git status -s 

   elif [ $2 == "all" ] || [ $2 == "A" ] || [ $2 == "a" ]; then
      # Whenever code complexity is found, a function is created to enable better code reading
         f_git_status_recursive
      
      # uDev: At windows, if git does not have this config (see line below), then this function will not take effect:
         # git config --global --add safe.directory /mnt/c/Repositories/upK

   elif [ $2 == "detect-invalid-objects" ] || [ $2 == "d" ]; then
      echo "uDev: Detect and mention if there are invalid directories and files at (DRYa-REPOS-CENTER) that are not repositories"

   else 
      f_talk; echo "command not known"
              echo " > For help: G h"
   fi

elif [ $1 == "alias" ]; then
      vim ${v_REPOS_CENTER}/ezGIT/all/etc/config-bash-alias

elif [ $1 == "k" ] || [ $1 == "gkp" ] || [ $1 == "kp" ]; then
   # Create a file .gitkeep
      touch .gitkeep && f_talk; echo "file .gitkeep was created"

elif [ $1 == ".." ] || [ $1 == "!" ] || [ $1 == "log" ]; then
   # git log options
   
   if [ -z "$2" ]; then
      # If no arg is given, show normal git log

      f_greet
      f_talk; echo -n 'Show entire git log '
        f_c3; echo    '`git log`'
        f_rc; echo

      f_test_if_currently_at_any_repo

      git log

   elif [ $2 == "1" ]; then
      # git log (but in one line)

      f_greet
      f_talk; echo -n 'Show entire git log with single lines '
        f_c3; echo    '`git log --oneline`'
        f_rc; echo

      f_test_if_currently_at_any_repo

      git log --oneline

   elif [ $2 == "l" ]; then
      # git log (but only last commit message in one line)

      f_greet
      f_talk; echo    'Show only last line of git log with 1 single line '
              echo -n ' > '
        f_c3; echo       '`git log --oneline | head -n 1`'
        f_rc; echo


      f_test_if_currently_at_any_repo


      # Save last commit message for text manipulation
         v_last_commit=$(git log --oneline | head -n 1)

         v_ID=$(echo "$v_last_commit" | cut -d " " -f 1)

         f_talk; echo "Last commit Hash was: "
           f_c3; echo " > $v_ID"
           f_rc; echo

         v_commit=$(echo "$v_last_commit" | sed "s/$v_ID //g")

         f_talk; echo "Last commit message was:"
                 echo -n ' > '
           f_c3; echo       "$v_commit"
           f_rc; echo

   fi

elif [ $1 == "watch" ] || [ $1 == "8" ]; then
   # This function allows the user to open a second terminal to watch live what is changing in the git log tree.
   watch -ct -n1 git --no-pager log --color --all --oneline --decorate --graph

elif [ $1 == "msg" ]; then
   # Create a while loop to send and receive messages between 2 ezGIT machines
   # uDev: sugestion: use irssi (IRC Client)

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
      
      f_git_add_all

      v_date=$(date)

      git commit -m "$v_date"

      f_stroken_centralized

      f_git_push

      cd $vv

   elif [ $2 == "receive" ]; then
      # uDev: rm repo entirely 'scratch-paper' is a possibility, then clone it back in with info. Then open the text file  
      # uDev: if git status sais that there are no modifications, git pull
      # uDev: if git status sais that there are modifications, warn user about it
      echo "receiving is not ready yet (uDev)"

   elif [ $2 == "edit" ]; then
     vim ${v_REPOS_CENTER}/scratch-paper/some-text.txt 

   else
      f_talk; echo "G msg: Choose 'send' or 'receive'"
   fi

elif [ $1 == "install" ]; then
   echo "uDev: If DRYa does not install this repo, it would install itself"

elif [ $1 == "+!" ] || [ $1 == "squash" ]; then
   # Not only commits these staged files, but also squashes with the previous commit
   # This is usefull when our next commit should be past of our last commit and we forgot. Now we are adding stuff to our last commit
   # uDev: Tell ezGIT how many previous commits to squash into a single one

   echo "uDev: Squash options are not ready yet"
   echo ' > Tutorial: https://youtu.be/V5KrD7CmO4o?si=xL4OiMt6Avjuxnt7'

elif [ $1 == "multi" ]; then
   # Git commit multiple messages

   f_greet 

   f_git_status

   f_c2; echo -e "\ngit commit multiple messages"
   f_rc; echo 

   declare -a messages
   declare n=1

   while true; do
      read -p "Insert commit n.$n: " v_ans

      [[ $v_ans == "done" ]] && break
      
      messages+=$v_ans

      for i in ${messages[@]}; do
         echo -e "$i\n"
      done

      ((n=n+1))
   done

elif [ $1 == "count" ] || [[ $1 == "n" ]]; then

   if [[ -z $2 ]]; then
      # Instructions if no more args are given
      f_talk; echo "This fx is meant to count how many uploads to github.com happened in a specific day"
              echo ' > `G n ^`    Counts uploads made to github.com on a certain date'
              echo ' > `G n .`    Counts git commits made to current repo on current branch'
              echo ' > `G n . A`  Counts git commits made to current repo on all branches'

   elif [[ $2 == "^" ]] || [[ $2 == "uploaded" ]]; then
      # Counts uploads made to github.com on a certain date
      f_greet
      f_curl_uploads_count

   elif [[ $2 == "." ]] || [[ $2 == "current-branch-total-commits" ]]; then
      # Counting number of git commits (current repo)

      if [ -z $3 ]; then
         # Counting total git commits for current branch (current repo)
         f_count_nr_branch_commits


      elif [[ $3 == "A" ]] || [[ $2 == "all-branches-total-commits" ]]; then
         # Counting total git commits for all branches (current repo)
         v_num=$(git rev-list --count --all)
         f_talk; echo "Total number of git commits in this entire reporitory including other branches"
                 echo " > $v_num"

      fi
   fi


# elif [ $1 == "raspberry bare repo" ]; then
   # Adds a raspberry pi as a remote git repositorynand we push changes there instead of github.com

elif [ $1 == "export-git-log" ]; then
   echo "uDev: Export with dates, all the git log to a file"
   echo "      This might be usefull if you want to delete the repo"
   echo "      and open a new one with the same name"
   echo "      Sometimes passowrd are commited and your only safety is"
   echo "      to delete all the git log that reveals it by digging the past"
   echo
   echo "      by exporting this log, you might commit just the text in the"
   echo "      new repo"

elif [ $1 == "repo" ]; then

   if [ -z $2 ]; then

      Lz1='Save '; Lz2='ezGIT new'; Lz3="$Lz1\`$Lz2\`"; Lz4=$v_drya_fzf_menu_hist

      L5='5. Help'
      L4='4. echo | Repos Center (variable)'
      L3='3. Push existing new repo (uDev)'
      L2='2. New repo (from scratch) (uDev: usar `gh` para remote)'

      L1='1. Cancel'

      L0="ezGIT: What NEW thing do you want? "
      
      v_list=$(echo -e "$L1 \n\n$L2 \n$L3 \n$L4 \n$L5 \n\n$Lz3" | fzf --no-info --pointer=">" --cycle --prompt="$L0")

   # Perceber qual foi a escolha da lista
      [[ $v_list =~ $Lz3  ]] && echo "$Lz2" && history -s "$Lz2"
      [[ $v_list =~ "5. " ]] && echo "uDev: $L5" 
      [[ $v_list =~ "4. " ]] && echo "${v_REPOS_CENTER}/" 
      [[ $v_list =~ "3. " ]] && echo "uDev: $L3" 
      [[ $v_list =~ "2. " ]] && f_new_repo_step_0
      [[ $v_list =~ "1. " ]] && echo "Canceled: $Lz2" && history -s "$Lz2"
      unset v_list
    


   elif [ $2 == "new" ] || [ $2 == "+" ]; then
      # Create new repository
      f_new_repo_step_0

   elif [ $2 == "rc" ]; then
      # Repo's center
      cd ${v_REPOS_CENTER}/

   elif [ $2 == "help" ] || [ $2 == "h" ] || [ $2 == "?" ] || [ $2 == "--help" ] || [ $2 == "-h" ] || [ $2 == "-?" ] || [ $2 == "rtfm" ]; then
      # Instructions

      f_greet

      echo "How to manually make a repo:"

      f_hzl  # Horizontal line:
      echo

              echo 'Source: https://gist.github.com/alexpchin/dc91e723d4db5018fef8'
              echo 
              echo '# Setting up a new Git Repo'
              echo '   ## Create a new repository on the command line'
              echo '      $ mkdir <name-of-repo>'
              echo '      $ cd <name-of-repo>'
              echo '      $ touch README.md'
              echo '      $ echo "Hello World! This is a new repo!" > <name-of-repo>'
              echo '      $ git init'
              echo '      $ git add README.md'
              echo '      $ git commit -m "my first commit"'
              echo '      $ git remote add origin git@github.com:<user-github-name>/<reponame>.git'
              echo '      $ git push -u origin master'
              echo 
              echo '   ## Push an existing repository from the command line'
              echo '      $ git remote add origin git@github.com:<user-github-name>/<reponame>.git'
              echo '      $ git push -u origin master'
              echo
      f_hzl  # Horizontal line:
              echo "Note: If DRYa exists in the system, ezGIT can create all repos by default at:"
              echo " > ${v_REPOS_CENTER}"

   else

      f_greet
      f_talk; echo "Option not valid"
              echo " > try: G new ?"

   fi


elif [ $1 == "cm" ] || [ $1 == "commit" ]; then
   # Ask the user for a commit message (for staged files)
   # uDev: Test first if actually there are staged files

   f_greet

   f_git_status
   f_git_commit
   f_git_status

# elif [ $1 == "recognize-repo" ]; then
   # RECOGNIZE REPOSITORY: OFF (may read repo's script dedicated to be read by ezGIT)

elif [ $1 == "+" ]; then
   # 1. Test if $2 was specified
   # 2. git add $2
   # 3.  -------- Ask if user wants git diff: NOPE, USE `G =` INSTEAD
   # 4. git status
   # 5. git commim -m "i" 

   # uDev: if $2 is ^ then like 'G + ^' then, git commit staged files

   function f_no_file_found {
      f_talk; echo "No file name given. "
              echo " > Insert at least 1 file name."
      #uDev: If no file is given, do a git diff --staged
   }

   f_greet

   # If arg $2 is empty, ask for one: abort
      [ -z $2 ] && f_no_file_found && exit 1

   # Bug fix: Add all files except the arg $1 which is '+'
      # When git adding files, we want 'G' to add all files input as arguments. 
      # BUT there is one prombem: '+' is the input value that indicates 'git add'. 
      # Therefore, the the second arg '+' is not discarded, then 'git add' will throw an error saying 
      # "there is no such file called '+'. The next line of code lists all arguments starting at 
      # arg $2 wich is '+'
      git add ${*:2}  2>/dev/null  # We are throwing the error messages to /dev/null because we fix it beautifully on the next line

   # If arg $2 is not a known file: abort
      if [ $? == "128" ]; then 
         f_talk; echo "File name not found"
                 echo "Please add a list of file names correctly"

         exit 1
      fi

   # For each argument given starting at arg 2, list it colorfully
      for i in ${*:2}; do

         f_talk; echo -n "git add "
           f_c1; echo $i
           f_rc

      done



   # Asking if the user wants 'git diff'
            echo
      f_c2; echo -e "Do you want to see the differences between the 2 files?"
            echo    "(the Last + Current version) "
      f_rc; echo    " > If no, press Any key"
            echo -n " > If so, press: "
      f_c2; echo                     "D"
            echo
      
      v_txt='git diff (staged)' && f_prsD
      echo

      if [ -z $v_ans ]; then
         f_talk; echo "User did not choose to see differences"

      elif [ $v_ans == "d" ] || [ $v_ans == "D" ]; then
         git diff --staged

      fi

      echo
      f_git_status
      f_git_commit
      f_git_status

elif [ $1 == "++" ]; then
	# 'git add --all' + 'git status' + 'git commim -m "" '

   # If no $2 is found, enable the user to write a commit message.
   # If one $2 variable is found, commit message accordingly automatically

   # uDev: Esta fx (e outras semelhantes) tem de testar primeiro se estao atualmente dentro de um repo

   # Variables for the automatic messages
      v_aut_message="Pushed to github.com automatically (by ezGIT app)"
      v_aut_commit="Commiting automatically (by ezGIT app)"
      v_aut_udev="Imp: (added/modified/etc.) made only around uDev comments (by ezGIT app)"
      v_aut_same="Commiting (auto): Same as last commit (by ezGIT app)"
      v_aut_txt="Imp on text: Spelling, Explanations, Typos... (by ezGIT app)"

   if [ -z $2 ]; then

      f_greet

		f_talk; echo -n 'Staging all and commiting: '
        f_c3; echo    '`G ++`'
        f_rc; echo

      f_git_add_all  # Git add --all

      f_git_status

      f_git_commit   # Git commit -m "i"

      f_git_status

      f_prsP_to_upload

   elif [ $2 == "b" ] || [ $2 == "blind-upload" ]; then
      # Blind update, variable "b"
      # udev: Create a v_aut_message just to update the git log (like a time stamp on git log)

      f_greet

      if [ -z $3 ]; then
         f_blind_brain

      elif [ $3 == "2" ]; then
         # Second version of blind, only commits (for the alias `gcmb`)
         f_talk; echo "Only commit as: blind commit (automatic, no upload)"
                 echo

         f_git_status

         f_talk; echo    "Commit Message:"
                 echo -n " > "
           f_c3; echo       "$v_aut_commit"
           f_rc; echo

         git commit -m "$v_aut_commit"
                 echo

         f_git_status

      elif [ $3 == "A" ]; then
         # Recursively push ALL automatically

         cd ${v_REPOS_CENTER}

         for i in $(ls); do 
            # Filter directories from files
               v_object_type=$(file $i)

            # If the variable v_object_type returns a directory, we navigate into it
               if [[ $v_object_type =~ "dir" ]]; then 
                  cd $i
               
                  
               f_blind_brain



            # Saving the git status into a variable without outputing it to the screen
               # It sends an error if dir is not repository. Therefore we send Sandard error do /dev/null
               s=$(git pull)  ## Or: s=$(git pull 2>/dev/null) 

            # Navigating backwards before restarting the 'for loop' 
               cd ..
               fi
            done
      fi


   elif [ $2 == "u" ] || [ $2 == "udev" ]; then
      # Update adding only uDev comments, variable "u"

      f_greet

      if [ -z $3 ]; then
         # Sending automatically everything with an automated commit message
            # Message to use as commit: $v_aut_udev

         f_talk; echo -n "Running: "
           f_c3; echo -n "'uDev'"
           f_rc; echo -n " or "
           f_c3; echo -n "'u'"
           f_rc; echo

                 echo -e " > Commits and pushes all contents of the repo fully automatic "
                 echo

         f_talk; echo "Default commit message:"
                 echo -n " > "
           f_c1; echo "$v_aut_udev"
           f_rc; echo

         f_git_add_all && echo " > Done!"

                 echo
         f_talk; echo "Creating an automatic commit"
                 git commit -m "$v_aut_udev"
                 echo

         f_git_status

         f_stroken_centralized

         f_git_push

         f_git_status

                 echo
         f_talk; echo "All Done!"

      elif [ $3 == "2" ]; then
         # Second version of uDev automatic commit, only commits (for the alias `gcmu`)

         f_talk; echo "Only commit as: udev commit (automatic, no upload)"
                 echo

         f_git_status

         f_talk; echo    "Commit Message:"
                 echo -n " > "
           f_c3; echo       "$v_aut_udev"
           f_rc; echo

         git commit -m "$v_aut_udev"
                 echo

         f_git_status
      fi


   elif [ $2 == "s" ] || [ $2 == "same" ] || [ $2 == "same-as-last-commit" ]; then
      # Update adding only info that is about the same as last commit
      # uDev: Squash automatically with last commit

      f_greet

      if [ -z $3 ]; then
         # Sending automatically everything with an automated commit message
         # --- Message to use as commit: $v_aut_same

         f_talk; echo "running 's' or 'same-as-last-commit':"
                 echo -e " > Commits and pushes all contents of the repo fully automatic "
                 echo

         f_talk; echo "default commit message:"
                 echo -n " > "
           f_c1; echo "$v_aut_same"
           f_rc; echo

         f_git_add_all && echo " > Done!"

                 echo
         f_talk; echo "Creating an automatic commit"
                 git commit -m "$v_aut_same"
                 echo

         f_git_status

         f_stroken_centralized

         f_git_push

         f_git_status

                 echo
         f_talk; echo "All Done!"

      elif [ $3 == "2" ]; then
         # Second version of "same" automatic commit, only commits (for the alias `gcms`)

         f_talk; echo "Only commit as: 'same as last commit' (automatic, no upload)"
                 echo

         f_git_status

         f_talk; echo    "Commit Message:"
                 echo -n " > "
           f_c3; echo       "$v_aut_same"
           f_rc; echo

         git commit -m "$v_aut_same"
                 echo

         f_git_status
      fi


   elif [ $2 == "t" ] || [ $2 == "txt" ] || [ $2 == "improvements-on-text" ]; then
      # Sending automatically everything with an automated commit message
      # --- Message to use as commit: $v_aut_txt

      f_greet

      f_talk; echo "Running 't' or 'improvements-on-text':"
              echo -e " > Commits and pushes all contents of the repo fully automatic "
              echo

      f_talk; echo "Default commit message:"
              echo -n " > "
        f_c1; echo "$v_aut_txt"
        f_rc; echo

      f_git_add_all && echo " > Done!"

              echo
      f_talk; echo "Creating an automatic commit"
              git commit -m "$v_aut_txt"
              echo

      f_git_status

      f_stroken_centralized

      f_git_push

      f_git_status

              echo
      f_talk; echo "All Done!"


   elif [ $2 == "!" ]; then
      f_greet 
      f_talk; echo    "uDev: Option to commit current state and automatically squash it with the previous commit"
              echo
      f_talk; echo    "Previous commit was:"
              echo -n " > "

      git log --oneline | head -n 1

   else
      # If the arg given is not recognized as a saved git-commit-message, then:
      f_talk; echo "the last arg is not recognized"

      # uDev: add a feature to add more git-commit-messages
   fi

elif [ $1 == "+++" ]; then
   # Using regex to `git add` files

   f_greet
   f_talk; echo "git add files with regex:"
           echo " > Testing if pattern exists using regex (using \`grep *$2*\`)"
           echo

   # Adding an fx to allow adding with regex: *name-here-* or `grep "name-here-"`
   # uDev: add similar fx to `G - *regex*`
      v_arg2=$2        # Saving argument 2 to a var
      f_git_add_regex  # Test if such abreviation exists


   v_txt="See \`git diff\` to staged files"; f_anyK

      git diff --staged
    
elif [ $1 == "-" ]; then 
   # unStages a file or all files


   if [ -z $2 ]; then         # Note: ezGIT allows 'G -' and 'G - all' to unstage all files, but the command is same, simply: 'git reset' 
      # Unstage all files
         f_unstage_all

      # Git status
         f_git_status


   elif [ $2 == "all" ]; then   # Note: ezGIT allows 'G -' and 'G - all' to unstage all files, but the command is same, simply: 'git reset' 
      # Unstage all files
         f_unstage_all

      # Git status
         f_git_status

   else
      # Unstage specific file given by the user
      # uDev: The user might give more than one file to unstage, $3 $4 $5 etc... So, a `for` loop must be added: For i in (all arfs expect $2, do, unstage)

      f_greet

      # Git reset (unstage)
         f_talk; echo -n "git reset "
           f_c1; echo -e "$2"
           f_rc

      # uDev: unstage all files given as args besides $1. the argument $1 '-' is not a file. (See 'G +' where this line of code already works)
      # uDev: tem de ser visto os bugs caso sejam dados nomes de ficheiros errados tal como na funcao: G + <nome-errado>
         git reset $2

      # Git status
         f_git_status
   fi

elif [ $1 == "--" ]; then 
   # Discard changes in a file or all files (restores working dir to its previous commit)

   # uDev: Ask if user is sure before discarding chenged files
   # uDev: Ask if user wants to delete untracked files
   
   v_txt="Discard changes in one or + files?"; f_anyK
   echo

   if [ -z $2 ]; then
      # Restore work dir to previous commit (fully, to all files)
         f_greet

         f_talk; echo -n 'Discarding all changes locally '
           f_c3; echo    '`git restore .`'
           f_rc

         git restore .
         echo

      # Git status
         f_git_status
 
   elif [ $2 == "!" ]; then 
      # Para quando temos modificacoes locais + remotas ("modified by both...") e queremos descartar essas alteracoes locais
      git reset --hard origin/main
      echo

      f_git_status

   else 
      # Restore only the specified file to its original state

      # uDev: Se o arg $1 nao for o unico (ou seja, se ecistir mais args apos "--") entao podemos iterar todos os arg menos no arg $1, para isso, podemos remover o arg $1 com o comando `shift`

         f_greet
         f_talk; echo 'Discarding changes locally `git restore .`'
                 echo -n ' > To file: '
           f_c1; echo    "$2"
           f_rc; echo

         git restore $2

      # Git status
         f_git_status
   fi

elif [ $1 == "---" ]; then
   # Undo the last git commit when it is ready to upload to github. But keeps the changes in the staging area ready to commit again

   f_greet

   f_talk; echo "Undoing last commit"
           echo 
           echo "Last commit:"
   
   v_last=$(git log --oneline | head -n 1)

           echo " > $v_last"
           echo

   v_txt="Undo last commit?"; f_anyK
   echo

   f_talk; echo -n "Undoing last "
     f_c3; echo    '`git commit`'
     f_rc; echo 

   f_git_status

   git reset --soft HEAD~1
   
   f_git_status
   f_done

elif [ $1 == "+-" ]; then
   # git commit --ammend
      # Used in cases where you want to update your last commit (for example you forgot a line of code or you found a bug that you can easily fix. 
      # It is usefull to keep the git log clean and easy to read.
      # If you didn't use this option, the are many times creating 3 commits to accomplish things you wanted to do imediatly at the first try
      # This also avoids git commits -m "same as last commit" because the new commit merges with the last one
   # It can also change the last commit message

      f_greet

		f_c2
         echo "git commit --amend? (press anter to confirm)"
		f_rc
         echo " > Remember: This merges staged files: do you have any?"

      git commit --amend

      #uDev: if you do not need to change the commit message, then you can even do git commit --amend --no-edit
      #uDev: to change the commit message on the terminal without text editor: git commit --ammend -m "new commit message"
      #uDev: if you want to ammed a commit that was ALREADY PUSHED to github there is a method: (warning doind this when working as a team od developers, because it may erase code): ammed you repo locally and then: "git push -f origin main"



elif [ $1 == "v" ] || [ $1 == "pull" ]; then
   # git pull (Download updates from github)

   # uDev: Se forem detetadas alteracoes em source-all-drya-files ou qualquer script em .../DRYa/all/init-bin/ que carrege alias para o env atua, e que apos `git pull` precise de `source ~/.bashrc` entao ezGIT convem informar

   if [[ -z $2 ]]; then

      f_greet 
   
      f_stroken_centralized

      f_talk; echo -n "You are about to: "
        f_c2; echo                      "git pull"
        f_rc; echo -n " > Are you sure? (Press ANY key to confirm) "

         read -sn 1 

      # uDev: Usar ANSI para apagar toda a linha, em vez de usar espacos em branco
      echo -e "\r > Starting git pull...                          "

      git pull
      echo

   # Git status
      f_git_status

   elif [[ $2 == "all" ]] || [[ $2 == "A" ]] || [[ $2 == "a" ]] ; then

      # For `G v A .` we need this next fx. It is meant to pull all repos and then see the status just to see which one is out of alignment
      if [[ -z $3 ]]; then
         f_git_pull_recursive

      elif [[ $3 == "." ]]; then
         f_git_pull_recursive
         f_git_status_recursive

      else
         f_instructions
      fi

   fi


elif [ $1 == "V" ] || [ $1 == "pull-without-asking" ]; then
   # git pull (without asking the user if he is sure to download

   if [[ -z $2 ]]; then

      f_greet 
   
      f_stroken_centralized

      f_talk; echo -n "You are about to: "
        f_c2; echo                      "git pull"
        f_rc; echo    " > Without asking confirmation"

      # uDev: Usar ANSI para apagar toda a linha, em vez de usar espacos em branco
      echo -e "\r > Starting git pull...                          "
      echo

      git pull
      echo

   # Git status
      f_git_status
   fi


elif [ $1 == "vv" ] || [ $1 == "fetch" ]; then
   # 'G vv' fetch changes
   # It may exec specific scripts inside the current repo (for example at DRYa to update the entire system includim other repos)

   if [[ -z $2 ]]; then

      f_greet
      f_git_fetch

   elif [ $2 == "loop" ] || [ $2 == "l" ]; then
      
      v_secs="10"  # Time it takes to restart the loop

      v_off=" > Currently OFF"
      v_on=" > Currently ON"
      v_state=$v_off

      while true
      do
         f_greet
         f_git_fetch

         # Download changes, if any
            [[ $v_state =~ "ON" ]] && [[ $s =~ "is behind" ]] && f_git_pull && f_git_status
         
                 echo
                 f_talk; echo "Press T to toggle automatic download (with git pull)" 
                 echo "$v_state"
                 echo

         f_talk; echo "Next loop in: $v_secs" 

         read -sn1 -t $v_secs v_key

         # Toggle automatic downloads On/Off
            [[ $v_key == "t" ]] && [[ $v_state =~ "OFF" ]] && v_state=$v_on  && continue
            [[ $v_key == "T" ]] && [[ $v_state =~ "OFF" ]] && v_state=$v_on  && continue
            [[ $v_key == "t" ]] && [[ $v_state =~ "ON"  ]] && v_state=$v_off && continue
            [[ $v_key == "T" ]] && [[ $v_state =~ "ON"  ]] && v_state=$v_off && continue

           
      done
   fi

elif [ $1 == "^" ] || [ $1 == "push" ]; then
   # Simple git push

   if [ -z $2 ]; then
      clear 
      f_greet

      f_stroken_centralized

      f_git_push

      f_git_status

   elif [ $2 == "A" ]; then

      f_git_push_recursive
      # f_talk; echo "Git pull Recursive"
      # shift
      # for i in $*; do
      #    f_git_push
      #    f_git_status
      # done
   fi



elif [ $1 == "," ]; then  
   # dee: Options for branches #566889

   # Ler nome do repositorio atual:
      v_name=$(basename $(pwd))

   # Ler ramo atual:
      v_ramo_atual=$(git symbolic-ref --short HEAD)

   function f_list_all_branches {
      # Mostra todos os ramos locais   
         while read -r branch
         do
            branches+=("$branch")
         done < <(git branch)

       # Exibe os ramos
          #echo "Ramos existentes:"
          for branch in "${branches[@]}"; do
              echo " > $branch"
          done
    }

   if [ -z $2 ]; then
      clear
      f_greet

      f_talk; echo -n "Current repo: "
              f_c1
              echo "$v_name"
              f_rc
              echo

      f_tell_current_branch

      f_talk
      echo "Listing all branches:"
      f_list_all_branches
      echo

      f_talk; echo "Listing all 'Remotes'"
      f_c1
      git remote -v  # This info is stored at .../.git/config
      f_rc


   elif [ $2 == "." ]; then
      echo "Qual é o ramo para o qual quer mudar?"
      read -p " > " v_ramo
      echo
      git checkout $v_ramo
      echo
      echo "uDev: alterar 'G , . v_ramo' apenas para 'G , ramo'"

   elif [ $2 == "v" ]; then
      # Dizer qual o ramo atual
      f_tell_current_branch

   elif [ $2 == "diff" ]; then
      # Ver as diferencas entre branches
      git checkout main
      echo
      echo "Qual é o ramo do qual quer ver as diferencas?"
      read -p " > " v_ramo
      echo
      #echo "Se juntassemos ambos os ramos num ficheiro de referencia"
      #echo "A vermelho será representado o que falta ao ramo 'main'"
      #echo "A verde é o que está..."
      git diff $v_ramo

   elif [ $2 == "-" ]; then
      # Delete a branch
      
      f_greet

      f_talk; echo "Going to checkout 'main' branch first:"
              echo

      f_talk; echo "Delete a branch from list:"
              f_list_all_branches
              echo

      f_talk; echo "Qual é o ramo a apagar?"
      read -p " > " v_ramo
      echo

      # Passar para o 'main' primeiro
      git checkout main && echo "Mudou para ramo 'main'. ENTER para apagar $v_ramo"
      echo
      
      git branch --delete $v_ramo && echo "Ramo $v_ramo apagado"
      echo

   elif [ $2 == "+" ]; then
      # Criar um novo branch

      f_greet

      # Perguntar o nome
         f_talk; echo "Creating a branch from the current branch: uDev"
         echo
         echo "What is the name of the new branch?"
         read -p " > " v_new
         echo
         git branch $v_new

      # Switch para o novo branch
         git checkout $v_new
         echo "Criou e mudou para o ramo: $v_new"

   elif [ $2 == "d" ]; then
      # Muda para o ramo 'dev'
      git checkout dev

   elif [ $2 == "m" ]; then
      # Muda para o ramo 'main'
      git checkout main

   #elif [ $2 == "merge" ]; then
   #   # Merges 2 branches
   #
   #   uDev: Sempre que 1 ramo seja convergido em 'main', perguntar qual vai ser a versao nova da app que está em main
         
   elif [ $2 == "all" ] || [ $2 == "A" ]; then

      f_talk; echo "Options for branches (uDev)"
              echo "see: https://www.nobledesktop.com/learn/git/git-branches"
              echo
      f_talk; echo "git local branches: G , v"

      git branch

              echo
      f_talk; echo "git remote branches: G , ^"

      git branch -r

              echo
      f_talk; echo "git local and remote: G , all"

      git branch -a

      echo; f_done

   elif [ $2 == "..." ]; then

      f_greet
      echo "ezGIT: Switch Back-n-Forward between 2 branches"
      git checkout

   elif [ $2 == "h" ]; then
      echo "Help: Telling what options there are for branches"
      echo
      echo "See all branches with: G , all"
      echo
      echo "Para mudar para o ramo <v_ramo>:"
      echo " > G , . v_ramo"

   else 
      f_talk; echo "Option not recognized"
   fi

elif [ $1 == "is-encript" ]; then
   # Info about the current directory (verbose version. # uDev: 'G ,,' for non verbose functionality) 
      # Tells if the current directory name is part of a list of names that may have a dedicated dir for encryption
         # Some repos will not be allowed do 'git push' with sensitive data exposed

      # Gives the name of the curent repository
         # If the current directori is not a repository, that is also mentioned

      f_tell_repo_name

   # uDev: Add an option to push changes ONLY FULLY ENCRIPTED like moedaz, where no sesnsitive personal data should be visible
      # OR, Detect a directory ".git-encrypt/" to encrypt before any push and to decrypt after every pull





# uDev: This topic of encryption is udev only because we need a 'stroken' file for it's automation
#
#elif [ $1 == "encript" ]; then
#   # Needs: sudo apt install gpg
#
#   # Encrypt
#      gpg -c file-name.txt  # Will duplicate the file and to the copy, and extention .gpg will be added: file-name.txt.gpg
#   
#   # To clear the caches password immediatly after
#      gpgconf --reload gpg-agent
#   
#   # Delete the original file
#      rm file-name.txt  # Keep the duplicated/encrypted: file-name.txt.gpg
#
#elif [ $1 == "decript" ]; then
#   # Needs: sudo apt install gpg
#
#   # Decrypt
#      gpg -d file-name.txt.gpg
#
#   # Delete the original file
#     rm file-name.txt.gpg  # Keep the duplicated/decrypted: file-name.txt

elif [ $1 == "upk" ]; then
   case $2 in
      v)
         f_greet

         f_talk; echo "Pulling requirements for upk stuff"
                 echo
         
         f_stroken_centralized

                 echo
         f_talk; echo "You are about to \"git pull\" all these repos:"
                 echo -n " > DRYa; upk; ezGIT; upK-diario-Dv ... "
         f_c2;   read -s -n 1 -p "Press any key to continue"
         f_rc;   echo
                 echo

         f_horizontal_line

         cd ${v_REPOS_CENTER}/DRYa          && echo "GIT PULL: DRYa"          && echo -n " > " && git pull && echo
         cd ${v_REPOS_CENTER}/ezGIT         && echo "GIT PULL: ezGIT"         && echo -n " > " && git pull && echo
         cd ${v_REPOS_CENTER}/upK           && echo "GIT PULL: upK"           && echo -n " > " && git pull && echo
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
         f_talk; echo "Fetching requirements for upk stuff"
         f_stroken_centralized
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

   if [ -z $2 ]; then
      f_talk; echo "Moving HEAD 1 commit below (previous one)"
              echo -n ' > Attach HEAD back with: '
        f_c3; echo    '`G 1`'
        f_rc; echo

      git checkout HEAD^1

   elif [ $2 == "n" ]; then
      # Voar para um commit anterior, alimentando o $3 com o hash curto
      # Exemplo: `G -1 71a1975`

      f_talk; echo "Moving HEAD then commit with the hash: $3"
      git checkout $3
   fi

elif [ $1 == "+1" ]; then

   f_talk; echo "Moving HEAD 1 commit above (next one)"
           echo -n ' > Attach HEAD back with: '
     f_c3; echo    '`G 1`'
     f_rc; echo

   git log --reverse --pretty=%H main | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout 

elif [ $1 == "1" ] || [ $1 == "reset-head" ]; then
   # when you are navigating/exploring/browsing older commits and you are finished, if no changes were applying and there is no need for more navigation, this is the command ends the navigation and brighs back normality

   f_greet

   f_talk; echo -n 'Comming to most Updated branch: '
     f_c3; echo    '`git checkout main`'
     f_rc

   git checkout main
   echo
   
   f_git_status

elif [ $1 == "apply-current-commit" ]; then

   echo

   # We use this when we mess up in a previous commit and after that, when navigate back to the previous/unchanged/un-messed up commit and we what to apply that commit
   # source: https://stackoverflow.com/questions/13956207/how-can-set-an-older-commit-to-be-head
   
   # 1 - Find/save the commit hash using 'git log' and 'git checkout HEAD^1 ' 
   # 2 - 'git checkout main' to restore head to it normal place (still with the bug)
   # 3 - 'git reset --hard <commit-hash-here> ' To fix the repository to the desired state with the older commit
   # 4 - 'git push --force-with-lease' to push it to the remote

   # udev: 1 - using 'G -1' to navigate to the previous commit
   #       2 - using 'G fix-to-current-commit' will: 1 - '$ git log | head -n 5 > tmp.txt' 
   #                                                 2 - save the hash from the previous file as a new variable
   #                                                 3 - Use the hash to bring the banch to normality

elif [ $1 == "=" ] || [ $1 == "diff" ]; then
   
   if [ -z $2 ]; then
      f_greet

      f_talk; echo -n 'Difference on staged files '
        f_c3; echo    '`git diff --staged`'
        f_rc; echo

      # uDev: test if ready there are staged files
      git diff --staged

   elif [ $2 == "%" ] || [ $1 == "diff-between-head" ]; then
      # When navigating between commits like 'G -1' and 'G +1' gif diff might be needed.
      # If you want to see what is the difference between your current commit and the head commit, use this command
      #
      # Usualy we use: gif diff <newest-commit>..<oldest-commit>
      #
      # Now we will detect what is the current commit, detect the head commit and 'git diff' both

      echo "uDev: git diff between this commit and head commit is not yet developed (written/programed)"

   elif [ $2 == "2" ] || [ $1 == "diff-between-2-files" ]; then
      # This option does not use `git` and it is still usefull. It needs 2 files to be input as $3 and $4

      f_talk; echo 'Diff between 2 files (without `git`)'
              echo ' > `G = 2 <file-1> <file-2>` needs more 2 args for each file ($3 and $4)'
   fi 

elif [ $1 == "rb" ]; then
   # Rebasing: set true/false and interactive rebase
   if [ -z $2 ]; then

      f_greet

      f_talk; echo 'Intrucoes: Git Rebase'
              echo ' > `G rb` requires an extra arg, either t of f (true or false respectively)'
              echo
              echo " > G rb f          | git config pull.rebase false"
              echo " > G rb t          | git config pull.rebase true"
              echo " > G rb i          | git rebase -i (opens interactivly ONLY WITH LAST COMMIT)"
              echo " > G rb i <number> | Ao introduzir um numero, pode manupilar esses commits"
              echo 
              echo " > G rb i abort    | Aborta a tentativa atual de rebase"
              echo " > G rb i a        | Aborta a tentativa atual de rebase"
              echo 
              echo " > G rb i force    | Envia alteracoes para o github apos concluido o rebase"
              echo " > G rb i origin   | Elimina os commits locais e reverte para o mesmo estado que a origem no github"


   elif [ $2 == "i" ]; then
      # Git rebase interactive

      if [ -z $3 ]; then
         # If no arg is given, rebase ONLY last commit
         
         f_greet 

         f_talk; echo 'Tutorial: `G rb i` (Git rebase interactive)'
                 echo
                 echo "Rebasing is used to:"
                 echo ' > squash (combine multiple commits into one)'
                 echo ' > reword (changes the commit message)'
                 echo ' > edit   (edit the content of the commit)'
                 echo ' > drop   (remove the commit)'
                 echo
                 echo "For an interactive rebase of last 6 commits:"
                 echo " > git rebase -i HEAD~6"
                 echo
                 echo "Timeline: THE MOST RECENT COMMIT:"
                 echo " > The bottom one. (The oldest: the top one)"
                 echo
                 echo "To merge all 5 most recent commits into the 6th (which is the oldest):"
                 echo " > Leave the 1st line (top line) saying 'pick'"
                 echo " > Change all other 5 lines below from 'pick' to 'squash' or simply 's'"
                 echo " > Save and exit the file to apply"
                 echo
         
         v_txt='Attempt `git rebase -i` (interactive)'; f_anyK
         echo

         git rebase -i 

      elif [ $3 == "abort" ] || [ $3 == "a" ]; then
         # Abort current git rebase

         v_txt="Aborting current git rebase?"; f_anyK
         git rebase --abort && f_suc1 || f_suc2

      elif [ $3 == "force" ] || [ $3 == "f" ]; then
         # Send rebased changes to github.com

         v_txt="Pushing changes to github?"; f_anyK
         git rebase --abort && f_suc1 || f_suc2

      elif [ $3 == "origin" ] || [ $3 == "o" ]; then
         # Discarta os commits atuais locais e volta ao estado em que se encontra a origem no github

         v_txt="Revert to same state as github origin"; f_anyK
         v_current_branch=$(git rev-parse --abbrev-ref HEAD)
         git reset --hard origin/$v_current_branch && f_suc1 || f_suc2

      else 
         # If arg $3 exists, rebase interactively that amount of commits in the interactive file
         # `G rb i 4`
         # uDev: Test is arg #3 is actually a number

         f_greet 

         # Opening interactive file with hashes and commits
            v_txt="Rebasing $3 commits away form HEAD?"; f_anyK
            git rebase -i HEAD~$3 && f_suc1 || f_suc2 && exit 1
            echo
            echo "Debug: $v_suc"
            read

         # Send changes to github despite the possibility that it may create problems for other useres of the same branch
            v_txt="Forcefully push changes to github?"; f_anyK
            git push --force && f_suc1 || f_suc2
            echo
      fi

   elif [ $2 == "f" ]; then
      echo "git config pull.rebase false"
      sudo bash ${v_REPOS_CENTER}/ezGIT/ezGIT.sh rb f  ## uDev: sudo does not exist on termux and gives an error
      #git config pull.rebase false
   
   elif [ $2 == "t" ]; then
      echo "git config pull.rebase true"
      sudo bash ${v_REPOS_CENTER}/ezGIT/ezGIT.sh rb t
      #git config pull.rebase true

   fi

elif [ $1 == "n" ] || [ $1 == "next" ]; then
   echo "uDev: recursively goes into all repos and stops at the first that is not normal yet (possibilities: commits to be made, updates to fetch, push to github is needed, etc... )"


elif [ $1 == "p" ] || [ $1 == "press-p-to-upload" ]; then
      f_prsP_to_upload

elif [ $1 == "grep" ]; then
   # Uses command `git grep <pattern>` to search text at all files on current repo

   f_greet

   if [ -z $2 ]; then
      # If no more args are given, ask interactively
      f_talk; echo "What text do you want to search? "
      read -p " > " v_ans

      git grep $v_ans

   else
      # If any arg is detected, search all of them

      # from the arg list, remive the 1st one (arg $1 == grep)
         shift

      # Looping each arg and searching for it
         for i in $*
         do
            git grep $i
         done
   fi

elif [ $1 == "uDev" ]; then
   echo 'This function uses the find command to search "# uDev" comments on the code'

elif [ $1 == "[.]" ] || [ $1 == "stash-list" ] || [ $1 == "st-l" ]; then

   f_greet

   f_talk; echo "List of stashes:"
   
   git stash list

elif [ $1 == "[]" ] || [ $1 == "stash" ] || [ $1 == "st" ]; then

   f_greet

   f_talk; echo "git stash"
           echo " > saving our current commits for later "
           echo "   (You may command 'git pull' now, if needed)"
           echo

   git stash

           echo

   f_git_status

elif [ $1 == "[" ] || [ $1 == "unstash" ] || [ $1 == "ust" ] || [ $1 == "apply" ] || [ $1 == "ap" ]; then

   f_greet

   f_git_status

   f_talk; echo "git stash apply"
           echo " > Apllying saved/stashed/hidden commits now"

   git stash apply

   echo
   

elif [ $1 == "[rm]" ] || [ $1 == "stash-clear" ] || [ $1 == "st-c" ]; then
   f_greet

   f_talk; echo "Clearing/erasing all stashes"

   git stash clear && echo -e " > Done \n" 

   f_git_status

elif [ $1 == "origin-info" ]; then
         echo 
   f_c2; echo "git remote show origin:"
   f_rc

   git remote show origin

elif [ $1 == "set" ] || [ $1 == "set-current-repo-to-sync-mode" ]; then
   # Create a ".ezGIT" file inside the current repo to manage repo specific functions

   # Possibilities: 
   #  > Encrypt data before uploading
   #  > Decrypt data after downloading
   #    (semelhate ao alias `upk`)
   #
   #    Se houver algum ficheiro para abrir logo apos download (tal como a repo `upk` faz), assim o ficheiro o especificara
   #    Depois aplicar em algum bloco de tarefas, `mo todo` ou `G todo`
   #     
   #    Nesse ficheiro tambem incrementa um numero cada vez que faz uma alteracao, para que outros dispositivos com `jarve` instalado possam usar webscraping para saber se algum repo precisa ser atualizado. Web scraping é mais rapido do que um 'git request' com `git fetch`

   # uDev:  testar `git crypt`

   echo "uDev: set config file at each repo"
  
elif [ $1 == "sync-pull" ]; then
   # By giving a variable v_repo, this fx will `git pull` the corresponding repo

   function f_sync_pull_repo {
      # If user gives a valid name of a repo in the form of a variable v_sync, then, git pull such repo
      
      # uDev: Se a repo nao existir, informar que vai clonar

      v_pwd=$(pwd)

      cd ${v_REPOS_CENTER}/$v_sync
 
      f_git_pull

      cd $v_pwd

   }

   # Verbose output (colocado em variaveis para melhorar a aparecia do codigo)
      v_vb1='Nenhuma repo foi especificada no arg 2'
      v_vb2='> Nao sera feito `git pull`'

   [[ -z $2 ]] && f_talk && echo -e "$v_vb1 \n $v_vb2" && exit 1
   [[ -n $2 ]] && f_talk && echo -e "Git pulling: $2" && v_sync=$2 && f_sync_pull_repo
   

elif [ $1 == "sync-push" ]; then
   # By giving a variable v_repo, this fx will `git push` the corresponding repo

   echo "uDev: This fx will be ready after sync-pull is ready"


elif [ $1 == "file-host" ]; then
   echo "If you want to use github to download single files just like any other cloud storage instead of cloning entire repos, you can. Github supports that. Here is a link to teach how to do that while this function is under development"
   echo " > https://www.howtogeek.com/devops/how-to-download-single-files-from-a-github-repository/"


elif [ $1 == "reset-repo-to-second-commit" ] || [ $1 == "rrtsc" ]; then
   # Apaga todos os commits, menos o 'git init' e o commit atual
   # Criado pelo chatGPT
 
   set +e

   echo "[1] A criar commit temporário com tudo no working directory..."

   # Adiciona tudo, inclusive ficheiros não rastreados
   git add -A
   git commit -m "TEMP: snapshot completo do working directory"

   # Guarda o hash do commit temporário
   TEMP_COMMIT=$(git rev-parse HEAD)
   echo "[2] Commit temporário criado: $TEMP_COMMIT"

   # Encontra o primeiro commit
   FIRST_COMMIT=$(git rev-list --max-parents=0 HEAD)
   echo "[3] Primeiro commit: $FIRST_COMMIT"

   # Reset ao primeiro commit
   git reset --hard "$FIRST_COMMIT"
   echo "[4] Reset completo"

   # Cherry-pick do snapshot
   git cherry-pick "$TEMP_COMMIT"
   echo "[5] Snapshot reaplicado como segundo commit"

   # Remove o commit temporário do histórico (opcional)
   git reset --soft HEAD~1
   git commit -C "$TEMP_COMMIT"
   echo "[6] Commit final recriado com mesma mensagem"

   # Limpa referências temporárias
   echo "[7] Histórico reduzido: agora há apenas dois commits (inicial + atual)" 

elif [ $1 == "m" ] || [ $1 == "menu" ]; then
   # Menu fzf

   # Lista de opcoes para o menu `fzf`
      Lz1='Save '; Lz2='G menu'; Lz3="$Lz1\`$Lz2\`"; Lz4=$v_drya_fzf_menu_hist

      L2='2. Install .gitconfig'                                      
      L1='1. Cancel'

      L0="SELECT 1: Menu ezGIT: "
      
      v_list=$(echo -e "$L1 \n$L2 \n\n$Lz3" | fzf --cycle --prompt="$L0")

   # Perceber qual foi a escolha da lista
      [[ $v_list =~ $Lz3  ]] && echo "$Lz2" && history -s "$Lz2"
      [[ $v_list =~ "2. " ]] && f_dot_file_install_gitconfig
      [[ $v_list =~ "1. " ]] && echo "Canceled: $Lz2" && history -s "$Lz2"
      unset v_list

else
   # If the arguments you input are neither empty nor listed, then run:
      f_talk; echo "Command not known"
              echo " > Menu fzf: G m"
              echo " > For help: G h"
fi
