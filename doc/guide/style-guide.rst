--------------------------------------------------------------------------------
Style Guide
--------------------------------------------------------------------------------

reStructuredText/Sphinxで記述する際のローカルなガイドラインについて記述する。

.. contents::
   :local:


ファイル名・フォルダ名
================================================================================

- 全て小文字で、単語ごとに「-」でつなげる

::

  guide/style-guide.rst


インデント
================================================================================

インデントが必要な場合は **2スペース** を用いる。

基本的にreStructuredTextのルールに従うので、インデントというよりはベースラインをそろえるということになる。
この時、基本的に3か2スペースが必要になる。

定義リストやリテラルコードブロックなど、一部定義が緩いものがあるが、この場合に **2スペース** を用いる。
ベースラインをそろえるのに2を使用することが多いため、それに合わせる。


インライン記法
================================================================================

.. list-table:: インライン記法

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/inline-literal.txt
          :language: rst
     - .. include:: style-sample/inline-literal.txt


セクション
================================================================================

7まで使用するというわけではないが、少し多めに。セクションはページごとに判定されるので、
セクション4で大体収まる。

複数ファイルで構成する場合、章タイトルとしてセクションを1レベル消費し、
**テキスト的に** セクションをそろえると、全体として1レベル深くなる。
ただし、その場合もセクション5で大体収まるし、reST的にはあまり意味が無いので、
好みの話になる。

.. code-block:: rst

   =============
   1 セクション1
   =============

   ---------------
   1.2 セクション2
   ---------------

   1.2.3 セクション3
   =================

   1.2.3.4 セクション4
   -------------------

   1.2.3.4.5 セクション5
   .....................

   1.2.3.4.5.6 セクション6
   ~~~~~~~~~~~~~~~~~~~~~~~

   1.2.3.4.5.6.7 セクション7
   ^^^^^^^^^^^^^^^^^^^^^^^^^


TOC（目次）・ページ内目次
================================================================================

.. code-block:: rst

   .. 大元のマスターファイル（index.rst）に記載する。
      :numbered:を指定することで、セクションに番号が付く。

   .. toctree::
      :maxdepth: 2
      :caption: Contents:
      :numbered:

   .. マスターファイル（index.rst）以外に記載する。
      下位レベルのセクションを目次として表示できるので、
      ファイル単位、セクション単位の目次（概要）として使える。

   .. contents::
      :local:


段落
================================================================================

.. list-table:: 段落

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/paragraph.txt
     - .. include:: style-sample/paragraph.txt


箇条書き（番号なしリスト）
================================================================================

「-」か「*」を使う。reSTで使える文字はあるものの、他のマークアップ書式（Markdownなど）と共通の意味で使えるものを使う。

.. list-table:: 番号なしリスト

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/bullet-list.txt
          :language: rst
     - .. include:: style-sample/bullet-list.txt


列挙リスト（番号付きリスト）
================================================================================

まず、列挙リスト事態、使用場面を考える。順番であることが重要である場合、意識させたほうが良い場合のみに使用する。
多くのケースでは箇条書きで十分である。

基本的に「#」を用いる。自動採番されるため、誤記が減ったり、保守（追記/削除）が容易になる。
「1.」の記述がダメというわけではない。テキスト単体では読みやすいし、
マークアップによっては（途中の番号から始めるために）必要になったりする。
ただし、リストが大きくなると保守性に影響が出てくるため、使いどころを考える必要がある。

.. list-table:: 番号付きリスト

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/enumerated-list.txt
          :language: rst
     - .. include:: style-sample/enumerated-list.txt


定義リスト
================================================================================

.. list-table:: 定義リスト

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/definition-list.txt
          :language: rst
     - .. include:: style-sample/definition-list.txt


表（テーブル）
================================================================================

次の順番で使う。

1. リストテーブル
2. CSVテーブル
3. シンプルテーブル


複雑なテーブル表現はreST/Sphinxには向かないとしてある程度諦める。
複雑・超大な表に関してはExcelファイルをダウンロードしたり、
オンラインOfficeなどで開くようにする。

グリッド表現はリッチな表現ができるが、記述も保守も難しい。
これを使用するのであれば、Excelから引用できるように拡張機能を準備したほうが良い。


リストテーブル
--------------------------------------------------------------------------------

.. list-table:: リストテーブル

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/list-table.txt
          :language: rst
     - .. include:: style-sample/list-table.txt


CSVテーブル
--------------------------------------------------------------------------------

.. list-table:: CSVテーブル

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/csv-table.txt
          :language: rst
     - .. include:: style-sample/csv-table.txt


シンプルテーブル
--------------------------------------------------------------------------------

.. list-table:: シンプルテーブル

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/simple-table.txt
          :language: rst
     - .. include:: style-sample/simple-table.txt


図
================================================================================

.. list-table:: 図

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/figure.txt
          :language: rst
     - .. include:: style-sample/figure.txt


コードブロック
================================================================================

.. list-table:: コードブロック

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/code-block.txt
          :language: rst
     - .. include:: style-sample/code-block.txt


ラベル・リンク
================================================================================

``.. _label:`` で任意の場所にラベルをつけ、 ``label_`` として参照する。
セクション・図表の直前にラベルをつけ、 ``:ref:`` 、 ``:numref:`` で参照することで、
各セクションや図表番号への参照を作れる。

全てのセクション、図表にラベルを作りたいところだが、割と労力なので、参照が必要になった場合とする。
名前は一意にする必要があるので、「セクション１名-ラベル」あたりになる。

.. list-table:: ラベル、ref、numref

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/label-ref-numref.txt
          :language: rst
     - .. include:: style-sample/label-ref-numref.txt

.. list-table:: 別文章へのリンクと、ダウンロードリンク

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/doc-dl-link.txt
          :language: rst
     - .. include:: style-sample/doc-dl-link.txt

.. list-table:: ハイパーリンク

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/hyperlink.txt
          :language: rst
     - .. include:: style-sample/hyperlink.txt

.. list-table:: インライン内部ターゲット

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/inline-internal-target.txt
          :language: rst
     - .. include:: style-sample/inline-internal-target.txt


数式
================================================================================

.. list-table:: 数式

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/math.txt
          :language: rst
     - .. include:: style-sample/math.txt


注釈
================================================================================

.. list-table:: 注釈

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/admonition.txt
          :language: rst
     - .. include:: style-sample/admonition.txt


脚注
================================================================================

.. list-table:: 脚注

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/footnote.txt
          :language: rst
     - .. include:: style-sample/footnote.txt

dodcinfo

用語集
================================================================================

.. list-table:: 用語集

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/glossary.txt
          :language: rst
     - .. include:: style-sample/glossary.txt

オプションリスト
置換

用語集
インクルード
raw


使用すると表現が増す構文
================================================================================

使用しなくても記述できるが、使用すると表現力が増す構文。
慣れたら使う。慣れないうちは気にしない。


リテラルブロック
--------------------------------------------------------------------------------

.. list-table:: リテラルブロック

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/literal-block.txt
          :language: rst
     - .. include:: style-sample/literal-block.txt


引用リテラルブロック
--------------------------------------------------------------------------------

.. list-table:: 引用リテラルブロック

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/quoted-literal-block.txt
          :language: rst
     - .. include:: style-sample/quoted-literal-block.txt


フィールドリスト
--------------------------------------------------------------------------------

項目と内容で簡単に小さい表が作れるが、レンダリング時の表示が微妙で、使いどころが難しい。
テーマによって表示がかなり異なる。

...しかし、あっれー、サンプルとも表示がだいぶ異なる？なんでや...

.. list-table:: フィールドリスト

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/field-list.txt
          :language: rst
     - .. include:: style-sample/field-list.txt


オプションリスト
--------------------------------------------------------------------------------

.. list-table:: オプションリスト

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/option-list.txt
          :language: rst
     - .. include:: style-sample/option-list.txt


置換変数
--------------------------------------------------------------------------------

あまり使わないような気がする。

Read the Docsテーマのサイドバーに出ているのはversion。
releaseがフルバージョンで、使い分けてもいいし、同じでもよい。

.. list-table:: 置換変数

   * - テキスト
     - 表示
   * - .. literalinclude:: style-sample/replace-var.txt
          :language: rst
     - .. include:: style-sample/replace-var.txt


コメント（出力時に表示されない文章）
--------------------------------------------------------------------------------

使う場面がありそうで、正式な文章ではあまり出番がなさそう。
reST/Sphinxの構文的に補足する必要があったときとか。

.. code-block:: rst

   .. の後に続けて書くとコメント文章になる。
      改行しても、続きでコメントになる。


参考リンク
================================================================================

- reStructuredText Documentation: http://docutils.sourceforge.net/rst.html
- Docutils（reST）マニュアル: https://docutils.sphinx-users.jp/
- reStructuredText マークアップ仕様: https://docutils.sphinx-users.jp/docutils/docs/ref/rst/restructuredtext.html
- 早わかり reStructuredText: https://quick-restructuredtext.readthedocs.io/en/latest/
