# Title: ezGIT

# How to use
If you want to use this app (without installing):
	1. Navigate to this directory
	2. type "source G.sh" at the terminal

If you want to use this app (installing):
	Option 1: copy G.sh to /bin

# Description
This is a simple menu for git. In this git menu, the most used commands are simplifyed to the max. we just call for the git menu using "G" and then an option like "3". At your terminal if you type "$G 3" gitMenu will execute the option 3 of the list. (to see the full list, just type "$G" at the terminal)

The reason why with script is very usefull is because the author codes a lot on the smartphone. Every change is commited even before the feature is ready. This script aids the developer on the heavy need for sync between machines.
This app sends commands more with simbols rather than text, to aave keystrokes. 


# Version of the software
List of what is lacking at this version to transcend to the next version:
1. bashrc-presence-check: (see if this app is being loaded on "~.bashrc" if not, prompt the user if he want to add it.
2. Blind-unsorted-commit-all: When your repo is only about text and there is no need to match any previous code, then this function just commit all there is to commit with either a commit message choosen by you, or with a commit message "Blind and unsorted commit [date]"
4. echo out setaf colored text for every action
6. Has to have an option to configure and display email
7. Find the list of all Seiva's repository and git pull all of them (update them)
8. Add git stash
9. ezGIT logs changes for the true user. The true developer sees software updates through 'git log', therefore, for those who dont even know git, they need a file to read updates from "version-log.txt" (this file)



