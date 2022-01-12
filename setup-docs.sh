#!/bin/zsh

mkdir -p dist

# Run asciidoctor for docs.zip
asciidoctor -b html main.asc

mv main.html dist/$1.html

# Zip the docs.zip

zip $1-docs.zip -r images dist/$1.html

# Run asciidoctor for slides.zip

npx asciidoctor-revealjs main.asc

# Zip the slides

mv main.html dist/$1.html

zip dist/$1-slides.zip -r images dist/$1.html

# Desktape

decktape reveal -s '1440x900' dist/$1.html dist/$1.pdf

# Lab-book

asciidoctor -b html lab_book.asc

mv lab_book.html dist
# Zip the lab book

zip dist/$1-lab_book.zip -r images dist/lab_book.html

