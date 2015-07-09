#!/bin/bash

FORCE=0
PACKAGE=0
SHOW=0
UPDATE=0

for some in $*
do
    if [ $some == "--force"  ] || [ $some == "-f" ]
    then FORCE=1
    fi
    if
	[ $some == "--upgrade-packages" ] || [ $some == "-upkg" ]
	then PACKAGE=1
    fi
    if [ $some == "--list" ] || [ $some == "-l" ]
    then SHOW=1
    fi

    if [ $some == "--upgrade" ] || [ $some == "-u" ]
    then UPDATE=1
    fi

done

function LIST {
    apm --color list
}

function UPGRADE {
#Get URL to new version release of Atom
NEW_RELEASES=$(curl -I -s https://github.com/atom/atom/releases/latest | grep Location | cut -d " " -f 2 | tr -d '\r')

#Check if NEW_RELEASES if newer than your version of atom
if [ $(echo $NEW_RELEASES | cut -d "v" -f 2) \> $(atom -v) ] || [ $FORCE -eq 1  ]
then wget $( echo $NEW_RELEASES | sed -e 's/tag/download/g')/atom-amd64.deb -O /tmp/atom.deb

#Install new atom version
	 sudo dpkg -i /tmp/atom.deb
	 rm /tmp/atom.deb
else
  echo "Atom is up to date!"
fi
}

function PACKAGE_UPDATE {
    #Update atom plugins
    apm --color update upgrade
}

if [ $PACKAGE -eq 1 ]
then PACKAGE_UPDATE
fi

if [ $SHOW -eq 1 ]
then LIST
fi

if [ $UPDATE -eq 1 ]
then UPGRADE
fi

echo "Finish!"

exit 0
