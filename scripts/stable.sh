#!/bin/bash

VERSIONS=$(curl -s 'https://versionhistory.googleapis.com/v1/chrome/platforms/win64/channels/stable/versions/all/releases?filter=fraction%3E0.9,endtime=none')
CUR_VERSION=$(echo $VERSIONS | jq -e -r '.releases[0].version')
if [ $? -ne 0 ]; then
	read -p "Unable to determine current stable version, provide manually: " CUR_VERSION
fi

RELEASES=$(curl -s 'https://chromiumdash.appspot.com/fetch_releases?channel=Stable&platform=Windows')
CUR_BRANCH_POS=$(echo $RELEASES | jq -e -r ".[] | select(.version==\"$CUR_VERSION\").chromium_main_branch_position")
if [ $? -ne 0 ]; then
	read -p "Unable to resolve version to branch position, provide manually: " CUR_BRANCH_POS
fi

echo v$CUR_VERSION-r$CUR_BRANCH_POS | tee ../out/revision >&2
echo $CUR_VERSION
