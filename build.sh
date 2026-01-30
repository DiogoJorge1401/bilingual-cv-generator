#!/usr/bin/env bash
set -euo pipefail

# Build script para CV em Typst
# Gera ambas versoes (PT e EN) a partir de uma unica fonte de dados

cd "$(dirname "$0")"

OUTPUT_DIR="../output"
mkdir -p "$OUTPUT_DIR"

echo "Compilando CV em Ingles..."
typst compile cv.typ --input lang=en "$OUTPUT_DIR/diogo-jorge-cv-en.pdf"

echo "Compilando CV em Portugues..."
typst compile cv.typ --input lang=pt "$OUTPUT_DIR/diogo-jorge-cv-pt.pdf"

echo ""
echo "PDFs gerados em $OUTPUT_DIR/"
ls -la "$OUTPUT_DIR"/*.pdf
