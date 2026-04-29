Directory File Normalizer
A lightweight Bash script that "normalizes" file names within a specified directory by removing all white spaces. This is useful for preparing files for command-line tools, web servers, or programming environments that have difficulty handling spaces in paths.

⚙️ Features
Directory Validation: Ensures the path entered is a valid directory before attempting any changes.

Space Removal: Strips all spaces from filenames (e.g., my report 2024.pdf becomes myreport2024.pdf).

In-Place Renaming: Uses the mv command to rename files quickly.

Live Logging: Displays each change in the terminal so you can track the progress.

🚀 Getting Started
Prerequisites
A Linux, macOS, or Unix-like environment.

Bash shell access.

Installation
Clone the repository:

Bash
git clone https://github.com/your-username/your-repository-name.git
cd your-repository-name
Make the script executable:

Bash
chmod +x normalize.sh
🛠 Usage
Run the script from your terminal:

Bash
./normalize.sh
When prompted, enter the path to the directory you wish to clean.

Note: The script currently processes files located in the directory where the script is executed.

⚠️ Disclaimer
This script performs bulk renaming. It is highly recommended to backup your files before running the script, as renaming cannot be undone automatically.
