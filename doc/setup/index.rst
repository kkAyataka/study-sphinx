================================================================================
環境構築
================================================================================


--------------------------------------------------------------------------------
Sphinx環境の構築
--------------------------------------------------------------------------------

- Python 3のインストール

  - Python公式サイト_ よりインストーラにてインストール

    - Python 2のSphinxは更新が止まっているので、Python 3を使用する
    - Windowsは64-bit版

- Sphinxのインストール

::

  > pip install sphinx Pillow

- Read the Docsテーマのインストール

::

  > pip install sphinx-rtd-theme

- GNU Makeのインストール（Windows）

  - `Make for Windows`_ からインストールする
  - 無くてもよいが、``make`` で出力できたほうが良い

- TeX Liveのインストール

  - `TeX Live`_ からインストールする
  - PDF出力する際に必要
  - サイズが大きく、インストールに時間がかかる


日本語拡張の設定
================================================================================

通常の設定では段落中で改行すると、改行部分にスペースが入る。
日本語ドキュメントではこの動作は好ましくないため、 Sphinx-Users.jp_ で公開されている日本語拡張を入れる。

https://sphinx-users.jp/reverse-dict/html/japanese.html を参考にファイルをダウンロードして、``conf.py`` を設定する。


--------------------------------------------------------------------------------
エディタ環境
--------------------------------------------------------------------------------

.. list-table:: エディタ
   :header-rows: 1

   * - 項目
     - 内容
     - 補足
   * - エディタ
     - Visual Studio Code
     - https://code.visualstudio.com/
   * - フォント
     - Ricty Diminished
     - https://github.com/edihbrandon/RictyDiminished
   * - ターミナル（Windows）
     - Git Bash
     - WindowsではGitに付属するGit Bashを使用する
   * - 拡張機能
     - - EditorConfig
       - reStructuredText
       - Table Formatter
     - Table FormatterはreSTに対応しているが、個人的にはあまり使用しない


Visual Studio CodeのPython環境について
================================================================================

ワークスペースの設定（ ``.vscode/settings.json`` ）を以下のようにすることで、任意のバージョンのPythonを使用することができる。
SphinxではPython 3を使用したいため、Pyhton 2と併用の環境で設定する。

.. code-block:: json

   {
     "python.pythonPath": "C:\\Users\\kkAyataka\\AppData\\Local\\Programs\\Python\\Python37\\python.exe",
     "terminal.integrated.env.windows": {
        "PATH": "C:\\Users\\kkAyataka\\AppData\\Local\\Programs\\Python\\Python37;C:\\Users\\kkAyataka\\AppData\\Local\\Programs\\Python\\Python37\\Scripts;${env:PATH}"
     }
   }

Pythonのパスを指定することで、任意のバージョンのPythonを使用することができる。
また、統合ターミナルの環境変数を設定することで、ターミナルで使用するPython環境もそろえることができる。


--------------------------------------------------------------------------------
その他
--------------------------------------------------------------------------------

- reSTファイルの行末はlf固定にする

  - CRLFだと構文チェックでエラーになる
  - EditorConfigと.gitattributesに設定する

- rsSTファイルのインデント

  - 3スペースか2スペースの問題...
  - 3と2の併用が必要で、頭が3、そのあとが2ということも多く、reSTを記述する環境や文章の性質によって、有効な設定が異なる

    - 現状はちょっとあきらめてる
    - ディレクティブが3だと書きやすいが...
    - 箇条書きは2スペースのほうがインデントの変更がしやすい

- ``git subtree`` による構成は使用しない

  - GitHub Pagesを前提にした場合、 ``git subtree`` を利用して出力フォルダと
    ``gh-pages`` ブランチを紐づける方法があるが、この方法については採用しない
  - 公開用ファイルが ``master`` ブランチに見えるためで、GitHub上での検索が汚れるため


--------------------------------------------------------------------------------
参考リンク
--------------------------------------------------------------------------------

- Python: https://www.python.org/
- Read the Docsテーマ: https://github.com/rtfd/sphinx_rtd_theme
- Make for Windows: http://gnuwin32.sourceforge.net/packages/make.htm
- TeX Live: https://www.tug.org/texlive/
- Sphinx-Users.jp: https://sphinx-users.jp/index.html

.. _Python公式サイト: https://www.python.org/
.. _`Make for Windows`: http://gnuwin32.sourceforge.net/packages/make.htm
.. _`TeX Live`: https://www.tug.org/texlive/
.. _Sphinx-Users.jp: https://sphinx-users.jp/index.html
