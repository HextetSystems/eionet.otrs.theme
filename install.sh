#!/bin/bash

set -e

#The following variables are user configurable
SKIN_PATH=`/bin/pwd`
OTRS_USER="otrs"
OTRS_GROUP="www-data"
OTRS_ROOT="/opt/otrs"

#make theme directory
/bin/mkdir -p $OTRS_ROOT/Kernel/Output/HTML/HEXTET

#Fix permissions and make the proper symlinks
/bin/chown -R $OTRS_USER:$OTRS_GROUP $SKIN_PATH
/bin/chown -R $OTRS_USER:$OTRS_GROUP $OTRS_ROOT/Kernel/Output/HTML/HEXTET
/usr/bin/find $SKIN_PATH/skins/ -type f -print0 | xargs -0 /bin/chmod 0660
/usr/bin/find $SKIN_PATH/skins/ -type d -print0 | xargs -0 /bin/chmod 2770

/bin/ln -s $SKIN_PATH/HextetSkin.xml $OTRS_ROOT/Kernel/Config/Files/ || true
/bin/chown -h $OTRS_USER:$OTRS_GROUP $OTRS_ROOT/Kernel/Config/Files/HextetSkin.xml
/bin/ln -s $SKIN_PATH/skins/Agent/hextet $OTRS_ROOT/var/httpd/htdocs/skins/Agent || true
/bin/chown -h $OTRS_USER:$OTRS_GROUP $OTRS_ROOT/var/httpd/htdocs/skins/Agent/hextet
/bin/ln -s $SKIN_PATH/skins/Customer/hextet $OTRS_ROOT/var/httpd/htdocs/skins/Customer || true
/bin/chown -h $OTRS_USER:$OTRS_GROUP $OTRS_ROOT/var/httpd/htdocs/skins/Customer/hextet

/bin/cp -r $SKIN_PATH/theme/HEXTET $OTRS_ROOT/Kernel/Output/HTML
/bin/cp -r $SKIN_PATH/theme/HEXTET $OTRS_ROOT/Kernel/Output/HTML/Templates

echo ""
echo "==========================================================="
echo "All set. Now you can use the hextet skin and theme in otrs"
echo "==========================================================="
echo ""
