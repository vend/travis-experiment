#!/usr/bin/env bash

# In a single component branch make sure no other dirs were modified, if such found stop build
# Also, make sure that the component dir was actually modified, if not stop build too

# Note current limitation of this script is that component names should not have dashes in their names
# Otherwise matching directory <=> service which we get from branch name can break if there are
# components with similar names eg "reporting" and "reporting-web"

set -e

MODIFIED_DIRS=$(./ci/modified_dirs.sh)
echo -e "Directories with changes:\n$MODIFIED_DIRS\n"

COMPONENT_TYPE=""
COMPONENT_NAME=""
THIS_MODIFIED=false
OTHERS_MODIFIED=false

for MODIFIED_DIR in $MODIFIED_DIRS
do
    if [[ ${TRAVIS_BRANCH/-//} =~ ^${MODIFIED_DIR}- ]] ; then
        THIS_MODIFIED=true
        PATH_PARTS=(${MODIFIED_DIR/\// })
        COMPONENT_TYPE=${PATH_PARTS[0]}
        COMPONENT_NAME=${PATH_PARTS[1]}
    else
        OTHERS_MODIFIED=true
    fi
done

if [[ $OTHERS_MODIFIED == true ]] ; then
    echo -e "Other components modified in a single component $TRAVIS_BRANCH branch, FAIL BUILD"
    exit 1
elif [[ $THIS_MODIFIED == true ]] ; then
    # Check that the component is registered in travis file
    if grep -q "COMPONENT_NAME=${COMPONENT_NAME}" .travis.yml ; then
        echo -e "Single component $COMPONENT_TYPE $COMPONENT_NAME was modified, PROCEED"
        exit 0
    else
        echo -e "Component modified in branch $TRAVIS_BRANCH is not registered in .travis.yml, FAIL BUILD"
        exit 1
    fi
else
    echo -e "No files were modified, FAIL BUILD"
    exit 1
fi
