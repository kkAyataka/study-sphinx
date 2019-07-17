#!/bin/sh

cd `dirname "${0}"`

readonly GIT_REPO=`git remote get-url origin`
readonly DOC_VER=`grep "version =" ../doc/conf.py | cut -d "'" -f 2`
readonly PDF_NAME="studysphinx.pdf"

# print var
echo GIT_REPO=${GIT_REPO}
echo DOC_VER=${DOC_VER}
echo PDF_NAME=${PDF_NAME}

# build pdf
make -C ../doc latexpdf
cp "../doc/_build/latex/${PDF_NAME}" "../doc/${PDF_NAME}"

# build html
make -C ../doc html

# checkout gh-pages branch
if [ -d "_work" ]; then
  cd _work
  git pull
  cd -
else
  git clone --depth 1 -b gh-pages ${GIT_REPO} _work
fi

# rm version folder
readonly DST_VER_DIR="_work/${DOC_VER}"
if [ -d "${DST_VER_DIR}" ]; then
  rm -r "${DST_VER_DIR}"
fi

# cp html
cp -r ../doc/_build/html "${DST_VER_DIR}"

# cleanup
rm "../doc/${PDF_NAME}"

# ready to publish to gh-pages
cd _work
git add .
git status
