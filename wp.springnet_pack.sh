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
echo "* Have AJAX requests been tested as anonymous user?"
echo "* Has the version number been bumped?"
echo "Press any key to continue or 'q' to terminate pack"
read -p "" -n 1 key

if [[ "$key" == 'q' ]]; then
	echo ""
	exit
fi


(cd $1 && zip -vr ../wp.springnet_$1.zip * -x "*.git*" -x "springnet/.git" -x "springnet/.settings/*" -x "springnet/.buildpath" -x "springnet/.gitignore" -x "springnet/.project" -x "springnet/netlib/.settings*" -x "springnet/netlib/composer.lock" -x "springnet/netlib/.buildpath" -x "springnet/netlib/.project")
openssl sha1 wp.springnet_$1.zip
openssl sha256 wp.springnet_$1.zip

