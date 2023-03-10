#!/usr/bin/env bash

asciidoctor-pdf -a allow-uri-read \
				-a scripts=cjk \
				-a pdf-theme=<out>/theme/theme.yml \
				-a pdf-fontsdir=<out>/fonts \
				-r asciidoctor-mathematical $@
