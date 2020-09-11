#!/bin/sh

export FILTER_BRANCH_SQUELCH_WARNING=1

git filter-branch -f --env-filter '
OLD_NAME="OLD_NAME"
CORRECT_NAME="CORRECT_NAME"
CORRECT_EMAIL="CORRECT_EMAIL"

if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_NAME" = "$OLD_NAME" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
