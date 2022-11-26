<##### Setting #####>
[Console]::OutputEncoding = New-Object -typename System.Text.UTF8Encoding
$env:PYTHONIOENCODING = "utf-8"

function ImportPSReadLine() {
    Import-Module PSReadLine

    Set-PSReadLineOption -HistoryNoDuplicates
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineOption -ShowToolTips
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGreen' }

    # Shows navigable menu of all options when hitting Tab
    Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
    # Autocompleteion for Arrow keys
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    # Insert paired quotes if not already on a quote
    Set-PSReadLineKeyHandler -Chord '"', "'" `
        -BriefDescription SmartInsertQuote `
        -LongDescription "Insert paired quotes if not already on a quote" `
        -ScriptBlock {
        param($key, $arg)

        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        
        if ($line[$cursor] -eq $key.KeyChar) {
            # Just move the cursor
            [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
        }
        else {
            # Insert matching quotes, move cursor to be in between the quotes
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
            [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
            [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
        }
    }
}

<##### Settings #####>
# Default value $ProgressPreference = 'Continue'
# ref: https://blog.miniasp.com/post/2019/01/11/ProgressPreference-slow-down-powershell-execution
$ProgressPreference = 'SilentlyContinue'

<##### Modules <#####>
# PSReadLine
ImportPSReadLine

# oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/_mars.json" | Invoke-Expression

# posh-git
# update > PowerShellGet\Update-Module posh-git
Import-Module -Name posh-git

# Terminal icons
Import-Module -Name Terminal-Icons


<##### Alias #####>
Set-Alias l Get-ChildItem
Set-Alias ll Get-ChildItem
Set-Alias which Get-Command


<##### Custom functions #####>

# Open the file explorer on current path
function open { Invoke-Item . }

# Generate Guid
function guid {
    $output = New-Guid
    $output.Guid
}
Set-Alias uuid guid

# Update all git repository
function gitPullAll {
    Get-ChildItem -Directory | ForEach-Object { Write-Host $_.FullName | git -C $_.FullName pull }
}
Set-Alias git-pull-all gitPullAll

# Create a folder and cd into that folder
function mkdirAndCd {
    if ($args.Count -le 0) {
        exit(0)
    }

    $folder = $args[0]
    If (!(test-path $folder)) {
        New-Item -ItemType Directory -Force -Path $folder
    }

    Set-Location "$folder"
}
Set-Alias mkdircd mkdirAndCd
