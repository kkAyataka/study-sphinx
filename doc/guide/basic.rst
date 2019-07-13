--------------------------------------------------------------------------------
基本設定
--------------------------------------------------------------------------------

.. contents::
   :local:


sphinx-quickstart
================================================================================

基本的にプロジェクト名等必須の項目以外はデフォルト設定で行う。

旧バージョン（v1.8）から大幅に簡略化されている。拡張子やマスタードキュメントも自動で設定され、
``index.rst`` が使用される。また、Makefileも作成される。

.. code-block::

   $ sphinx-quickstart.exe
   Welcome to the Sphinx 2.1.2 quickstart utility.

   Please enter values for the following settings (just press Enter to
   accept a default value, if one is given in brackets).

   Selected root path: .

   You have two options for placing the build directory for Sphinx output.
   Either, you use a directory "_build" within the root path, or you separate
   "source" and "build" directories within the root path.
   > Separate source and build directories (y/n) [n]:

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
================================================================================

``toctree`` のオプションで ``:numbered:`` を指定して、有効化する。
最上位のマスタードキュメントのみに設定すればよい。

.. code-block::

   .. toctree::
      :maxdepth: 2
      :caption: Contents:
      :numbered:


図表番号の有効化
================================================================================

``conf.py`` で ``numfig`` を有効化する。

.. code-block:: python

   # General
   numfig = True


Read the Docs Sphinxテーマの有効化
================================================================================

``pip install sphinx_rtd_theme`` でテーマをインストールし ``conf.py`` でテーマを指定する。
テーマは少しカスタマイズして使用するため、カスタム用のcssを読み込むようにも設定する。

.. code-block:: python

   # html
   html_theme = 'sphinx_rtd_theme'
   html_style = 'css/rtd_custom.css'


テーマのカスタマイズ
--------------------------------------------------------------------------------

次のようにcssファイルを準備する。設定内容はコメントを参照。
``_static`` フォルダ以下に、``_static/css/rtd_custom.css`` として保存し、上記のとおり、
``conf.py`` で設定して、有効化する。

.. code-block:: css

   @import url("theme.css");

   /* 横幅の指定を無くす */
   .wy-nav-content {
     max-width: none;
   }

   /* h1～h3に下線を引く*/
   h1, h2, h3 {
     border-bottom: 1px solid #2980B9
   }

   /* 表は改行して表示する */
   .wy-table-responsive table > th,
   .wy-table-responsive table > td {
     white-space: normal;
   }


--------------------------------------------------------------------------------
参考リンク
--------------------------------------------------------------------------------

- Read the Docs Sphinx Theme: https://github.com/readthedocs/sphinx_rtd_theme
