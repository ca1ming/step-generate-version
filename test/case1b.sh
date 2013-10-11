#!/usr/bin/env bash

echo "Case 1: server not running. Script should return an error."

echo ""
echo "Initial environment variables: "
export
echo ""
source $WERCKER_STEP_ROOT/run.sh

RESULT=$?

if [[ $RESULT != "0" ]] || [[ $GENERATED_BUILD_NR != "1" ]]; then
    echo "Test: FAIL"
    return 1 2>/dev/null || exit 1
fi

echo ""
echo "! changing commit hash !"
TMP_WERCKER_GIT_COMMIT=$WERCKER_GIT_COMMIT
WERCKER_GIT_COMMIT+="_new_commit"

echo "new commit hash: $WERCKER_GIT_COMMIT"
echo ""

source $WERCKER_STEP_ROOT/run.sh

RESULT=$?

if [[ $RESULT != "0" ]] || [[ $GENERATED_BUILD_NR != "2" ]]; then
    echo "Test: FAIL"
    return 1 2>/dev/null || exit 1
fi

echo ""
echo "! changing branch !"
TMP_WERCKER_GIT_BRANCH=$WERCKER_GIT_BRANCH
WERCKER_GIT_BRANCH="feature/this"

echo "new branch $WERCKER_GIT_BRANCH"
echo ""

source $WERCKER_STEP_ROOT/run.sh

RESULT=$?

if [[ $RESULT != "0" ]] || [[ $GENERATED_BUILD_NR != "1" ]]; then
    echo "Test: FAIL"
    return 1 2>/dev/null || exit 1
fi

echo ""
echo "! Querying original branch/commit hash again. !"
WERCKER_GIT_COMMIT=$TMP_WERCKER_GIT_COMMIT
WERCKER_GIT_BRANCH=$TMP_WERCKER_GIT_BRANCH

source $WERCKER_STEP_ROOT/run.sh

RESULT=$?

if [[ $RESULT = "0" ]] || [[ $GENERATED_BUILD_NR = "1" ]]; then
	echo "Test: FAIL"
	return 1 2>/dev/null || exit 1
fi
