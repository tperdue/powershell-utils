# Disk Usage Analyzer

This project is a PowerShell script that analyzes disk usage by calculating the sizes of folders in a specified directory. The script outputs the results to a CSV file.

## Project Structure

```
.
├── disk_usage.csv
├── disk_usage.ps1
└── dot_env_funcs.ps1
```

- `disk_usage.csv`: The output file containing the disk usage information.
- `disk_usage.ps1`: The main script that calculates the disk usage.
- `dot_env_funcs.ps1`: A script that contains functions for loading environment variables from a `.env` file.

## Prerequisites

- PowerShell
- A `.env` file with the following structure:
  ```
  ROOT_PATH=C:\path\to\directory
  ```
- Please don't commit your .env or any secrets to your repo.

## Setup

1. Clone the repository to your local machine.
2. Create a `.env` file in the project root with the `ROOT_PATH` variable set to the directory you want to analyze.
3. Ensure that `dot_env_funcs.ps1` contains the necessary functions to load environment variables.

## Usage

1. Open PowerShell.
2. Navigate to the project directory.
3. Run the script:
   ```powershell
   .\disk_usage.ps1
   ```
4. The script will generate a `disk_usage.csv` file in the project directory with the folder sizes.

## Script Details

- `disk_usage.ps1`:
  - Imports the `dot_env_funcs.ps1` script to load environment variables.
  - Retrieves the `ROOT_PATH` from the environment variables.
  - Defines a `Get-FolderSize` function to calculate the size of a folder.
  - Iterates over each folder in the specified `ROOT_PATH`, calculates its size, and stores the information in an array.
  - Exports the folder sizes to `disk_usage.csv`.


