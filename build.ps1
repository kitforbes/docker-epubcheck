[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $Version = "4.2.2"
)

begin {
    $ErrorActionPreference = "Stop"
}

process {
    docker build -t kitforbes/epubcheck:$Version $PSScriptRoot
}

end {
    exit $LASTEXITCODE
}
