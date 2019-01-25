#!/usr/bin/env bash

set -o errexit
set -o pipefail

set -ex

REPOSITORY="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

build() {
  mkdir -p /github/home/pkg
  yarn
  yarn build
  mv build /github/home/pkg
}

push() {
  git config user.email ${GITHUB_ACTOR}@users.noreply.github.com
  git config user.name ${GITHUB_ACTOR}
  git remote set-url origin ${REPOSITORY}
  git checkout gh-pages
  mv /github/home/pkg/build/* .
  git add .
  git commit -m "Publish site"
  git push origin gh-pages
}

if [[ "${GITHUB_REF}" == "refs/heads/master" ]]; then
    echo "Starting action for master";
else
    echo "Skipping action because push was not to master" && exit 78;
fi

build
push
