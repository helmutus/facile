# LaTeX Buchprojekt (Deutsch & Latein) mit Docker

## Build mit Docker
```bash
make docker-run

docker build -t builder . &&
    docker run -i builder &&
    mkdir -p tmp && docker cp $(docker ps -alq):/work/output/main.pdf .
```

## Output
- PDF: `output/main.pdf`
- EPUB: `output/book.epub` oder `output/book-pandoc.epub`
