[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $Version = "4.2.6"
)

begin {
    $ErrorActionPreference = "Stop"
}

process {
    $imageName = "kitforbes/epubcheck"
    docker build `
        --tag "${imageName}:${Version}" `
        --build-arg "EPUBCHECK_VERSION=$Version" `
        $PSScriptRoot

    docker tag "${imageName}:${Version}" "${imageName}:latest"

    docker images "$imageName"

    docker run --rm `
        -v "$PSScriptRoot/test:/app/data" `
        "${imageName}:latest" `
        "data/epubcheck-test" --mode exp --failonwarnings --save
}

end {
    exit $LASTEXITCODE
}
