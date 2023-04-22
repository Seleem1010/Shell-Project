#!/usr/bin/bash
OPTION_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Quit" )
while OPTION_SHOW=$(zenity --list --title="DBMS" --text="DATABACE LIST OPTION" --width=500 --height=300 --column="  please choice in list" "${OPTION_list[@]}") 
do 
 case $OPTION_SHOW in
"${OPTION_list[0]}") echo "you chose choice Create"
;;
"${OPTION_list[1]}") echo "you chose choice List"
;;
"${OPTION_list[2]}") echo "you chose choice Connect"
;;
"${OPTION_list[3]}") echo "you chose choice Drop"
;;
"${OPTION_list[4]}") break  
;;
esac
done


echo "good bye"
