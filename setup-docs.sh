#!/bin/zsh

basename=$(basename "$PWD")

npx asciidoctor-revealjs main.asc

mv main.html $basename.html

asciidoctor -b html lab_book.asc

# Zip the material
#
pushd ..
zip $basename/$basename.zip -r $basename/images $basename/git.html $basename/*.css $basename/node_modules/**/* $basename/lab_book.html
popd
