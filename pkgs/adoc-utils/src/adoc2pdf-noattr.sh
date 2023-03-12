#!/usr/bin/env bash

asciidoctor-pdf \
    -a pdf-theme=<out>/theme/theme.yml \
    -a pdf-fontsdir=<out>/fonts \
    $@
