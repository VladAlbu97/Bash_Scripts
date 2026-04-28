A lightweight Bash script designed to verify the availability of websites. It supports checking individual sites via command-line arguments or bulk checking via an input file.

🚀 Features
Status Detection: Distinguishes between successful connections (200 OK) and redirects (3xx).

Color-Coded Output: Uses ANSI escape codes to display green success messages and red error messages for better readability.

Automated Logging: Any site that is down or returns an error code is automatically logged to down_site.log with a high-precision timestamp.

Flexible Input: * Pass sites directly as arguments.

Provide a text file containing a list of sites.

Smart Parsing: Automatically handles redirects (-L) and ignores progress bars for a clean terminal experience.

🛠 Installation
Clone or create the file:

Bash
touch status_check.sh
Paste the script content into the file.

Make it executable:

Bash
chmod +x status_check.sh
📖 Usage
Option 1: Provide sites as arguments
You can pass one or multiple websites directly when running the script:

Bash
./status_check.sh google.com anaf.ro bbc.co.uk
Option 2: Provide a text file
If you run the script without arguments, it will prompt you for a filename:

Bash
./status_check.sh
# Prompt: Enter the filename containing the sites:
Note: The file should contain one URL per line.

📂 Logging
When a site fails (returns a status code other than 2xx or 3xx), the script appends a line to down_site.log in the following format:
example.com is down (Code:404)-2026-04-28_17-21-43

🔍 Technical Details
The script utilizes curl with the following flags to ensure accuracy:

-s: Silent mode (hides progress bar).

-L: Follows HTTP redirects (e.g., from http to https).

-o /dev/null: Discards the HTML body to save bandwidth.

-w "%{http_code}": Extracts only the numerical HTTP status code for logic processing.

Dependencies
Bash (4.0 or higher recommended for mapfile support).

curl installed on your Linux/Unix system.
