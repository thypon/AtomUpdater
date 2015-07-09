#!/bin/bash

FORCE=0
PACKAGE=0

for some in $*
do
    if [ $some == "--force"  ] || [ $some == "-f" ]
    then FORCE=1
    fi
    if
	[ $some == "--upgrade-packages" ] || [ $some == "-u" ]
	then PACKAGE=1
    fi
    
    done




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

if [ $PACKAGE -eq 1 ]
then apm --color update upgrade
fi


echo "Finish!"

exit 0
