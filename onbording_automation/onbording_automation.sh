#!/bin/bash

#Check if the user running the comand is root

if [[ $EUID -ne 0 ]]; then
	printf "\e[31mERROR:This script should only be run by root\e[0m\n"
	exit 1
fi

#Check if the userlist exists :

if [[ ! -f userlist ]]; then
	printf "\e[33mWARNING:no user list found\e[0m\n"
	exit 1
fi


#Reading from the file and adding to an array

array=()
while IFS= read -r line; do

	#Failsafe for empty lines or strange spaces in the userlist
	if [[ -z "${line//[[:space:]]/}" ]]; then
        continue
    fi
         #Strip white spaces in case of typos (EX : joh nny -> johnny)
         clean_line="${line//[[:space:]]/}"
	 array+=("$clean_line")
done < userlist



#Getting the elements from the array and creating the users, asigning a temporary password and prompting them to change it at the next login.

for user in "${array[@]}"; do

	#Checking for duplicate usernames
	if getent passwd "$user" > /dev/null 2>&1; then
          printf "\e[33mWARNING The user $user already exists\e[0m\n"
          continue

         else
	        useradd -m "$user" && echo "$user:TempPass123" | chpasswd && sudo chage -d 0 $user
                printf "\e[32mCreating  $user\e[0m\n"
                sleep 1
 	 fi
done


