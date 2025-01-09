# 42 PDF Downloader

This script makes it instant downloading pdfs from 42

It has a database that is actively being updated with the latest subjects

## Goals
- ~Ability to download subjects from 42~
- ~Choose which subject to download~
- ~Occasional db update with new pdfs~
- Make pdf packs (e.g., C piscine, C++ modules, 42_common_core, etc...)
- Compatibility with all types of PDFs

## Usage

Clone the repo and execute [42pdf](https://github.com/andrexandre/42_pdf_downloader/blob/main/42pdf) with the subject you want to download as an argument
```
git clone https://github.com/andrexandre/42_pdf_downloader.git && cd 42_pdf_downloader && ./42pdf
```

### Arguments and Options:
- `./42pdf NAME/ID [OPTION]`

- `NAME/ID`: The name or id of the PDF to download

- `[OPTION]`: [--help/open/title/summary/version/page]

- `pack`: Shows available packs

### Examples:
- Download a PDF by name:
  ```
  ./42pdf inception
  ```
- Download a PDF by ID:
  ```
  ./42pdf 123456
  ```
- Quickly open the PDF in the browser:
  ```
  ./42pdf inception -o
  ```
- Display the summary of the PDF:
  ```
  ./42pdf inception -s
  ```
