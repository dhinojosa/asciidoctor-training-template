#!/bin/zsh

# Run asciidoctor for docs.zip
asciidoctor -b html main.asc

mv main.html $1.html

# Zip the docs.zip

zip $1-docs.zip -r images $1.html

# Run asciidoctor for slides.zip

npx asciidoctor-revealjs main.asc

# Zip the slides

mv main.html $1.html

zip $1-slides.zip -r images $1.html

# Desktape

decktape reveal -s '1440x900' $1.html $1.pdf

# Lab-book

asciidoctor -b html lab_book.asc

# Zip the lab book

zip $1-lab_book.zip -r images lab_book.html

