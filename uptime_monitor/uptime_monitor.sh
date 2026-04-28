#!/bin/bash

#Function for doing the checking


check_status(){
       local sitename=$1
       timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

 #The curl is doing the checking for status code , we are using -s for silent(no progress bar -L in case the site is on and redirects us to another link , -o is used for the rest of the output  , we are using -w to look for what interests us which is the http code 200 OK       
       http_code=$(curl -sL -o /dev/null -w "%{http_code}" "$sitename")


       #we are checking specifically for code 200 whic
       if [ "$http_code" -eq 200 ]; then
	      printf "\e[32m $sitename is runing\e[0m\n"
	      
       elif [[ "$http_code" =~ ^[3] ]]; then
	       printf "\e[32m $sitename is up but redirecting us (Code: $http_code)\e[0m\n"

	#if the site does not give 200-OK or is not redirected we will create a log file with down sites               
       else
	       echo "$sitename is down (Code:$http_code)-$timestamp" >> down_site.log
       fi

}


if [[ $# -gt 0 ]]; then
	sites=("$@")

else
    #If no arguments, ask for a file
    read -p "Enter the filename containing the sites: " input_file
    
    if [[ -f "$input_file" ]]; then
        # Read file into array, one line per element
        mapfile -t sites < "$input_file"
    else
       printf "\e[31mError: File '$input_file' not found.\e[0m\n"
        exit 1
    fi
fi

for site in "${sites[@]}"; do
# This line checks if the variable is empty. If it is, 'continue' skips to the next one.
    [[ -z "$site" ]] && continue
	check_status "$site"
done	


