--------------------------------------------------------------------------------
プロジェクトの準備
--------------------------------------------------------------------------------

Sphinxでドキュメントを書き始める際の初期設定につて説明する。


Python仮想環境の準備とSphinxのインストール
==========================================

Pythonは `仮想環境 <https://docs.python.org/ja/3/library/venv.html>`__ を使用したほうが良い。
使用するPythonの指定や、Pythonパッケージも利用するため、管理しやすい。

- ``$ python -m venv .venv`` でPython仮想環境を作成する
- ``$ . .venv/Scripts/activate`` で仮想環境の有効化する (WindowsのGit Bash)

  - Git Bashの場合、Mac / Linux同様 ``source`` コマンドを使用する
  - コマンドプロンプトやPowerShellには別のスクリプトが準備されている
  - ``$ . .venv/bin/activate`` (Mac / Linux)

- ``$ pip install Sphinx Pillow`` でSphinxをインストール

  - ただし、通常は後述の ``requirements.txt`` を用いて、
    ``$ pip install -r pip-requirements.txt`` でインストールする
  - 仮想環境下 (上記だと ``.venv`` ) にインストールされる

Visual Studio CodeはPyhton仮想環境を自動で認識して、Visual Studio Codeの設定を自動で行う。
設定は ``.vscode/settings.json`` に記述される。

.. code-block:: json

   {
     "python.pythonPath": ".venv\\Scripts\\python.exe"
   }

この設定が無い場合、Visual Studio Codeとプロジェクトで使用したいPyhtonの環境 (バージョンやパッケージ)
が異なって拡張機能などの動作に問題が出る。


pip requirementsファイル
------------------------

テキストファイルに記述したパッケージを一括でインストールする。

.. code-block:: shell

   $ pip install -r pip-requirements.txt

.. code-block:: text

   # pip-requirements.txt
   # Sphinx
   Sphinx
   Pillow

Sphinx用の拡張機能やテーマもPyPIからインストールするため、
そのプロジェクトで必要なものは全て列挙しておくことで、
環境の共有・復元が簡単に行える。


初期化 (空ドキュメントの作成) と基本設定
========================================

.. contents::
   :local:


フォルダ構成
------------

ドキュメント専用であっても ``doc`` フォルダを作ることを推奨したい。
リポジトリ管理用ファイルとフォルダを分けるためで、
Gitの設定ファイルなどと分離できる。

::

  project-root/
    doc/
      _build/
      conf.py
      index.rst
    .editorconfig
    .gitattributes
    .gitignore


sphinx-quickstart
-----------------

ドキュメントを作り始めるには、ドキュメントのルートフォルダで ``sphinx-quickstart`` を実行する。
プロジェクト名等必須の項目以外はデフォルト設定で行う。

旧バージョン（v1.8）から大幅に簡略化されている。
拡張子やマスタードキュメントも自動で設定され、Makefileも作成される。

.. code-block:: shell

   $ cd doc
   $ sphinx-quickstart
   Welcome to the Sphinx 2.4.4 quickstart utility.

   Please enter values for the following settings (just press Enter to
   accept a default value, if one is given in brackets).

   Selected root path: .

   You have two options for placing the build directory for Sphinx output.
   Either, you use a directory "_build" within the root path, or you separate
   "source" and "build" directories within the root path.
   > Separate source and build directories (y/n) [n]: n

   The project name will occur in several places in the built documentation.
   > Project name: Study Sphinx
   > Author name(s): kkAyataka
   > Project release []: 0.1.0

   If the documents are to be written in a language other than English,
   you can select a language here by its language code. Sphinx will then
   translate text that it generates into that language.

   For a list of supported codes, see
   https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-language.
   > Project language [en]: ja

   Creating file .\conf.py.
   Creating file .\index.rst.
   Creating file .\Makefile.
   Creating file .\make.bat.

   Finished: An initial directory structure has been created.

   You should now populate your master file .\index.rst and create other documentation
   source files. Use the Makefile to build the docs, like so:
     make builder
   where "builder" is one of the supported builders, e.g. html, latex or linkcheck.


htmlでのセクション番号の有効化
------------------------------

``toctree`` のオプションで ``:numbered:`` を指定して、有効化する。
最上位のマスタードキュメントのみに設定すればよい。

.. code-block:: rst

   .. toctree::
      :maxdepth: 2
      :caption: Contents:
      :numbered:


図表番号の有効化
----------------

``conf.py`` で ``numfig`` を有効化する。

.. code-block:: python

   # conf.py
   # General
   numfig = True


拡張リテラル
----------------

取り消し線や文字色の変更は標準の機能にはないため、独自に定義する。
ただし、htmlではうまくいくが、PDFでの取り扱いが難しいため、使用方法は考える必要がある。

独自に ``role`` とcssを定義する。 ``role`` はファイル毎に設定が必要なため、
``conf.py`` の ``rst_prolog`` を使って、reSTを埋め込む。

.. code-block:: python

   rst_prolog = """
   .. role:: strike
      :class: strike

   .. role:: red
      :class: red
   """

それぞれの ``role`` 用のcss定義を追加する。

.. code-block:: css

   .strike {
     text-decoration: line-through;
   }

   .red {
     color: red;
   }


上記の準備をした上で、インラインリテラルとして使用する。
``:strike:`取り消し線``` で取り消し線がひかれ、``:red:`赤字``` で赤字になる。


latexpdf出力の調整
------------------


図の表示位置
............

標準だとページ末で図が表示できない場合、図は次のページに行きつつ、
余ったスペースに図の後の文章が挿入される。
前後関係が崩れて読みにくいため、図と文章の順番が入れ替わらないように設定する。

``conf.py`` に以下を記述すると防げる。

.. code-block:: python

   latex_elements = {'figure_align':'H'}


大きな表の改ページ
..................

.. figure:: images/pdf-broken-table.png
   :align: center

   表の表示崩れ


表に ``:class: longtable`` を明示することで、大きな表での改ページの崩れをを回避できる。
ただし、1行そのものが大きく、1ページを超える場合は対処できない。

.. code-block:: rst

   .. list-table:: 大きな表
      :header-rows: 1
      :class: longtable

標準設定だと、30行以下の表は途中で改ページされず、PDF化したときに表示が崩れる。
30行以上だとLaTeXのlongtableが有効化されるため、うまく改ページされる。


拡張機能
========

.. contents::
   :local:
   :depth: 1


Sphinx-Users.jpの日本語拡張
---------------------------

- `日本語拡張 <https://sphinx-users.jp/reverse-dict/html/japanese.html>`__

Pythonパッケージとしては公開されていないた、Pythonファイルをダウンロードして直接取り込む。

通常の設定では段落中で改行すると、改行部分にスペースが入る。
日本語ではこの動作は好ましくないため、 本拡張を入れる。

.. code-block:: python

   # conf.py
   # ファイルを_ext以下に置いて、パスとして追加する
   sys.path.insert(0, os.path.abspath('_ext'))

   extensions = [
       'japanesesupport',
   ]


PlantUML: sphinxcontrib-plantuml
--------------------------------

- `PlantUML <https://plantuml.com/>`_
- `sphinxcontrib-plantuml <https://pypi.org/project/sphinxcontrib-plantuml/>`__

`PlantUML`_ を用いて、テキストでUML図を描くことができる。
PlatUMLはテキストからpngやsvg画像を作成するソフトウェアだが、
拡張機能を入れることで、Sphinxで直接PlantUMLテキストを書き、
ドキュメントに図として埋め込める。

以下の用に ``.. uml`` ディレクティブにPlatUMLテキストを記述する。

.. code-block:: rest

   .. uml::
      :caption: PlantUML

      class Sphinx
      class PlantUML

      Sphinx --> PlantUML

ドキュメントをビルドすると、以下のように図として表示される。

.. uml::
   :caption: PlantUML

   class Sphinx
   class PlantUML

   Sphinx --> PlantUML


PlantUMLのインストール
......................

- javaをインストールする

  - `AdoptOpenJDK <https://adoptopenjdk.net/?variant=openjdk11&jvmVariant=openj9>`__
  - PlantUMLはJavaアプリであるため、Javaの実行環境が必要

- Graphvisをインストールする

  - `Graphvis <https://www.graphviz.org/download/>`__
  - ``dot`` 実行ファイルへPATHを通す
  - MacではHomebrewからインストールする

- PlauntUMLをダウンロードして適当に配置

  - ``~/.local/bin/pluntuml.jar``


Sphinxの設定
............

インストール;

.. code-block:: shell

   $ pip install sphinxcontrib-plantuml

``conf.py`` の設定:

.. code-block:: shell

   # conf.py

   extensions = [
       'sphinxcontrib.plantuml',
   ]

   # PlantUML
   homedir = os.path.expanduser('~')
   plantuml = f'java -jar {homedir}/.local/bin/plantuml.1.2020.5.jar'
   plantuml_output_format = 'svg_img'


Excelファイルの取り込み: sphinxcontrib-xlsxtable
------------------------------------------------

- `sphinxcontrib-xlsxtable <https://pypi.org/project/sphinxcontrib-xlsxtable/>`__

Excelファイルを指定して、Sphinxの表として表示できる。

インストール:

.. code-block:: shell

  $ pip install sphinxcontrib-xlsxtable

``conf.py`` の設定:

.. code-block:: python

   # conf.py

   extensions = [
       'sphinxcontrib.xlsxtable',
   ]

ディレクティブ:

.. code-block:: rst

   .. xlsx-table:: Caption
      :file: path/to/xlsx/file.xlsx


テーマ
======

.. contents::
   :local:
   :depth: 1


sphinx-rtd-theme
----------------

- `Read the Docs Sphinx Theme <https://github.com/readthedocs/sphinx_rtd_theme>`__
- `テーマのカスタマイズ <https://sphinx-rtd-theme.readthedocs.io/en/latest/configuring.html>`__

ドキュメントの公開サイト `Read the Docs <https://readthedocs.org/>`__ で使用されている。
見やすいテーマとして、割と鉄板で、よく使われているテーマ。


使い方
......

インストール:

.. code-block:: shell

   $ pip install sphinx-rtd-theme

``conf.py`` の設定:

.. code-block:: python

   # conf.py
   import sphinx_rtd_theme

   extensions = [
       "sphinx_rtd_theme",
   ]

   html_theme = "sphinx_rtd_theme"
   html_style = 'css/rtd_custom.css' # 後述のカスタムCSSを指定する

標準だと横幅が固定であったりと、HTML表示としては少しもったいない部分があるため、
独自のCSSを定義することで、少しカスタマイズする。

``_static`` フォルダ以下に、``_static/css/rtd-custom.css`` として保存し、上記のとおり、
``conf.py`` で設定して、有効化する。

.. literalinclude:: ../_static/css/rtd-custom.css
   :language: css


sphinx-material
---------------

- `Material Sphinx Theme <https://github.com/bashtage/sphinx-material>`__
- `テーマのカスタマイズ <https://bashtage.github.io/sphinx-material/customization.html>`__

マテリアルデザインで構築されたテーマで、新しい (2019年8月から) 。
内部的な作りが丁寧で、うまくビルドが通る。見た目が美しく、機能性も高い。


使い方
......

インストール:

.. code-block::

   $ pip install sphinx-material

``conf.py`` の設定:

.. code-block:: python

   # conf.py
   import sphinx_material

   extensions = [
       "sphinx_material",
   ]

   html_theme = 'sphinx_material'
   html_theme_path = sphinx_material.html_theme_path()
   html_context = sphinx_material.get_html_context()
   html_theme_options = {
       'base_url': 'https://kkayataka.github.io/study-sphinx/',
       'repo_url': 'https://github.com/kkAyataka/study-sphinx/',
       'repo_name': 'Study Sphinx',
       'nav_title': 'Study Sphinx',
       'logo_icon': '&#xe869',
   }
   html_sidebars = {
       "**": ["logo-text.html", "globaltoc.html", "localtoc.html", "searchbox.html"]
   }
