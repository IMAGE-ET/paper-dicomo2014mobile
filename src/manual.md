# 利用方法

図{::nomarkdown}\ref{fig:home}{:/}が
ホーム画面である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/home.png}
\caption{ホーム画面}
\label{fig:home}
\end{figure}
{:/nomarkdown}

ホーム画面には各種リンクと新着情報が記載されており、
項目をタップすることで各情報にアクセスすることができる。
また、キャッシュが全てダウンロード済みになると、
ホーム画面の下部にキャッシュ済みと表示される。

一旦ホーム画面などのいずれかのページの表示を行うと、
HTML5のページキャッシュ機能を利用してセッションや参加者に関連する
ページが全てキャッシュされ、オフライン時にも情報の参照が可能になる。

上部には、Program, Sessions, People, Accessへのリンクが常に表示されており、
それぞれ

- **Program** - カレンダー形式でのセッション情報などの閲覧
- **Sessions** - 一覧形式でのセッション情報の一覧
- **People** - 参加者の一覧
- **Access** - 会場へのアクセス方法、およびシンポジウム会場内の地図

となっている。

## Program

図{::nomarkdown}\ref{fig:program}{:/}
がプログラムの画面である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/program.png}
\caption{プログラム画面}
\label{fig:program}
\end{figure}
{:/nomarkdown}

日毎のセッションが時間軸上に表示され、各セッションをタップすると
詳細を見ることができる。
上部の日付をタップすると、各日付の時間軸が表示される。
後述のセッションの詳細画面でお気に入り登録を行うと、
プログラム上で対応するセッションがオレンジ色に
表示される。

## Session

図{::nomarkdown}\ref{fig:sessions}{:/}
がセッションの一覧画面である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/sessions}
\caption{セッションの一覧画面}
\label{fig:sessions}
\end{figure}
{:/nomarkdown}

セッションが種類ごとに一覧表示され、
各セッションをタップすると詳細を見ることができる。
後述のセッションの詳細画面でお気に入り登録を行うと、
対応するセッション名の前に星印が表示される。

また、上部の入力欄にキーワードを入力すると、
そのキーワードをタイトルに含むセッションが絞り込まれて表示される。

図{::nomarkdown}\ref{fig:session-sample}{:/}
が詳細なセッション情報の例である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/session-sample.png}
\caption{セッションの詳細画面}
\label{fig:session-sample}
\end{figure}
{:/nomarkdown}

気になるセッションはお気に入りのフリップボタンをタップして
Onにすることによって、
セッション一覧、およびプログラム上での表示が変わり、
後からお気に入り登録したことを確認することができる。

場所のリンクをタップすると、部屋のホテル内での位置を表すページが表示される。

下部には発表のタイトルが表示され、
タイトル部分をタップすると、
発表者、共著者情報と、
Webへのアブストラクト公開に同意していればアブストラクトが表示される。

発表者、共著者情報をタップすることで、後述のそれぞれの参加者の
詳細ページが表示される。

## People

Peopleを選択すると、参加者の一覧が表示される。
図{::nomarkdown}\ref{fig:people}{:/}
が参加者一覧の例である。
ただし、お名前の掲載に同意しておらず、論文の著者や座長ではない参加者は
表示されない。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/people.png}
\caption{参加者の一覧画面}
\label{fig:people}
\end{figure}
{:/nomarkdown}

後述の参加者の詳細ページでお気に入り登録すると、
対応する参加者の名前の前に星印が表示される。
参加者のリンクをタップすると、各参加者の詳細情報が表示される。
また、上部の入力欄に文字を入力すると、
その文字を含む参加者が絞り込まれて表示される。

図{::nomarkdown}\ref{fig:people-sample}{:/}
が参加者の詳細情報の例である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/people-sample.png}
\caption{参加者の詳細画面}
\label{fig:people-sample}
\end{figure}
{:/nomarkdown}

気になる参加者や話をした参加者のお気に入りフリップボタンをタップして
Onにすることで、参加者一覧上での表示を変えることができる。

参加者のメールアドレスでGravatar[^gravatar]アイコンが登録されていれば、
名前の前に表示される。

[^gravatar]: <https://www.gravatar.com/>

参加登録時に自己紹介を入力していれば、その内容が参加者の詳細として
表示される。
また、発表者や共著者、座長として関連しているセッションがあれば、
関連セッションとして一覧が表示される。
関連セッションをタップすると、詳細な発表のタイトルや
対応するセッションへのリンクが表示される。

右上のOptionボタンをタップし、QRコード表示リンクをタップすると、
参加者の詳細ページのURLを含むQRコードを表示させることができる。
図{::nomarkdown}\ref{fig:qrcode}{:/}
がQRコードを表示した画面の例である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/qrcode.png}
\caption{参加者のQRコードの例}
\label{fig:qrcode}
\end{figure}
{:/nomarkdown}

このQRコードを他の端末で読み込ませることによって、
同じ参加者の詳細ページを共有することができる。

またこれと同じQRコードが参加者の参加章にも印刷されている。
図{::nomarkdown}\ref{fig:qrcode-sample}{:/}
がそのイメージである。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/qrcode-sample.jpeg}
\caption{QRコード入りの参加章のイメージ}
\label{fig:qrcode-sample}
\end{figure}
{:/nomarkdown}

## Access

Accessリンクをタップすると、
会場となるホテルの地図へのリンク、
および会場内の地図へのリンクが表示される。
図{::nomarkdown}\ref{fig:access}{:/}
がアクセスの画面の例である。

{::nomarkdown}
\begin{figure}[t]
\centering
\includegraphics[width=7cm]{figure/access.png}
\caption{アクセスの画面}
\label{fig:access}
\end{figure}
{:/nomarkdown}

地図、道順はそれぞれGoogleマップの地図、経路検索へのリンクとなっている。

会場内のちずは縮小されて表示され、目的の部屋にピンが表示される。
上部の拡大ボタンを押すと地図を拡大することができる。
