function Import-DotEnv {
    param (
        [string]$FilePath = ".env"
    )

    # Check if the file exists
    if (Test-Path $FilePath) {
        # Read the file line by line
        $lines = Get-Content $FilePath

        # Parse each line and set the environment variables
        foreach ($line in $lines) {
            if ($line -match "^\s*([^#\s][^=]*)\s*=\s*(.*)\s*$") {
                $key = $matches[1].Trim()
                $value = $matches[2].Trim()

                # Set the environment variable
                [System.Environment]::SetEnvironmentVariable($key, $value)
            }
        }
    } else {
        Write-Error "The .env file does not exist at the specified path."
    }
}


function Get-DotEnv {
    param (
        [string]$Name
    )

    return [System.Environment]::GetEnvironmentVariable($Name)
}
