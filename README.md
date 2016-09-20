# install-cryptocat

Automates the process of fetching, verifying, and installing cryptocat.

If you take a look at this script, you'll notice that it is a little more complicated than it has any right to be. The part of the script that fetches Cryptocat from its website, unzips it, and runs it is naturally quite short. Unfortunately, in order to get the script to verify the downloaded copy of Cryptocat with the Cryptocat signing key, things get a little more complicated. Cryptocat's author signs all releases with a version of GnuPG that is not offered as a Debian package. In order to verify a release, you have to build GnuPG v2.1.15 from source. In order to this, you have to build its three dependencies from source, as well, and of course, since you will be fetching all of these files from the web, you'll need to import the relavent keys and check the signatures on each of these archives, before building them. This is a pain, but honestly the problem isn't that Cryptocat's autor used the latest version of GnuPG. The good news is that Debian should be offering the latest version as a package, soon.

I'm still testing this script. A tested version should be up ASAP.
