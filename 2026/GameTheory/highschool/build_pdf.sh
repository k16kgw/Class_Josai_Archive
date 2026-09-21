#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TMP_BASE="${TMPDIR:-/private/tmp}"
BUILD_DIR="$(mktemp -d "$TMP_BASE/josai_highschool_pdf.XXXXXX")"
TEXMFVAR_DIR="/private/tmp/josai_texmf-var"

cleanup() {
  rm -rf "$BUILD_DIR"
}
trap cleanup EXIT

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: '$1' が見つかりません．" >&2
    exit 1
  fi
}

require_command myst
require_command perl
require_command lualatex

mkdir -p "$TEXMFVAR_DIR"

if [ ! -f "$SCRIPT_DIR/figures/utility_sqrt.png" ] || [ ! -f "$SCRIPT_DIR/figures/utility_friedman_savage.png" ]; then
  echo "Error: highschool/figures/ の図ファイルが見つかりません．" >&2
  exit 1
fi

cd "$PROJECT_DIR"

echo "1/4 MySTでTeXを出力しています..."
myst build highschool/lecture_notes.md --tex -o "$BUILD_DIR/lecture_notes_myst.tex"

cp "$BUILD_DIR/lecture_notes_myst.tex" "$BUILD_DIR/lecture_notes_ja.tex"

echo "2/4 日本語PDF用のLaTeX設定を追加しています..."
perl -0pi -e 's/\\documentclass\{article\}/\\documentclass\{ltjsarticle\}\n\\usepackage\{luatexja-fontspec\}\n\\setmainjfont\{Hiragino Sans\}\n\\setsansjfont\{Hiragino Sans\}\n\\setmonojfont\{Hiragino Sans\}/' "$BUILD_DIR/lecture_notes_ja.tex"

echo "3/4 LuaLaTeXでPDFを作成しています..."
for _ in 1 2; do
  TEXINPUTS="$BUILD_DIR//:" TEXMFVAR="$TEXMFVAR_DIR" \
    lualatex -interaction=nonstopmode -halt-on-error \
    -output-directory="$BUILD_DIR" "$BUILD_DIR/lecture_notes_ja.tex"
done

echo "4/4 PDFを配置しています..."
cp "$BUILD_DIR/lecture_notes_ja.pdf" "$SCRIPT_DIR/lecture_notes.pdf"

echo "作成完了: $SCRIPT_DIR/lecture_notes.pdf"
