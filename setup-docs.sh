#!/bin/zsh
# Run asciidoctor for docs.zip
asciidoctor -b html $1.asc

# Zip the docs.zip

zip docs.zip -r images $1.html

# Run asciidoctor for slides.zip

npx asciidoctor-revealjs $1.asc

# Zip the slides

zip $1-slides.zip -r images $1.html

# Desktape

decktape reveal -s '1440x900' $1.html $1.pdf

# Lab-book

asciidoctor -b html $1-lab_book.asc

# Zip the lab book

zip $1-lab_book.zip -r images $1-lab_book.html

