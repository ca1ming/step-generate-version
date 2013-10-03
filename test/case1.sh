#!/usr/bin/env bash

echo "Case 1: server not running. Script should return an error."

echo ""
echo "Initial environment variables: "
export
echo ""
source $WERCKER_STEP_ROOT/run.sh

RESULT=$?
echo "Results: $RESULT"

if [[ $RESULT = "0" ]]; then
    echo "Test: FAIL"
    return 1 2>/dev/null || exit 1
else
    echo "Test: OK"
fi