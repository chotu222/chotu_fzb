:: 
:: chotu222's FZB Tool
:: File: fzb.bat
:: zip maker tool
::
@echo off
TITLE Flashable zip Maker Tool
java -version
chotu\adb version
mode con:cols=80 lines=30
setLocal EnableDelayedExpansion
cls 
:restart
COLOR 8E
mkdir fzb\system
cls
echo ________________________________________________________________________________
echo.
echo 		Welcome to Chotu's flashable zip builder
echo                               -by chotu222,                                     
echo ________________________________________________________________________________
echo.
echo.
echo.
echo    1. Build flashable zip
echo    2. Clean fzb and OUT folder ! CAUTION!
echo.
echo  UPDATES :
echo.
echo    10. Check for updates !
echo.
echo.   99. Exit
echo.
echo -------------------------
SET menunr=
SET /P menunr=ENTER TASK: 
if '%menunr%'=='' (
cls
goto :restart
)
IF %menunr%==1 (goto fzb)
IF %menunr%==2 (goto clean)
IF %menunr%==10 (goto update)
IF %menunr%==99 (goto quit)
:fzb
mkdir OUT
mkdir fzb\META-INF
mkdir fzb\system
mkdir fzb\chotu
cd chotu
cls
echo WELCOME TO GRAND FLASHABLE ZIP BUILDER
echo --------------------------------------------------------------------------------
echo.
echo.
echo Are your files present in fzb folder,just to confirm!
PAUSE
echo.
echo Alright,generating META-INF...
xcopy META-INF "../fzb/META-INF" /E
xcopy chotu "../fzb/chotu" /E
cls
echo.
echo.
echo Do you want to make changes the updater script befor creating a flashable zip?
echo.
echo.
SET /P answer= (yes=y no=n) : %=%
IF %answer%==y (goto edit)
IF %answer%==n (goto noedit)
:edit
cls
start notepad++ "..\fzb\META-INF\com\google\android\updater-script"
echo.
echo.
echo After you are done editing SAVE the updater-script and
echo.
PAUSE
cls
goto noedit
:noedit
7za a -tzip "../fzb/FLASH.zip" "../fzb/*" -mx5
IF errorlevel 1 (
ECHO "An Error Occured"
PAUSE
cd ..
cls
goto restart
)
echo Zipping.....
echo Done!
cls
echo Give a name to your flashable zip :
echo.
echo.
SET /P FZIP=Type the name of your rom here: %=%
ren "../fzb/FLASH.zip" "../fzb/%FZIP%.zip
echo rename done!
cls
echo Do you want to sign zip ? 
echo.
echo NOTE : signing zip needs JDK installed.
echo.
echo ------------------------------------------
SET /P opt= (y=yes n=no) : %=%
IF %opt%==y (goto signz)
IF %opt%==n (goto movez)
:signz
cls
echo signing zip..
java -Xmx1024m -jar signapk.jar -w testkey.x509.pem testkey.pk8 ../fzb/%FZIP%.zip ../OUT/%FZIP%_signed.zip
IF errorlevel 1 (
ECHO "An Error Occured"
PAUSE
goto restart
)
echo removing files...
cd ..
rmdir /S /Q fzb > nul
mkdir fzb
echo.
echo.
echo Everything was done perfectly ! Your zip is ready to be flashed.
echo.
echo.
echo You can find your zip in your OUT folder.
PAUSE
cls
goto restart
:movez
cls
ren "../fzb/%FZIP%.zip" "../OUT/%FZIP%_unsigned.zip"
cd ..
rmdir /S /Q fzb > nul
mkdir fzb
echo Done !
echo.
echo Your flashable zip can be found in OUT folder !
PAUSE
cls
goto restart
:clean
cd ..
echo removing files ..
rmdir /S /Q fzb > nul
mkdir fzb
rmdir /S /Q OUT > nul
cls
goto restart
:quit
exit