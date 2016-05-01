#!/usr/bin/env bash
set -e # halt script on error

rm -rf dist/
mkdir dist/
cp source/index.html dist/index.html

foreman start

cd dist/

# config
git config --global user.email "nandomoreira.me@gmail.com"
git config --global user.name "Fernando Moreira"

# deploy
git init
git remote add origin git@github.com:nandomoreirame/uikit.git
git add -A .
git commit -m "Deploy to GitHub Pages"
git checkout -b gh-pages
git push origin gh-pages -f

cd ..
rm -rf dist/