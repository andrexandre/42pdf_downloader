# 42 PDF Downloader

This script makes it instant downloading (or opening in the browser) pdfs from 42

It has a database that is actively being updated with the latest subjects

## Usage

Clone the repo and execute [42pdf](https://github.com/andrexandre/42pdf_downloader/blob/main/42pdf) right away or setup so you can use it anywhere:
```bash
git clone https://github.com/andrexandre/42pdf_downloader ; 42pdf_downloader/42pdf setup
```

### Arguments and Options:
- `./42pdf NAME/ID [OPTION]`

- `NAME/ID`: The name or ID of the PDF

- `[OPTION]`: [--help/download/title/summary/version/page]

- `find`: Searches for a pdf in the database

- `pack`: Shows available pdf packs

### Examples:
- Open a PDF by name:
  ```bash
  42pdf 'so long'
  ```
- Open a PDF by ID:
  ```bash
  42pdf 123456
  ```
- Download PDF:
  ```bash
  42pdf ft_irc -d
  ```
- Display the summary of the PDF:
  ```bash
  42pdf inception -s
  ```
- Download PDF to target path:
  ```bash
  42pdf 1560 -d ~/Documents
  ```

#### To remove just run setup and confirm with 'y'
```bash
42pdf setup
```

> [!IMPORTANT]
> There are certain subjects that changed the name, so you may download the old version accidentally\
> Example: SoLong -> So Long and IRC -> ft_irc
