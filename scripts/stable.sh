#!/bin/bash

VERSIONS=$(curl -s 'https://versionhistory.googleapis.com/v1/chrome/platforms/win64/channels/stable/versions/all/releases?filter=fraction%3E0.9,endtime=none')
RELEASES=$(curl -s 'https://chromiumdash.appspot.com/fetch_releases?channel=Stable&platform=Windows')
CUR_VERSION=$(echo $VERSIONS | jq -r '.releases[0].version')
CUR_BRANCH_POS=$(echo $RELEASES | jq -r ".[] | select(.version==\"$CUR_VERSION\").chromium_main_branch_position")

echo v$CUR_VERSION-r$CUR_BRANCH_POS > ../out/revision
echo $CUR_VERSION
