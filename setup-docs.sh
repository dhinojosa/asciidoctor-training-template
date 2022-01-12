#!/bin/zsh
# Run asciidoctor for docs.zip
asciidoctor -b html git.asc

# Zip the docs.zip

zip docs.zip -r images git.html

# Run asciidoctor for slides.zip

npx asciidoctor-revealjs git.asc

# Zip the slides

zip slides.zip -r images git.html

# Desktape

decktape reveal -s '1440x900' git.html git.pdf

# Lab-book

asciidoctor -b html lab_book.asc

# Zip the lab book

zip lab_book.zip -r images lab_book.html

