[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $Version = "4.2.3"
)

begin {
    $ErrorActionPreference = "Stop"
}

process {
    $imageName = "kitforbes/epubcheck"
    docker build --tag "${imageName}:${Version}" --build-arg "EPUBCHECK_VERSION=$Version" $PSScriptRoot
    docker tag "${imageName}:${Version}" "${imageName}:latest"
    docker images "$imageName"
}

end {
    exit $LASTEXITCODE
}
