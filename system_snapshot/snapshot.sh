
#!/bin/bash

#run df to check the disk space with -h flag(human readable) , we user NR>1 to skip the header ,$5 is for the 5th column , then print everything that is >80%
echo " Disk over 80% used " 

df -h | awk 'NR > 1 && +$5 >= 80 {print $0}'
echo""

#run free for memory usage with -h flag (human readable), we are printing only the first 3 collums , we use the column -t for formatting
echo " Memory usage"
free -h | awk '{print $1, $2, $3}' | column -t
echo""
#run uptime for load average , we are using -F flag to tell awk that we want ',' to be our delimitator
echo " Uptime avarage"

uptime | awk -F ',' '{print $3}' | column -t

