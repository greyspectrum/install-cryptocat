#!/usr/bin/env bash

##############################################################################
# install-cryptocat
# -----------------
#
# :author: greyspectrum
# :date: 20 September 2016
# :version: 0.1.0
##############################################################################

cd

# Fetch Cryptocat signing keys

gpg --recv-keys --keyserver keys.gnupg.net 0xab266cb76091b1f8

# Install Cryptocat

mkdir .cryptocat

cd .cryptocat

curl -O https://download.crypto.cat/client/Cryptocat-linux-x64.zip

unzip Cryptocat-linux-x64.zip

if gpg --verify Cryptocat.zip.asc Cryptocat.zip; then
    echo "This download has been verified. GPG signature check successful."
else
    echo "ERROR: BAD GPG SIGNATURE. ABORTING..."
    cd
    rm -rf .cryptocat
    exit 1
fi

unzip Cryptocat.zip

# Clean things up

rm Cryptocat-linux-x64.zip Cryptocat.zip.asc Cryptocat.zip

# Create startup script

cd

if test -e ~/bin; then
    echo -e '#!/usr/bin/env bash \n\n# Start up Cryptocat\n\ncd\n\ncd .cryptocat/Cryptocat-linux-x64\n\n./Cryptocat' > ~/bin/cryptocat
else
    mkdir bin
    echo -e '#!/usr/bin/env bash \n\n# Start up Cryptocat\n\ncd\n\ncd .cryptocat/Cryptocat-linux-x64\n\n./Cryptocat' > ~/bin/cryptocat
fi

chmod +x ~/bin/cryptocat

# Start Cryptocat

cd .cryptocat/Cryptocat-linux-x64

./Cryptocat &

echo -e '\nDOWNLOAD SUCCESSFULLY VERIFIED: GOOD GPG SIGNATURE. CRYPTOCAT INSTALLATION COMPLETE.'
