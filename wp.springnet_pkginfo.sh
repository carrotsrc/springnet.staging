#!/bin/bash

VERSION=$1

PATH_CHANGELOG=$VERSION/springnet/CHANGELOG.md
PATH_RELEASE=$VERSION/springnet/RELEASE.md

PREFIX="wp.springnet"
ZIP="${PREFIX}_${VERSION}.zip"

TITLE="SpringNet Plugin"
DATE=$(date +%Y-%m-%d)
WORDPRESS=4.6.1

CHANGELOG=$(perl -pe 's/>/\&gt;/g' $PATH_CHANGELOG | perl -pe 's/^### /<h3>/g' | perl -pe 's/ ###$/<\/h3>/g' | perl -pe 's/^#### /<h4>/g' | perl -pe 's/ ####$/<\/h4><ul>/g' | perl -pe 's/\*\*(.*?)\*\*/<strong>$1<\/strong>/g'| perl -pe 's/- (.*)$/<li>$1<\/li>/g' | perl -pe 's/<\/li>.*\<h4/foobar/g' | perl -pe 's/\n//g' | perl -pe 's/<\/li><h4>/<\/li><\/ul><\/h4>/g' | perl -pe 's/<\/li>$/<\/li><\/ul>/g')
DESCRIPTION=$(perl -pe 's/>/\&gt;/g' $PATH_RELEASE | perl -pe 's/^### /<h3>/g' | perl -pe 's/ ###$/<\/h3>/g' | perl -pe 's/^([A-Z].*)\n/<p>$1<\/p>\n/g' |  perl -pe 's/^([A-Z].*)$/<p>$1<\/p>/g' | perl -pe 's/\*\*(.*?)\*\*/<strong>$1<\/strong>/g' | perl -pe 's/\n//g')

LINK=http://https://packages.spring-dvs.org/$ZIP
SHA1=$(openssl sha1 $ZIP  | awk '{print $2}' )
SHA256=$(openssl sha256 $ZIP | awk '{print $2}')
echo "{
	\"title\": \"${TITLE}\",
	\"version\": \"${VERSION}\",
	\"date\": \"${DATE}\",
	\"tested\": \"${WORDPRESS}\",
	\"sha1\": \"$SHA1\",
	\"sha-256\": \"$SHA256\",
	\"link\": \"https://packages.spring-dvs.org/${ZIP}\",
	\"sections\": {
		\"changelog\": \"${CHANGELOG}\",
		\"description\": \"${DESCRIPTION}\"
        }
}"
