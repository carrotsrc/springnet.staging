#!/bin/bash
if [ "$1" == "-h" ]; then
    echo "Usage:"
    echo "pack.sh VERSION"
    exit
fi

if [ "$1" == "" ]; then
    echo "Usage:"
    echo "pack.sh VERSION"
    exit
fi

echo "Final Checklist"
echo "* Has the version number been bumped?"
echo "Press any key to continue or 'q' to terminate pack"
read -p "" -n 1 key

if [[ "$key" == 'q' ]]; then
	echo ""
	exit
fi

(cd $1 && tar --exclude=.buildpath  --exclude=system/config.php --exclude=.git --exclude=.settings --exclude=.project -zhvcf ../php.web.node_$1.tgz *)
openssl sha1 php.web.node_$1.tgz
openssl sha256 php.web.node_$1.tgz

