# 講義概要

## 講義タイトル

宝くじで学ぶ意思決定の数理

## 内容

宝くじは期待値だけで考えると損をするように見えることがあります。それでも人はなぜ宝くじを買うのでしょうか。この講義では宝くじの選択を題材に、期待値だけでは説明しきれない人間の意思決定を数学的に考えます

## 詳細

効用関数で期待値としては損するはずの宝くじを買う人の意思決定を理解する．
各自の効用関数を推定するところもやってみたい．
高校生が本学を志望したくなるような内容を考えたい．
高校生でも理解できるが，内容は本格的なもので，大学に入って学びたくなるような，奥行きのある講義を実施したい．

## PDFの作成手順

`lecture_notes.md` から配布用PDFを作成する場合は，このフォルダで次を実行する．

```bash
./build_pdf.sh
```

別のディレクトリから実行する場合は，次のようにパスを指定してもよい．

```bash
/Users/kkagawa/localdoc/claude_project/Class/Class_Josai_GameTheory/highschool/build_pdf.sh
```

このスクリプトは，MySTでいったんTeXを出力し，`ltjsarticle` と `luatexja-fontspec` を使ってLuaLaTeXでPDF化する．通常の `myst build highschool/lecture_notes.md --pdf` でもPDFは生成できるが，日本語フォントが正しく埋め込まれず，日本語が表示されないことがあるため，配布用PDFは `build_pdf.sh` で作成する．

図は `highschool/figures/` に置いている．`lecture_notes.md` では次の画像を参照しているため，PDF作成時には削除しないこと．

- `highschool/figures/utility_sqrt.png`
- `highschool/figures/utility_friedman_savage.png`

PDF作成後は，必要に応じて次で日本語フォントが埋め込まれているか確認できる．

```bash
pdffonts highschool/lecture_notes.pdf
pdfinfo highschool/lecture_notes.pdf
```
