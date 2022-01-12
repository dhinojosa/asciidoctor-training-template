# Asciidoctor Training Material

This uses asciidoctor for training material. This is a template. Fork this repository and create your material based off of this template

## Requirements

0. Ruby
1. Asciidoctor
2. Node

## How to run

1. Make `./setup-docs.sh` executable with `chmod +x ./setup-docs.sh`
2. Run `npm install`
3. Run `./setup-docs.sh <topic>`

Where topic is the name of the material you are wanting to create

For example, if you were creating training material for git you would type something like the following.

```sh
$ ./setup-docs.sh git
```

## Issues

### `rbenv` issue

If you use `rbenv` to run and install asciidoctor, be sure to specify which version you wish to use with `rbenv`

```sh
rbenv local 3.0.1
```
