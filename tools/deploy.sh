#!/bin/sh

cd `dirname "${0}"`

readonly GIT_REPO=`git remote get-url origin`
readonly DOC_VER=`grep "version =" ../doc/conf.py | cut -d "'" -f 2`
readonly PDF_NAME="studysphinx.pdf"
readonly WORK_DIR="_gh-pages"
readonly DST_VER_DIR="${WORK_DIR}/${DOC_VER}"
readonly DST_LATEST_DIR="${WORK_DIR}/latest"

# print var
echo GIT_REPO=${GIT_REPO}
echo DOC_VER=${DOC_VER}
echo PDF_NAME=${PDF_NAME}
echo WORK_DIR=${WORK_DIR}
echo DST_VER_DIR=${DST_VER_DIR}
echo DST_LATEST_DIR=${DST_LATEST_DIR}

# build pdf
make -C ../doc latexpdf
cp "../doc/_build/latex/${PDF_NAME}" "../doc/${PDF_NAME}"

# build html
make -C ../doc html

# checkout gh-pages branch
if [ -d "${WORK_DIR}" ]; then
  cd "${WORK_DIR}"
  git pull
  cd -
else
  git clone --depth 1 -b gh-pages ${GIT_REPO} "${WORK_DIR}"
fi

# rm version folder
if [ -d "${DST_VER_DIR}" ]; then
  rm -r "${DST_VER_DIR}"
fi

# rm latest
rm -r "${DST_LATEST_DIR}"

# cp html
cp -r ../doc/_build/html "${DST_VER_DIR}"
cp -r ../doc/_build/html "${DST_LATEST_DIR}"

# cleanup
rm "../doc/${PDF_NAME}"

# ready to deploy to gh-pages
cd "${WORK_DIR}"
git add .
git status
