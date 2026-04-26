A lightweight Bash utility designed to manage disk space by identifying and removing old text and log files from the /var/log directory.

 Functionality
This script automates the removal of files that meet the following criteria:

Location: Resides within /var/log.

Age: Modified more than 30 days ago.

Type: File extensions ending in .txt or .log.

 Features
Root Protection: Includes a safety check to ensure the script is executed with sudo or root privileges.

Safety Checks: Verifies the existence of each file immediately before removal to prevent errors during execution.

Automated Array Mapping: Uses mapfile to efficiently handle file lists, even those with spaces in filenames.
