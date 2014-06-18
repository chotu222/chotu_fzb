#!/bin/bash

version=1.2

chmod 755 scripts/*
 echo
echo "============================================================"
  echo " Chotu's fzb $version - by chotu222"
  echo "============================================================"
  echo
echo "> MAIN MENU"
  echo
  echo " 1 - Build flashable zip"
  echo " 2 - Clean fzb and OUT folder ! CAUTION!"
  echo " 3 - Check for updates !"
  echo " x - Exit"
  echo
echo
echo -n "Enter option: "
  read opt

  if [ "$opt" != "x" ] && [ "$opt" != "u" ] && [ "$opt" != "1" ]
  then
chotu-linux/check_multiple_working
  fi
if [ "$?" != "1" ]
  then
case $opt in
      1) main ;;
      2) scripts/clean_fzb; continue;;
      3) scripts/update_fzb;;
      x) clear; echo; echo "See ya."; echo; exit 1;;
      *) echo "Invalid option"; continue;;
    esac
fi

main () {
  
  
mkdir fzb
mkdir fzb/system
clear
echo "WELCOME TO GRAND FLASHABLE ZIP BUILDER"                   
echo "------------------------------------------------------------------------"
echo
echo
echo "Are your files present in fzb folder,just to confirm!"
echo
echo -n "if yes the press "y" key to continue else press "n" "
read thru

if[ "$thru" == y ]

then
dowork

elif[ "$thru" == n ]
  then
echo "Alright, copy your files to fzb/system folder and visit again"
clear; echo; echo "See ya."; echo; exit 1;;
fi

dowork {
   cd ..
   cd fzb
   mkdir MERA-INF
   mkdir chotu
   cd ..
   cd chotu-linux
   cp -R MERA-INF ../fzb/MERA-INF
   cp -R chotu ../fzb/chotu
echo "Do you want to make changes the updater script befor creating a flashable zip?"
echo -n "answer= (yes=y no=n) : "   
read answer

if[ "$answer" == y ]

}

done