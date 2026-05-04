## Log Analyzer Script

A simple Bash script that reads a log file, extracts the first column (e.g., IP addresses), counts how many times each unique entry appears, and shows the top 5 most frequent entries.


## How It Works

The script uses a specialized pipeline to process data efficiently:
  **AWK**: Extracts the first column (the IP).
  **SORT**: Groups identical IPs together.
  **UNIQ**: Counts the occurrences of each group.
  **SORT -NR**: Re-sorts the list numerically in descending order.
  **HEAD**: Limits the output to the most important top 5 results.



## Usage

Run the script with a log file as an argument:

./log_analyzer.sh dummy_log

If you run it without an argument, it will ask you to enter the file name:

./log_analyzer.sh
Please enter the file you want to read from: dummy_log

## Example Output

Using the included dummy_log file, output looks like this:

      3 192.168.1.1
      2 10.0.0.1
      1 192.168.1.2

## Testing

The repository includes a dummy_log file for testing. Just run:

./log_analyzer.sh dummy_log

## Requirements

- Bash 4.0 or higher
- Standard Unix commands: awk, sort, uniq, head

## Note

The script expects the first column of your log file to contain the data you want to count (like IP addresses). Modify the awk command if your log format is different.
