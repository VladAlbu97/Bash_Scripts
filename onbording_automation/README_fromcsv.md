Onboarding Automation Script
A robust Bash utility designed to automate the creation of Linux user accounts directly from an HR-generated CSV file. This script handles data sanitization, group management, and security enforcement.

🚀 Features
CSV Parsing: Automatically reads and cleans employee data from new_hires_dummy_data.csv.

Automatic Sanitization:

Converts names to firstname.lastname format.

Ensures all usernames and groups are lowercase.

Replaces spaces in Department names with underscores (e.g., human_resources).

Safety Checks: Validates if a user already exists before attempting creation to prevent errors.

Dynamic Group Management: Checks for the existence of required Linux groups and creates them on the fly if missing.

Security First:

Sets a temporary password (TempPass123).

Password Force Change: Uses chage to expire the password immediately, forcing the new hire to set a private password on their very first login.

📋 Prerequisites
A Linux environment (Ubuntu/Debian recommended).

sudo or root privileges to manage users and groups.

The source file must be named new_hires_dummy_data.csv and located in the same directory as the script.

🛠️ Usage
Prepare the CSV: Ensure your CSV follows the standard header format:
Employee_ID, First_Name, Last_Name, Email, Department, Job_Title, Hire_Date, Office_Location, Annual_Salary

Make the script executable:

Bash
chmod +x your_script_name.sh
Run the script with sudo:

Bash
sudo ./your_script_name.sh
⚙️ Configuration
Limiting Input: To test the script on a smaller sample size, uncomment the head line at the bottom of the while loop section to limit processing to the first X rows.

Default Password: To change the default temporary password, update the string in the chpasswd section of the code.

⚠️ Important Notes
CSV Encoding: If the CSV was created on Windows, it is highly recommended to run dos2unix new_hires_dummy_data.csv to remove hidden carriage return characters before running this script.

Group Names: The script automatically converts "Human Resources" to "human_resources" to comply with Linux group naming standards.
