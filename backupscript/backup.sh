#!/bin/bash	


dobackup(){
	
    local backup_file=$1
    local path=$2
    local timestamp=$(date +%Y%m%d_%H%M%S)

    #check if the file exists
    if [[ ! -e "$backup_file" ]]; then
        echo "ERROR: file that you are trying to back up does not exist"
        return 1
    fi
        
    #check if the path to backup exists if it doesn't user can create one 
    if [[ ! -d "$path" ]]; then
        echo "Backup directory does not exist"
        read -p "Do you want to create the directory? y/n: " option
        if [[ $option == 'y' ]]; then
            echo "Creating directory: $path"
            mkdir -p "$path" 
        else
            echo "try again"
            return 1
        fi
    fi

    local clean_name=$(basename "$backup_file")
    local backup_path="${path}/${clean_name}_${timestamp}.tar.gz"
    
    #doing the compression and archiving
    tar -czvf "$backup_path" "$backup_file"
}

#Check for arguments provided by the user
if [[ $# -gt 0 ]];then
	files=("$@")
else
	read -p " Please enter the file/directory you want to back up:" input_files
	files=($input_files)
fi

#Prompt the user for detination path

read -p "Where do you want to back the files" dest_path

#if nothing is selected the default path will be selected
dest_path=${dest_path:-/home/doctoritaplusica/backups}


#Loop over the files and backing them up

for file in "${files[@]}"; do
	echo "Backing up $file"
        dobackup "$file" "$dest_path"
done








