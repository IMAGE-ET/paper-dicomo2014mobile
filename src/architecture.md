# Webサイトの構成

WebサイトはJekyll[^jekyll]
を用いて静的に生成し、画面の要素の描画やインタラクションには主に
jQuery Mobile[^jquerymobile]
を用いている。
また、オフライン時のページのキャッシュやお気に入りの保存には
HTML5[^html5]で規定されたOffline Application Caching APIおよび
Local Storage APIを利用している。

[^jekyll]: <http://jekyllrb.com>
[^jquerymobile]: <http://jquerymobile.com/>
[^html5]: <http://www.w3.org/TR/html5/>

全体の構成は図
{::nomarkdown}\ref{fig:architecture}{:/}
の通りである。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=8cm]{figure/architecture.eps}
\caption{全体の構成}
\label{fig:architecture}
\end{figure}
{:/nomarkdown}

テンプレートを含むWebサイトのソースはGitリポジトリ上に格納され、
これを元にJekyllが静的HTMLでできた静的サイトを生成する。
ユーザのスマート端末からはこの静的HTMLをダウンロードし表示する。

DICOMO2014では、コンテンツ変換、静的HTMLのホスティングの手間を軽減するため、
GitHub Pages[^pages]
を用いた。{::nomarkdown}\cite{pages}{:/}
GitHub Pagesは、Jekyllに対応したコンテンツをGitHub上のGitリポジトリに
pushすると、静的HTMLを生成してホスティングするサービスである。

[^pages]: <https://pages.github.com>

## リポジトリ

ソースのリポジトリは大きく以下のフォルダから構成されている。

**シンポジウムに依存しない共通のテンプレート部分：**

- `_includes` - 複数のページから利用されるHTMLを部品化したファイル。
- `_layouts` - ページの種類に応じたレイアウトファイル。
  主に５種類ある。詳細は後述。
- `_scripts` - CSVファイルを`_posts`内のファイルに変換するRubyスクリプト群。
- `access, people, program, session` -
  一覧などを表示するページのテンプレート。
  後述の`_posts`内のファイルの情報を使って一覧を出力する。
- `images, js, css` -
  各ページから利用される静的な画像、JavaScriptファイル、CSSファイルなど。
- `pagelist.appcache` -
  ページキャッシュを行うページのURLのリスト。
  HTML5のマニフェストファイル[^manifest]の形式。
  基本的には下記のページ群から自動的に生成するが、
  独自の画像やJavaScriptファイル、CSSファイルなどがあれば
  ここに指定する必要がある。

[^manifest]: <http://dev.w3.org/html5/offline-webapps/#offline>

**シンポジウム毎に異なる部分：**

- `_data` - YAML形式で、ホテルの地図へのリンク、
  開催日などを格納したファイル。上記のテンプレートから参照する。
- `_posts` - セッション、参加者の詳細、地図の情報などを記述したページ群。
  詳細は後述。
- `_config.yaml` - シンポジウム名、屋内地図の画像URLなど
  シンポジウム固有の情報の定義ファイル。

`_layouts`内のレイアウトファイルの関係は
図{::nomarkdown}\ref{fig:layouts}{:/}
のようになっている。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=6cm]{figure/layouts.eps}
\caption{レイアウトファイルの関係}
\label{fig:layouts}
\end{figure}
{:/nomarkdown}

主な役割は以下の通り。defaultは基本的にはそのままでは利用していない。

- **default** - 元になる基本的な構造を含むテンプレート。
  必要となるJavaScriptのライブラリのロードなどを含む。
- **post** - 新着情報など向けのテンプレート。
- **page** - その他のページ用のテンプレート。
  上部のナビゲーション用のリンクなどを含む。
- **event** - 開始時間、終了時間のあるセッション用テンプレート。
  時間や場所などの表示を含む。
- **session** - 主に一般セッション用のテンプレート。
  セッションの発表一覧、アブストラクト表示、発表者のリストなどを含む。
- **people** - 参加者の詳細表示のためのテンプレート。
  Gravatarの表示や関連セッションなどの表示を含む。
- **room** - 会場内地図表示用のテンプレート。
  大きめの図上で部屋を図示する。

`_scripts`の中のスクリプトは以下の通り。

- **gensession.rb** セッション詳細CSVファイルから、
  セッション情報ページを生成する。
  セッション詳細CSVファイルは`_data`内に格納しておく。
- **genpeople.rb** 情報処理学会から入手した参加登録情報のCSVファイルから、
  参加者の詳細ページを生成する。
  CSVファイルは`_data`内に格納しておく。
- **checkpresenter.rb**
  発表者が参加登録されているかを名前から検索する。
- **checkchair.rb**
  座長が参加登録されているかを名前から検索する。

`_posts`の中のファイルは、Jekyllの仕様に基いて
以下の様なファイル名になっている。

    2014-07-09-opening.html

前半は日付を表すが、ここでは使用していないため任意の日付で良い。
またフォルダは便宜的なものであり、`_posts`内であれば
どのファイルをどこに置いても動作に影響はない。
日付の後ろ側の部分は、種類によって異なる。

セッションの場合は、`session-`に続けて、セッションを表すIDとする。
参加者の場合は、参加登録番号を付ける。
場所の情報の場合は、`room-`に続けて場所のIDを付加する。

`_posts`内のファイルは、ファイルの先頭部分にYAML形式でメタデータを記述する。
これをJekyllではFront-matter[^frontmatter]と呼ぶ。

[^frontmatter]: <http://jekyllrb.com/docs/frontmatter/>

図{::nomarkdown}\ref{fig:frontmatter}{:/}
がFront-matterの記述例である。

{::nomarkdown}
\begin{figure}[t]
\begin{verbatim}
---
category: session
layout: event
title: 1A 統一セッション-人間拡張
pageid: 1a
tags: normal
start: '2014-07-09 13:20:00'
end: '2014-07-09 15:00:00'
location: 飛天
---
\end{verbatim}
\caption{Front-matterの記述例}
\label{fig:frontmatter}
\end{figure}
{:/nomarkdown}


このテンプレートでは、通常の情報に加えて、以下の情報をFront-matterに
記載することを想定している。

**セッションファイル**

セッションに関連するファイルは、以下のFront-matterの記載が必要である。

- `layout: event`
- `category: session`
- `title:`にセッション名
- 開始、終了時間を`start:`, `end:`の後ろに記述する。
  この情報を元にプログラムのカレンダーが作成される。
- `pageid:`にセッションのID
- `tags:`にセッションの種別。一般は`normal`、特別招待講演は`sp`、
  デモセッションは`ds`、ナイトテクニカルセッションは`ns`と指定する。
- `location:`に部屋名
- `roomid:`に部屋のID。1-Aセッションなら`a`など。
- `chair:` 座長の名前
- `chairpid:` 座長の参加登録番号
- `paper:` 発表される論文のリスト。

この情報を元に、セッション情報をカレンダー表示用のJSONに変換する
テンプレートは図{::nomarkdown}\ref{fig:convjson}{:/}のようになる。

{::nomarkdown}
\begin{figure}[t]
\begin{verbatim}
[{% for event in site.categories.session %}
{
    title: "{{ event.title }}", url: "{{ event.url }}",
    id: "{{ event.pageid }}",
    start: "{{ event.start }}", end: "{{ event.end }}"
}
{% unless forloop.last %},{% endunless %}
{% endfor %}]
\end{verbatim}
\caption{Front-matterをJSONに変換するテンプレートの例}
\label{fig:convjson}
\end{figure}
{:/nomarkdown}


**参加者情報ファイル**

参加者に関連するファイルは、以下のFront-matterの記載が必要である。

- `layout: people`
- `category: people`
- `title:`に参加者の名前。
- `pageid:`に参加者登録番号を指定する。
- `emailhash:`にGravatar用のメールアドレスのMD5ハッシュを指定する。
- `session:`に関連セッションのURL、セッションタイトル、発表タイトルを
  リストで指定する。

**場所の情報ファイル**

会場の地図表示のためのファイルは、以下のFront-matterの記述を前提している。

- `layout: room`
- `category: access`
- `title:` 会場名
- `pageid:` 会場のID
- `tags: room` 
- `x:`, `y:` 地図の画像上で部屋がどこにあるかの座標

## お気に入り

お気に入りは、HTML5のLocal Storageを使って実現している。
Local Storageには、以下の様なJSONで
お気に入り登録したセッションや参加者のIDを格納しており、
必要に応じて読み書きを行うことで、
ブラウザを閉じてもお気に入り情報を保持できるようにしている。

> {"4114":"2014-06-09T09:47:41.727Z"}

また、お気に入り指定した項目に星印を付ける仕組みは
`_includes/favorite-list.html`に、
お気に入りのフリップボタンの表示は
`_includes/favorite-button.html`にそれぞれ共通化している。

## 画面表示

画面表示にはjQuery Mobileを用いており、
画面要素はWidgetを使って構成している。
基本は１ページにつき１つのURLを割り当て、
画面の遷移には、Ajax Loading[^ajax]を用いている。

[^ajax]: HTTP-analogous navigation via Ajax <http://api.jquerymobile.com/pagecontainer/>

お気に入り情報の更新などは画面表示時にJavaScriptで行っているが、
jQuery Mobile 1.4の仕様では、DOMキャッシュなしの場合では、主に

* `pagecreate`
* `pagecontainershow`

の２つのイベントが発生するのに対して、DOMキャッシュがある場合では、
`pagecreate`のイベントは発生しない。

つまり、$$a \rightarrow b \rightarrow a$$ と画面遷移した場合、
１回目の$$a$$と$$b$$では`pagecreate`が発生するが、
２回目の$$a$$では`pagecreate`は発生しない。

そこで、初期化処理には`pagecontainershow`を利用して、
現在のページIDをチェックすることで無駄な初期化処理を排除している。
