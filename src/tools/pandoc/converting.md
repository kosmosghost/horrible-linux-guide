### Converting

To generate an html file from a markdown:

```
pandoc -s input.md -o output.html
```

To generate a markdown from an html:

```
pandoc -s -r html <WEBSITE> -o <OUTPUT>
```

Example:

```
pandoc -s -r html https://en.wikipedia.org/wiki/Pandoc -o pandoc.txt
```

Adding in `-t gfm-raw_html` can clean up the text file making it easier to read. Example:

```
pandoc -s -t gfm-raw_html -r html https://en.wikipedia.org/wiki/Pandoc -o pandoc.txt

```