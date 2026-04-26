Simple Bash Backup Script
A lightweight Bash utility to compress and archive files or directories. This script automates the process of creating .tar.gz backups with unique timestamps and ensures your destination directory exists before proceeding.

Features
Flexible Input: Pass files/directories as command-line arguments or follow the interactive prompt.

Smart Directory Handling: If the backup destination doesn't exist, the script offers to create it for you.

Timestamped Archives: Prevents overwriting by appending a $YYYYMMDD_HHMMSS timestamp to every backup.

Default Fallbacks: Automatically defaults to a pre-defined backup path if none is provided.

How to Use
1. Make the script executable
Bash
chmod +x backup.sh
2. Run with arguments
You can pass multiple files or folders directly:

Bash
./backup.sh file1.txt /path/to/folder
3. Run interactively
Simply execute the script, and it will prompt you for the source files and the destination path:

Bash
./backup.sh
Configuration
Inside the script, the default backup destination is set to:
dest_path=${dest_path:-/home/doctoritaplusica/backups}

You can modify this line to point to your preferred default storage location.

Requirements
System: Linux / macOS / WSL

Tools: bash, tar
