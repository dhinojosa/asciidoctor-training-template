#!/bin/zsh

basename=$(basename "$PWD")

docker run --rm -v "$(pwd)":/documents/ -v "$(pwd)"/chapters:/documents/chapters -v "$(pwd)"/images:/documents/images \
asciidoctor/docker-asciidoctor:1.55 asciidoctor-revealjs -a revealjsdir=https://cdn.jsdelivr.net/npm/reveal.js main.adoc

mv main.html $basename.html

docker run --rm -v "$(pwd)":/documents/ -v "$(pwd)"/labs:/documents/labs -v "$(pwd)"/images:/documents/images \
asciidoctor/docker-asciidoctor:1.55 asciidoctor -b html lab_book.adoc

image_text_list=$(grep -roh "images/[^\"]*" *.html | sort | uniq | xargs -I % echo "./$basename/%" | tr '\n' ' ')
image_array_list=(${(s: :)image_text_list})

rm -f $basename.zip

pushd ..
zip -r "$basename/$basename.zip" ${image_array_list} $basename/$basename.html $basename/*.css $basename/lab_book.html
popd || exit
