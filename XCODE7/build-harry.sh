#! /bin/bash
# Simple build script that will make sure that :build 0 and :build kora execute without problems

printf "\n"
printf "\e[34m###############################\n";
printf "# Building Harry start         #\n";
printf "###############################\e[0m\n\n";

# move up one dir if we're in XCODE7/
if [[ $PWD =~ XCODE7 ]]; then
  cd ..;
fi

# $? is the latest command return state
ERROR=0

printf "\e[34mWorking directory is $PWD\e[0m\n";
printf "\n";

# regenerate build0 folders
BINARIES/MacChatScript64 build0=RAWDATA/files0.txt >> /dev/null;
ERROR+=$?;

if   [[ ERROR -eq 0 ]]; then
  printf "\e[32mCS build0 finished with no errors\e[0m\n";
else
  printf "\e[31mCS build0 finished with errors, see /LOGS/bugs.txt \e[0m\n";
fi

# regenerate build1 folders
BINARIES/MacChatScript64 build1=RAWDATA/filesHarry.txt >> /dev/null;
ERROR+=$?;

if   [[ ERROR -eq 0 ]]; then
  printf "\e[32mCS build1 finished with no errors\e[0m\n";  
else
  printf "\e[31mCS build1 finished with errors, see /LOGS/bugs.txt \e[0m\n\n";
fi

# git checkout our DICT files since osx can't fully generate them atm
git checkout ./DICT* 2>LOGS/build-log.txt;
ERROR+=$?

printf "\n"
printf "\e[34m###############################\n";
printf "# Building KORA end           #\n";
printf "###############################\e[0m\n";

printf "\n";
exit $ERROR;