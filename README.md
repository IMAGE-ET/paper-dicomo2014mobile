LaTeX論文用テンプレート
=======================

* Time-stamp: "2014-07-17 19:27:17 nomura"

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

あとはメインになるTeXファイル（ここではpaper.tex）を編集して、
inputするファイルをsrc以下に`.md`ファイルとして用意して、
makeを実行してください。
