User Onboarding Automation Script
A Bash script designed to automate the bulk creation of Linux user accounts from a text file. It handles sanitization, security defaults, and provides colored terminal feedback.

Features
Root Validation: Ensures the script is run with necessary administrative privileges.

Input Sanitization: Automatically skips empty lines and removes accidental spaces in usernames (e.g., "joh nny" becomes "johnny").

Duplicate Prevention: Checks if a user already exists before attempting creation to prevent errors.

Security First: * Sets a default temporary password (TempPass123).

Forces a password change on the very first login using chage.

Visual Feedback: Uses color-coded output (Green for success, Yellow for warnings, Red for errors).

Prerequisites
A Linux environment (RHEL, Ubuntu, Debian, etc.).

A file named userlist in the same directory as the script.

Setup & Usage
1. Prepare the User List
Create a file named userlist and add one username per line:

Plaintext
andrei
george
radu
jonny
2. Make the Script Executable
Give the script permission to run:

Bash
chmod +x onboarding.sh
3. Run the Script
The script must be run as root or with sudo:

Bash
sudo ./onboarding.sh
Technical Details
Home Directories: Created automatically for every new user.

Password Expiry: The "Last Password Change" date is set to 0, triggering an immediate expiry.

Shell: Uses the system default shell (usually /bin/bash).

Error Handling
No Userlist: The script will exit if the userlist file is missing.

Duplicate User: The script will warn you if a user exists and move to the next name in the list without stopping.
