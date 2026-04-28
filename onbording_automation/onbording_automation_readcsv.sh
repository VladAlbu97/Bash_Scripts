#!/bin/bash
#Initialize an empty array for username,group,description
username=()
description=()
group=()


#Reading from csv+ skiping the header file
skip_headers=1
while IFS=, read -r Employee_ID First_Name Last_Name Email Department Job_Title Hire_Date Office_Location Annual_Salary
do
    if ((skip_headers))
    then
        ((skip_headers--))
    else
        # Clean the name and add it to the array
        clean_fname=$(echo "$First_Name" | xargs)
	clean_lname=$(echo "$Last_Name" | xargs)
        
        employee_names=$(echo "${clean_fname}.${clean_lname}" | tr '[:upper:]' '[:lower:]')
	username+=("$employee_names")

	clean_group=$(echo "$Department" | xargs | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
	group+=("$clean_group")
	description+=("$Employee_ID")




      
    fi
done < new_hires_dummy_data.csv

#in case you want to add only a certain amount of lines coment this out 

#done < <(head -n 20 new_hires_dummy_data.csv)

echo "-----------------------------------"


for i in "${!username[@]}"; do

	#Extract the curent person data from the arrays
	curr_user="${username[$i]}"
	curr_group="${group[$i]}"
	curr_desc="${description[$i]}"
	
	#Checking if the user already exists 
	if getent passwd "$curr_user" > /dev/null 2>&1; then
		printf "\e[33mWARNING: The user $curr_user already exists\e[0m\n"
        continue

    else
        #Check if the group exists; create it if it doesn't!
        if ! getent group "$curr_group" > /dev/null 2>&1; then
            groupadd "$curr_group"
        fi

        #Creating the user, with group and description , asigning a temporary password and prompting the user to change the password upon next login
        useradd -m -c "$curr_desc" -g "$curr_group" "$curr_user" && \
        echo "$curr_user:TempPass123" | chpasswd && \
        chage -d 0 "$curr_user"

        printf "\e[32mCreated $curr_user in group $curr_group\e[0m\n"
        sleep 1
    fi
done



