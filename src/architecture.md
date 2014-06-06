# Webサイトの構成

WebサイトはJekyll[^jekyll]
を用いて静的に生成し、画面の要素の描画やインタラクションには主に
jQuery Mobile[^jquerymobile]
を用いている。

[^jekyll]: http://jekyllrb.com
[^jquerymobile]: http://jquerymobile.com/

全体の構成は図
{::nomarkdown}\ref{fig:architecture}{:/}
の通りである。

{::nomarkdown}
\begin{figure}
\includegraphics[width=8cm]{figure/architecture.eps}
\caption{全体の構成}
\label{fig:architecture}
\end{figure}
{:/nomarkdown}

DICOMO2014では、コンテンツ変換、静的HTMLのホスティングの手間を軽減するため、
GitHub Pages[^pages]
を用いた。
GitHub Pagesは、Jekyllに対応したコンテンツをGitリポジトリに
pushすると、静的HTMLを生成してホスティングするサービスである。

[^pages]: "GitHub Pages" https://pages.github.com
