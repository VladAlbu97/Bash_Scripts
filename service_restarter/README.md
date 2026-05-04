Service Watchdog Script
A lightweight Bash utility designed for Linux systems (RHEL/CentOS/Ubuntu) to monitor a specific systemd service, automatically restart it if it fails, and provide email alerts and logging.

Features
Automatic Recovery: Checks the status of a service and attempts to restart it if it is inactive.

Email Notifications: Sends a critical alert to a specified email address using the mailx utility when a failure is detected.

Local Logging: Appends a timestamped status message to log.txt when the service is running successfully.

Default Configuration: Monitors httpd by default but allows for any systemd service to be specified as an argument.

Efficient Monitoring: Includes a sleep interval (default 3600 seconds) to ensure low CPU usage during healthy periods.

Prerequisites
Systemd: The script uses systemctl, so it must be run on a Linux distribution that uses systemd.

Sudo Privileges: The script requires sudo permissions to restart services.

Mail Utilities: Ensure mailx or mail is installed and configured via .mailrc for email alerts to function.

Installation
Download or copy the script to your server.

Make the script executable:
chmod +x watchdog.sh

Usage
Monitor Default Service (httpd)
./watchdog.sh

Monitor a Specific Service
./watchdog.sh apache2
OR
./watchdog.sh nginx

Configuration
Email Recipient: To change the alert recipient, edit the email address on the mail -s line within the script.

Check Interval: The frequency of healthy status checks is controlled by the sleep command in the else block (currently set to 3600 seconds / 1 hour).

Restart Delay: The wait time after a restart attempt is controlled by the sleep command in the if block (currently set to 5 seconds).

Logic Overview
The script follows a simple loop:

Check if the service is active using systemctl is-active.

If DOWN: Logs a warning to the console, restarts the service, and sends an email alert.

If UP: Appends the service name and current timestamp to log.txt and waits for the next interval.
