#!/usr/bin/bash
#---------------------------------list db------------------------------------------------------------------
OPTION_list=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "Quit")
while OPTION_SHOW=$(zenity --list --title="DBMS" --text="DATABACE LIST OPTION" --width=500 --height=300 --column="  please choice in list" "${OPTION_list[@]}"); do
	case $OPTION_SHOW in
	#----------------------------create db-------------------------------------------------------------------------------
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
		#----------------------------------------list db veiw-------------------------------------------------------------------------------------------------
	"${OPTION_list[1]}")
		databases_list=($(ls -d */ 2>/dev/null))
		zenity --list --title="DBMS" --text="current databases" --width=500 --height=300 --column="" "${databases_list[@]}"
		;;
		#-----------------------------------------connect db ----------------------------------------------------------------------------------------
	"${OPTION_list[2]}")
		databases_lst=($(ls -d */ 2>/dev/null))
		temp_op=$(zenity --list --title="DBMS" --text="current databases" --width=500 --height=300 --column="" "${databases_lst[@]}")
		if [ -z "$temp_op" ]; then
			echo "no choice"
		else
			#-------------------------------------------list talbe--------------------------------------------------------------------
			cd "$PWD"/"$temp_op"
			items=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "back")
			while item=$(zenity --list --title="DataBase name ..$temp_op" --text="Select operation" --width=500 --height=300 --column="options" "${items[@]}"); do
				case "$item" in
				#--------------------------------------create table-------------------------------------------------------------------------------
				"${items[0]}") echo 1 ;;
					#--------------------------------------list table view------------------------------------------------------------------------------
				"${items[1]}")
					table_list=($(ls 2>/dev/null))
					zenity --list --title="DataBase name .. $temp_op" --text="current table" --width=500 --height=300 --column="" "${table_list[@]}"
					;;
					#--------------------------------------list table drop------------------------------------------------------------------------------
				"${items[2]}") echo 3 ;;

					#--------------------------------------list table insert------------------------------------------------------------------------------

				"${items[3]}") echo 4 ;;
					#--------------------------------------list table select------------------------------------------------------------------------------
				"${items[4]}")
					echo "select"
					table_select= $(zenity --list --title="DataBase name ..$temp_op" --text="current table" --width=500 --height=300 --column="" "${table_list[@]}")
					check_row=$(zenity --list --checklist --title "table name .. $table_select" --text "Checkbox test." --width=500 --height=300 --column "" --column "Nice" False 1st False 2nd False 3rd False 4th False 5th)
					where_row=$(zenity --list --title="table name ..$table_select" --text="Select operation" --width=500 --height=300 --column="options" "${items[@]}")
					$(zenity --entry --width=500 --title="new databace" --text="Enter the database name")
					;;
					#--------------------------------------list table delete------------------------------------------------------------------------------
				"${items[5]}")
					delete_list=($(ls 2>/dev/null))
					delete_table=$(zenity --list --title="DataBase name ..$temp_op" --text="delete table" --width=500 --height=300 --column="" "${delete_list[@]}")
					if [ -n "$delete_table" ]; then
						zenity --question --title="confirm to delete table" --width=500 --height=100 --text="Are you sure to delete the table $delete_table ..?"
						Q="$?"
						if [ "$Q" -eq 0 ]; then
							rm "$delete_table"
							zenity --info --title="Info Message" --width=500 --height=100 --text="The deletion completed successfully for the table..$delete_table  ."
						fi
					fi
					;;
					#--------------------------------------list table view------------------------------------------------------------------------------
				"${items[6]}") echo 7 ;;
					#--------------------------------------list table view------------------------------------------------------------------------------
				"${items[7]}")
					break
					;;
				esac
			done
			cd ..
		fi
		;;
		#---------------------------------------------drop db---------------------------------------------------------------------------------
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
		;;
		#---------------------------------------exit-------------------------------------------------------------------------------------------
	"${OPTION_list[4]}")
		break
		;;
	esac
done

echo "good bye"
