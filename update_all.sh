#!/bin/sh

set -eu

main_repo=$(pwd)

git_save() {
    status=$(git status -s)

    if [ "$status" ]; then
        git stash push --include-untracked
        return 0
    else
        set +e
        return 1
    fi
}

git_restore() {
    if [ $1 -eq 0 ]; then
        git stash pop
    fi
}

# update main
git pull

# update battle_engine
echo "*** Updating Battle Engine repository ***"
cd $main_repo/battle_engine
git_save
result=$?
set -e
git checkout master
git pull
git_restore $result

# update g3headers
echo "*** Updating g3headers repository ***"
cd $main_repo/g3headers
git_save
result=$?
set -e
git checkout master
git pull
git_restore $result

# update private
echo "*** Updating private repository ***"
cd $main_repo/sots-private
git_save
result=$?
set -e
git checkout master
git pull
git_restore $result
