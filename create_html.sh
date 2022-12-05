#!/bin/bash
pandoc -s --template TEMPLATE/dark-template.html -o HTML/horrible-linux-guide-dark.html MD/horrible-linux-guide.md --toc --toc-depth 3

pandoc -s --template TEMPLATE/light-template.html -o HTML/horrible-linux-guide-light.html MD/horrible-linux-guide.md --toc --toc-depth 3
