#!/usr/bin/env bash
set -x
git fetch upstream
git checkout master
git merge upstream/master
git push origin master
