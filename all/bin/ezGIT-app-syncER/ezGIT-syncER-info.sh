#!/bin/bash

# Change these values according to user-specific repos/infos/choosen nick/choosen files to make use of
   # In case you are Dv (the user Dv) the repo name and location is:
      v_choosen_repo="name-of-repository-here"

   # User name (for a prety presentation):
      v_nickname="nick-name-here"

   # Chosen file to edit whitin the repo:
      v_choosen_file="name-of-file-inside-repository-to-open-imediatly-after sync"


   # Debug:
      #echo $v_choosen_repo
      #echo $v_nickname
      #echo $v_choosen_file



# After all this info is loaded, run the actuall script that uses this info
   bash ${v_REPOS_CENTER}/ezGIT/all/bin/ezGIT-app-syncER/ezGIT-syncER-engine.sh
