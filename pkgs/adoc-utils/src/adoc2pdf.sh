#!/usr/bin/env bash

asciidoctor-pdf \
    -a allow-uri-read \
    -a pdf-theme=<out>/theme/theme.yml \
    -a pdf-fontsdir=<out>/fonts \
    -a imagesoutdir=$HOME/.cache/asciidocimages \
    -r asciidoctor-mathematical $@
