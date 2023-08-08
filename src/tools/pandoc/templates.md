### HTML Templates

To create an HTML template with pandoc first use:
```
pandoc -D html > <TEMPLATE_NAME>
```

Example:
```
pandoc-D html > template.html
```

You can then open and edit template.html and make your changes.

Then use the template with a markdown file to generate a html file.
```
pandoc -s --template template.html input.md -o output.html
```