#AtomUpdater

This is a simple bash script to update Atom and its plugin.

It will download the .deb file from there https://github.com/atom/atom/releases/latest. 


AtomUpdater has four options: 


* *-upkg, --upgrade-packages* : It will update **all** package of Atom
* *-l, --list* : It will list all packages of Atom
* *-u, --upgrade* : It will check for update **and** update Atom:
* *-f, --force* : It will update Atom **anyway** (use only with -u);

TODO:

- [ ] Check hash file;
- [ ] Add RPM file too;
- [ ] ...

##Why bash?!
Why not?! Bash is cool!

###Why only deb?

I use debian. Debian Rulez. Period.

(well, maybe I'll add rpm too... )
