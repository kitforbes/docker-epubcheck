# docker-epubcheck

Dockerfile for [EpubCheck](https://github.com/w3c/epubcheck).

Available on [Docker Hub](https://hub.docker.com/r/kitforbes/epubcheck).

## Build

Run the PowerShell script:

```powershell
.\build.ps1 -Version "4.2.2"
```

Or run directly with:

```bash
docker build --build-arg "EPUBCHECK_VERSION=4.2.2" --tag "epubcheck:4.2.2" .
```

## Usage

### Version (Default)

Displays the version of EPUBCheck.

```bash
docker run --rm --name epubcheck "epubcheck:4.2.2"
```

```plaintext
EPUBCheck v4.2.2
EPUBCheck completed
No file specified in the arguments. Exiting.
```

### Help

Displays help information for EPUBCheck.

```bash
docker run --rm --name epubcheck "epubcheck:4.2.2" --help
```

```plaintext
No file specified in the arguments. Exiting.
EPUBCheck v4.2.2

When running this tool, the first argument should be the name (with the path)
of the file to check.

To specify a validation profile (to run checks against a specific EPUB 3 profile
or extension specification), use the -profile option:

Validation profiles supported:
--profile default        = the default validation profile
--profile dict           = validates against the EPUB Dictionaries and Glossaries specification
--profile edupub         = validates against the EDUPUB Profile
--profile idx            = validates against the EPUB Indexes specification
--profile preview        = validates against the EPUB Previews specification

If checking a non-epub file, the epub version of the file must
be specified using -v and the type of the file using -mode.
The default version is: 3.0.

Modes and versions supported:
--mode opf -v 2.0
--mode opf -v 3.0
--mode xhtml -v 2.0
--mode xhtml -v 3.0
--mode svg -v 2.0
--mode svg -v 3.0
--mode nav -v 3.0
--mode mo  -v 3.0        = for Media Overlays validation
--mode exp               = for expanded EPUB archives

This tool also accepts the following options:
--save                   = saves the epub created from the expanded epub
--out <file>             = output an assessment XML document file (use - to output to console)
--xmp <file>             = output an assessment XMP document file (use - to output to console)
--json <file>            = output an assessment JSON document file (use - to output to console)
-m <file>                = same as --mode
-p <profile>             = same as --profile
-o <file>                = same as --out
-x <file>                = same as --xmp
-j <file>                = same as --json
--failonwarnings[+|-]    = By default, the tool returns a 1 if errors are found in the file or 0 if no errors
                           are found.  Using --failonwarnings will cause the process to exit with a status of
                           1 if either warnings or errors are present and 0 only when there are no errors or warnings.
-q, --quiet              = no message on console, except errors, only in the output
-f, --fatal              = include only fatal errors in the output
-e, --error              = include only error and fatal severity messages in ouput
-w, --warn               = include fatal, error, and warn severity messages in output
-u, --usage              = include ePub feature usage information in output
                           (default is OFF); if enabled, usage information will
                           always be included in the output file
--locale <locale>        = output localized messages according to the provided IETF BCP 47 language tag string.

-l, --listChecks [<file>]       = list message ids and severity levels to the custom message file named <file>
                                  or the console
-c, --customMessages [<file>]   = override message severity levels as defined in the custom message file named <file>

--version                = displays the EPUBCheck version

-h, -? or --help         = displays this help message

EPUBCheck completed
```
