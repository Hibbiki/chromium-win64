#!/bin/bash

function printHelp() { 
    echo "$0 usage:" && grep " .)\ #" $0; exit 0;
}

function manualVersionInput() {
    read -p "Provide version for build: " CUR_VERSION
    echo $CUR_VERSION
}

function getVersionOnline() {
    VERSIONS=$(curl -s 'https://versionhistory.googleapis.com/v1/chrome/platforms/win64/channels/stable/versions/all/releases?filter=fraction%3E0.9,endtime=none')
    CUR_VERSION=$(echo $VERSIONS | jq -e -r '.releases[0].version')
    if [ $? -ne 0 ]; then
        read -p "Unable to determine current stable version, provide manually: " CUR_VERSION
    fi
    echo $CUR_VERSION
}

function getBranchPos() {
    RELEASES=$(curl -s 'https://chromiumdash.appspot.com/fetch_releases?channel=Stable&platform=Windows')
    CUR_BRANCH_POS=$(echo $RELEASES | jq -e -r ".[] | select(.version==\"$1\").chromium_main_branch_position")
    if [ $? -ne 0 ]; then
        read -p "Unable to resolve version to branch position, provide manually: " CUR_BRANCH_POS
    fi
    echo $CUR_BRANCH_POS
}

# ---

while getopts hno f; do
    case "${f}" in
        n) # Asks for manual version input
            CUR_VERSION=$(manualVersionInput)
            ;;
        o) # Fetches current stable version online
            CUR_VERSION=$(getVersionOnline)
            ;;
        h) # Display this help message
            printHelp
            ;;
        ?) exit 1;;
    esac
done

if [ $OPTIND -eq 1 ]; then
    CUR_VERSION=$(getVersionOnline)
fi

# ---

echo v$CUR_VERSION-r$(getBranchPos $CUR_VERSION) | tee ../out/revision >&2
echo $CUR_VERSION