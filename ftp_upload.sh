#!/usr/bin/env bash

set -e

FTP_HOST='oplab9.parqtec.unicamp.br'
LOCALPATH=$TRAVIS_BUILD_DIR/output/
REMOTEPATH='/ppc64el/openshift-operator-sdk'

# Upload files from LOCALPATH recursively to REMOTEPATH
lftp -f "
set dns:order "inet"
set xfer:use-temp-file yes
set xfer:temp-file-name *.tmp
open ftp://$FTP_HOST
user $USER $PASS
mirror -R --continue --reverse --no-empty-dirs --no-perms -I operator* $LOCALPATH $REMOTEPATH
bye
"


