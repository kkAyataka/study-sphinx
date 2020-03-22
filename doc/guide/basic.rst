--------
基本設定
--------

- ファイル名・フォルダ名はケバブケース (全て小文字で、単語ごとに「-」でつなげる) を用いる

  - ``folder-name/file-name.rst``

- 改行コードはLF

  - CRLFだと構文チェックでエラーになる

- インデントは2スペース


EditorConfig (.editorconfig)
============================

.. code-block:: text

   [*.rst]
   trim_trailing_whitespace = true
   insert_final_newline = true
   end_of_line = lf
   indent_style = space
   indent_size = 2


.gitattributes
==============

.. code-block:: text

   *       text=auto
   *.rst   text eol=lf
