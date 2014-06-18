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
      2) clean ;;
      3) update ;;
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

if[ "$thru" == "y" ]

then
dowork

elif[ "$thru" == "n" ]
  then
echo "Alright, copy your files to fzb/system folder and visit again"
clear; echo; echo "See ya."; echo; exit 1;;
fi

dowork () {
   cd ..
   cd fzb
   mkdir MERA-INF
   mkdir chotu
   cd ..
   cd chotu-linux
   cp -R MERA-INF ../fzb/MERA-INF
   cp -R chotu ../fzb/chotu
echo "Do you want to make changes the updater script before creating a flashable zip?"
echo -n "answer= (yes=y no=n) : "   
read answer

if[ "$answer" == "y" ]
  then
   open -t TextEdit ../fzb/MERA-INF/com/google/android/updater-script
echo "After you are done editing updater-script press enter"
echo ""
echo ""
function pause(){
   read -p "$*"
   noedit
}
 
# ...
# call it
pause 'Press [Enter] key to continue...'

else
noedit

noedit () {
cd ../chotu-linux
  7za a -tzip "../fzb/FLASH.zip" ../fzb/* -mx5
  echo "Zipping....."
echo "Done!"
clear
echo "Give a name to your flashable zip :"
echo ""
echo ""
echo -n "Type the name of your zip here:"
read $FZIP

mv "../fzb/FLASH.zip" ../fzb/$FZIP.zip
echo "rename done !"
echo "......"
echo "..."
echo -n "do you want to sign zip ?"
read $opt

}


}

done