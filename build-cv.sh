#!/bin/bash
# build-cv.sh — Compila CV para a pasta do arquivo de dados
# Uso: ./build-cv.sh cvs/vaga-01-nodejs-golang/cv-data-vaga01.typ [lang]
#      ./build-cv.sh cvs/vaga-01-nodejs-golang/cv-data-vaga01.typ pt
#      ./build-cv.sh cvs/vaga-01-nodejs-golang/cv-data-vaga01.typ all  # gera pt e en

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_FILE="${1:?Uso: $0 <caminho-cv-data.typ> [lang|all]}"
LANG="${2:-en}"

# Resolve caminho absoluto do arquivo de dados
if [[ "$DATA_FILE" = /* ]]; then
  DATA_PATH="$DATA_FILE"
else
  DATA_PATH="$SCRIPT_DIR/$DATA_FILE"
fi

if [[ ! -f "$DATA_PATH" ]]; then
  echo "Erro: Arquivo não encontrado: $DATA_PATH"
  exit 1
fi

# Diretório de saída (mesmo do arquivo de dados)
OUTPUT_DIR="$(dirname "$DATA_PATH")"

# Nome base para o PDF (remove extensão .typ)
BASE_NAME="$(basename "$DATA_PATH" .typ)"

# Função para compilar
compile_cv() {
  local target_lang="$1"
  local output_file="$OUTPUT_DIR/${BASE_NAME}-${target_lang}.pdf"

  echo "Compilando: $output_file"
  typst compile "$SCRIPT_DIR/cv.typ" "$output_file" \
    --input "lang=$target_lang" \
    --input "data=$DATA_FILE"
}

# Compila baseado no argumento de idioma
if [[ "$LANG" == "all" ]]; then
  compile_cv "en"
  compile_cv "pt"
else
  compile_cv "$LANG"
fi

echo "Concluído!"
