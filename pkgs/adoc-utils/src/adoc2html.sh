#!/usr/bin/env bash

asciidoctor \
    -a allow-uri-read \
    -a mathematical-format=svg \
    -r asciidoctor-mathematical $@
