#!/bin/bash

set -e

#The following variables are user configurable
SKIN_PATH=`/bin/pwd`
OTRS_USER="otrs"
OTRS_GROUP="apache"
OTRS_ROOT="/opt/otrs"

#make theme directory
/bin/mkdir -p $OTRS_ROOT/Kernel/Output/HTML/EIONET

#Fix permissions and make the proper symlinks
/bin/chown -R $OTRS_USER:$OTRS_GROUP $SKIN_PATH
/bin/chown -R $OTRS_USER:$OTRS_GROUP $OTRS_ROOT/Kernel/Output/HTML/EIONET
/bin/chmod -R 2775 $SKIN_PATH/skins/Agent/eionet
/bin/chmod -R 2775 $SKIN_PATH/skins/Customer/eionet

/bin/ln -s $SKIN_PATH/EionetSkin.xml $OTRS_ROOT/Kernel/Config/Files/ || true
/bin/ln -s $SKIN_PATH/skins/Agent/eionet $OTRS_ROOT/var/httpd/htdocs/skins/Agent || true
/bin/ln -s $SKIN_PATH/skins/Customer/eionet $OTRS_ROOT/var/httpd/htdocs/skins/Customer || true

/bin/cp -r $SKIN_PATH/theme/EIONET $OTRS_ROOT/Kernel/Output/HTML

echo ""
echo "==========================================================="
echo "All set. Now you can use the eionet skin and theme in otrs"
echo "==========================================================="
echo ""
