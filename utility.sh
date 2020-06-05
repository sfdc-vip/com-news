#!/bin/bash
set -e

# Required params
token=$1
email=$2
username=$3

cd ..
mkdir gitwork
cd gitwork
git clone git@github.com:sfdc-vip/com-news.git
cd com-news/
git config credential.helper 'cache --timeout=1200000'
git config --global user.email "$email"
git config --global user.name "$username"
git remote -v
git remote add upstream git@github.com:sfdc-www/com-news.git
git fetch upstream
git checkout master
git config --global user.email "$email"
git config --global user.name "$username"
git merge upstream/master &> /dev/null
echo "about to do branch and checking out branch"
git checkout -b new_branch
echo "asetting configs"
echo "beforepush things to orginal branch from forked branch"
git remote -v
git push origin new_branch --force > /dev/null
echo "completed pushing things"
