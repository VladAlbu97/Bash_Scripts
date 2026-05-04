Permission Scanner 

This Bash script scans a specified directory for files with a given set of permissions. It is designed to be run as root and records the results both to the terminal and to a timestamped log file.


Features:

Root check – The script refuses to run if not executed with root privileges.
Flexible input – Directory and permissions can be supplied as command‑line arguments or entered interactively.
Recursive search – Finds all files (and directories) matching the exact permissions using find -perm.
Error handling – Gracefully handles inaccessible subdirectories (errors are sent to /dev/null).
Dual output – Results are displayed on the screen and simultaneously appended to a log file named permission.<timestamp>.
No‑found feedback – Informs the user when no matching files are discovered.


Requirements:

Operating system: Linux / Unix (with Bash and standard utilities)
User: Must be root (or use sudo)
Dependencies: bash, find, tee, date, mapfile (available in Bash 4+)


Usage:

sudo ./script.sh [directory] [permissions]
directory – Path to the directory you want to scan (optional).
Permissions – Numeric permissions (e.g., 777, 755) to search for (optional).
If you omit one or both arguments, the script will prompt you for them interactively.


Examples:

1.Interactive mode:
sudo ./script.sh
You will be asked:
Enter the directory to scan: /home/user
Enter the permissions to search for (e.g., 777): 777

2.Provide both arguments:
sudo ./script.sh /var/www 755

3.Provide only the directory (permissions will be prompted)
sudo ./script.sh /tmp


Output:
On screen – List of matching files / directories, one per line. If none are found, a message like
No files found with permissions 777 in /some/dir is displayed.
Log file – The same output is appended to a file named
permission.<YYYY-MM-DD_HH-MM-SS> (e.g., permission.2026-05-04_14-30-22).
The file is created in the directory from which the script is run.


Important Notes:
The script uses find -perm with the exact mode (e.g., -perm 777). It does not search for permissions that are a superset or subset – only exact matches.
Symbolic links are not followed (default find behaviour).
The log file uses tee -a (append mode). If the same timestamp file already exists, new results will be appended. In practice, this is unlikely because the timestamp includes seconds.


Troubleshooting:
Issue	Possible solution
ERROR: this script should only be run as root	Run with sudo or as the root user.
bash: mapfile: command not found	Your Bash version is too old (pre‑4.0). Upgrade Bash or replace mapfile with a loop.
No output / empty log file	No files with the exact permissions were found. Double‑check the directory path and permission number.


License:
Feel free to use, modify, and distribute this script. No warranty is implied.
