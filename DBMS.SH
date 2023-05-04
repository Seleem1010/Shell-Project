#!/usr/bin/bash -x
OPTION_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Quit")
<<<<<<< HEAD
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
=======
while OPTION_SHOW=$(zenity --list --title="DBMS" --text="HI $USER" --width=500 --height=300 --column="DATABACE LIST OPTION" "${OPTION_list[@]}"); do
	case $OPTION_SHOW in
	"${OPTION_list[0]}")
		USR=$(zenity --entry --width=500 --title="new databace" --text="Enter the database name")
		if [ -n "$USR" ]; then
			FIND=$(find ./ -type d -name $USR)
			echo "$FIND"
			if [ -z "$FIND" ]; then
				mkdir $USR
				zenity --info --title="Message for The process is complete " --width=500 --height=100 --text="The database has been successfully completed $USR ."
			else
				zenity --warning --title="Warning" --width=500 --height=100 --text="There is a database with this name. Make sure before entering that the name does not exist."
			fi
		fi
		;;
	"${OPTION_list[1]}")
		echo "you chose choice List"
		;;
	"${OPTION_list[2]}")
		echo "you chose choice Connect"
		;;
	"${OPTION_list[3]}")
		databases_list=($(ls -d */ 2>/dev/null))
		drop_list=$(zenity --list --title="DBMS" --text="drop databases" --width=500 --height=300 --column="" "${databases_list[@]}")
		if [ -n "$drop_list" ]; then
			zenity --question --title="confirm to drop" --width=500 --height=100 --text="Are you sure to delete the database $drop_list ..?"
			Q="$?"
			if [ "$Q" -eq 0 ]; then
				rmdir "$drop_list"
				zenity --info --title="Info Message" --width=500 --height=100 --text="The deletion completed successfully for the database..$drop_list  ."
			fi
		fi

>>>>>>> branch_ahmed
		;;
	"${OPTION_list[4]}")
		break
		;;
	esac
done
<<<<<<< HEAD

=======
>>>>>>> branch_ahmed
echo "good bye"
