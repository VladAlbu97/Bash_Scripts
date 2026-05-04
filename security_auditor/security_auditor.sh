#!/bin/bash


# We are checking if the comand is run as root 


if [[ $EUID -ne 0 ]]; then
    echo "ERROR: this script should only be run as root"
    exit 1
fi

date=$(date '+%Y-%m-%d_%H-%M-%S')



# We want the user to be able to chose the diorectory and the permisions if he is not providing them when runing the script

dir=$1
perms=$2

if [[ -z "$dir" ]]; then
    read -p "Enter the directory to scan: " dir
fi

if [[ -z "$perms" ]]; then
    read -p "Enter the permissions to search for (e.g., 777): " perms
fi


#Function that checks the permissions

check_permission(){
    local check_directory=$1
    local check_permissions=$2
    
    #we are checking the target directory and adding them to an array using mapfile , using -t to handle spaces 
    mapfile -t file_to_check < <(find "$check_directory" -perm "$check_permissions" 2>/dev/null)

    #we are providing feedback if there are no file with the permissions found in the directory
    if [ ${#file_to_check[@]} -eq 0 ]; then
        echo "No files found with permissions $check_permissions in $check_directory"
    else
        for entry in "${file_to_check[@]}"; do
            echo "$entry"
        done
    fi
}

# Calling the function we use 'tee -a' so you see the results on screen AND save them to the file
check_permission "$dir" "$perms" | tee -a permission."$date"

echo "Scan complete. Results saved to permission.$date"


