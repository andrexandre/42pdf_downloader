# 42 PDF Downloader

This script makes it instant downloading pdfs from 42

It has a database that is actively being updated with the latest subjects

## Usage

Clone the repo and execute [42pdf](https://github.com/andrexandre/42_pdf_downloader/blob/main/42pdf) with the subject you want to download as an argument
```
git clone https://github.com/andrexandre/42_pdf_downloader.git && cd 42_pdf_downloader && ./42pdf
```

### Arguments and Options:
- `./42pdf NAME/ID [OPTION]`

- `NAME/ID`: The name or id of the PDF to download

- `[OPTION]`: [--help/browser/output/title/summary/version/page]

- `find`: Searches for a pdf in the database

- `pack`: Shows available packs

### Examples:
- Download a PDF by name:
  ```
  ./42pdf 'so long'
  ```
- Download a PDF by ID:
  ```
  ./42pdf 123456
  ```
- Quickly open the PDF in the browser:
  ```
  ./42pdf ft_irc -b
  ```
- Display the summary of the PDF:
  ```
  ./42pdf inception -s
  ```
- Download PDF to target path:
  ```
  ./42pdf 1560 -o ~/Documents
  ```

> [!IMPORTANT]
> There are certain subjects that changed the name, so you may download the old version accidentally\
> Example: SoLong -> So Long and IRC -> ft_irc
