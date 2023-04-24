#!/usr/bin/bash -x
OPTION_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Quit")
while OPTION_SHOW=$(zenity --list --title="DBMS" --text="DATABACE LIST OPTION" --width=500 --height=300 --column="  please choice in list" "${OPTION_list[@]}"); do
	case $OPTION_SHOW in
	"${OPTION_list[0]}")
		echo "you chose choice Create"
		;;
	"${OPTION_list[1]}")
		databases_list=($(ls -d */ 2>/dev/null))
		zenity --list --title="DBMS" --text="current databases" --width=500 --height=300 --column="${databases_list[@]}"
		;;
	"${OPTION_list[2]}")
		databases_lst=($(ls -d */ 2>/dev/null))
		temp_op=$(zenity --list --title="DBMS" --text="current databases" --width=500 --height=300 --column="" "${databases_lst[@]}")
		if [ -z "$temp_op" ]; then
			echo "no choice"
		else
			cd "$PWD"/"$temp_op"
			items=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "back")
			while item=$(zenity --list --title="title" --text="Select operation" --width=500 --height=300 --column="options" "${items[@]}"); do
				case "$item" in
				"${items[0]}") echo 1 ;;
				"${items[1]}") echo 2 ;;
				"${items[2]}") echo 3 ;;
				"${items[3]}") echo 4 ;;
				"${items[4]}") echo 5 ;;
				"${items[5]}") echo 6 ;;
				"${items[6]}") echo 7 ;;
				"${items[7]}")
					break
					;;
				esac
			done
			cd ..
		fi
		;;
	"${OPTION_list[3]}")
		echo "you chose choice Drop"
		;;
	"${OPTION_list[4]}")
		break
		;;
	esac
done

echo "good bye"
