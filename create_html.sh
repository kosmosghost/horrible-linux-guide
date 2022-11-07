#!/bin/bash
pandoc -s --template TEMPLATE/dark-template.html -o HTML/quick-linux-guide-dark.html MD/quick-linux-guide.md


pandoc -s --template TEMPLATE/light-template.html -o HTML/quick-linux-guide-light.html MD/quick-linux-guide.md
