#!/usr/bin/env bash

echo '[Build static pages]'
export JEKYLL_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build

echo '[Push to repo master]'
git add . && git commit --amend --no-edit && git push origin master -f
