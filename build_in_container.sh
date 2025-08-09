#!/usr/bin/env bash
set -euo pipefail

rm -rf output || true
mkdir -p output

echo "=> Erzeuge PDF mit lualatex"
lualatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex
if grep -q "Warning" output/main.log; then
    echo "Warning detected! Stopping compilation."
    exit 1
fi
lualatex -interaction=nonstopmode -halt-on-error -output-directory=output main.tex || true

#echo "=> Erzeuge EPUB mit tex4ebook"
#tex4ebook -f epub3 -o output/book main.tex || true

#if [ ! -f output/book.epub ]; then
#  echo "=> Fallback: Pandoc-Konvertierung"
#  pandoc main.tex -o output/book-pandoc.epub --toc
#fi

echo "Build fertig. Dateien in /work/output"
ls -lh output || true
