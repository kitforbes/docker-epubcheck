[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $Version = "5.0.0"
)

begin {
    $ErrorActionPreference = "Stop"
}

process {
    $imageName = "kitforbes/epubcheck"
    docker build `
        --tag "${imageName}:${Version}" `
        --tag "${imageName}:latest" `
        --build-arg "EPUBCHECK_VERSION=$Version" `
        $PSScriptRoot

    docker images "$imageName"

    docker run --rm `
        -v "$PSScriptRoot/test:/app/data" `
        "${imageName}:latest" `
        "data/epubcheck-test" --mode exp --failonwarnings --save
}

end {
    exit $LASTEXITCODE
}
