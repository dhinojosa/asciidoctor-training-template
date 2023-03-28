#!/bin/zsh

basename=$(basename "$PWD")

docker run --rm -v "$(pwd)":/documents/ asciidoctor/docker-asciidoctor asciidoctor-revealjs -a revealjsdir=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.9.2 main.adoc

mv main.html $basename.html

docker run --rm -v "$(pwd)":/documents/ asciidoctor/docker-asciidoctor asciidoctor -b html lab_book.adoc

pushd ..
zip $basename/$basename.zip -r $basename/images $basename/$basename.html $basename/*.css $basename/lab_book.html
popd || exit
