#!/bin/bash

# Title: User Seiva D'Arve
# Description: A profile of a user that may be set by ezGIT's G.sh automatically
# Use: This ezGIT app is meant to speed up the process of using git (based on the "DRY" principle). Therefore there are already in-built the profile of the owner in orther for the owner not to repeat himself ever

# Hint: If you fork this repository, replace this profile by yours. (This one you may delete. Github.com's contributions graph won't update your graph if your email is configured incorrectly. Like for exeample if you use my email)

# Define username
git config --global user.name "Seivadarve"

# Define the email adress
git config --global user.email flowreshe.seiva.d.arve@gmail.com

# Define the default text editor
git config --global core.editor vim

# After all settings done, simply display the results at the terminal
echo "Results:"
git config --list




# You can also check what Git thinks a specific key’s value is by typing git config <key>:
#
#$ git config user.name
#John Doe


