#!/usr/bin/env bash

##############################################################################
# install-cryptocat
# -----------------
#
# :author: greyspectrum
# :date: 18 October 2016
# :version: 0.1.0
##############################################################################

cd

# Fetch Cryptocat signing keys
echo "==Fetching Cryptocat signing keys..."

gpg --recv-keys --keyserver keys.gnupg.net 0xab266cb76091b1f8

# Verifying Cryptocat signing key fingerprint
echo "==Verifying Cryptocat signing key fingerprint..."

echo -e 'pub   3072R/6091B1F8 2016-08-09\n      Key fingerprint = FA21 CD53 6312 FADF 9B5D  D804 AB26 6CB7 6091 B1F8\nuid                  Nadim Kobeissi <nadim@nadim.computer>\nsub   3072R/A4D437B0 2016-08-09\n' > fingerprint

if gpg --fingerprint 0xab266cb76091b1f8 | diff -q fingerprint -; then
    echo -e '==Verified. The Cryptocat signing key provided by the keyserver, 0x6091B1F8, has the expected fingerprint.\nKey Fingerprint: FA21 CD53 6312 FADF 9B5D  D804 AB26 6CB7 6091 B1F8'
else
    echo "==ERROR: THE KEY PROVIDED BY THE KEYSERVER HAS RETURNED AN UNEXPECTED FINGERPRINT. ABORTING..."
    rm fingerprint
    exit 1
fi

# Download Cryptocat
echo "==Download Cryptocat..."

mkdir .cryptocat

cd .cryptocat

curl -O https://download.crypto.cat/client/Cryptocat-linux-x64.zip

unzip Cryptocat-linux-x64.zip

# Verify Cryptocat
echo "==Verifying Cryptocat download..."

if gpg --verify Cryptocat.zip.asc Cryptocat.zip; then
    echo "==This download has been verified. GPG signature check successful."
else
    echo "==ERROR: BAD GPG SIGNATURE. ABORTING..."
    cd
    rm -rf .cryptocat
    exit 1
fi

unzip Cryptocat.zip

# Clean things up

rm Cryptocat-linux-x64.zip Cryptocat.zip.asc Cryptocat.zip

# Create startup script
echo "==Creating startup script... To launch Cryptocat, you can use the graphical user interface or just type cryptocat in the terminal. Please wait..."

cd

rm fingerprint

if test -e ~/bin; then
    echo -e '#!/usr/bin/env bash \n\n# Start up Cryptocat\n\ncd\n\ncd .cryptocat/Cryptocat-linux-x64\n\n./Cryptocat' > ~/bin/cryptocat
else
    mkdir bin
    echo -e '#!/usr/bin/env bash \n\n# Start up Cryptocat\n\ncd\n\ncd .cryptocat/Cryptocat-linux-x64\n\n./Cryptocat' > ~/bin/cryptocat
fi

chmod +x ~/bin/cryptocat

# Start Cryptocat
echo "==Starting Cryptocat..."

cd .cryptocat/Cryptocat-linux-x64

./Cryptocat &

echo -e '\n==DOWNLOAD SUCCESSFULLY VERIFIED: GOOD GPG SIGNATURE.\n\n==CRYPTOCAT INSTALLATION COMPLETE.'
