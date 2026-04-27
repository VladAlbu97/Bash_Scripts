System Health Monitor Script
A lightweight Bash script that provides a quick snapshot of your system's critical resources using df, free, and uptime. It utilizes awk for smart filtering and formatting.

🚀 Features
Disk Monitoring: Automatically filters partitions and only displays those with over 80% usage.

Memory Overview: Displays the first three columns of the memory report (Label, Total, and Used) in a clean table format.

Load Average: Extracts the current user load/uptime status using custom delimiters.

Human Readable: All metrics are output in easy-to-read formats (GB/MB).

🛠 Prerequisites
This script uses standard Linux utilities. Ensure you have the following installed (usually included by default):
awk
df
free
uptime
column
