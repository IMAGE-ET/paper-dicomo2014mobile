LaTeX論文用テンプレート
=======================

* Time-stamp: "2014-03-25 17:46:13 nomura"

## 概要

Markdownで書いたテキストからTeXの論文を作成するためのテンプレートです。

## 準備（Windows）

CygwinでTeX Liveをインストールします。

以下のパッケージは最低限インストールしてください。

- texlive
- texlive-collection-basic
- texlive-collection-bibtexextra
- texlive-collection-langcjk
- texlive-collection-latex
- texlive-collection-latexextra
- texlive-collection-latexrecommended
- texlive-collection-pictures

次に、CygwinもしくはネイティブのRubyをインストール後、
kramdownをインストールします。

    > gem install kramdown

## 論文を書く

Makefileを以下のように変更します。

- TARGET: メインになるTeXファイルのファイル名
- TEXFILES: includeするTeXファイル。同じフォルダに同名の`.md`ファイルを
  置いておくと、texに変換します。
- FIGFILES: texファイルから参照している図表ファイル
- BIBFILES: 参考文献ファイル

あとはメインになるTeXファイル（ここではpaper.tex）を編集して
makeを実行してください。
