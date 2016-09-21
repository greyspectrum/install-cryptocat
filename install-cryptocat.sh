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

gpg --verify Cryptocat.zip.asc Cryptocat.zip

unzip Cryptocat.zip

# Clean things up

rm Cryptocat-linux-x64.zip Cryptocat.zip.asc Cryptocat.zip

# Create startup script

cd

echo -e '#!/usr/bin/env bash \n\n# Start up Cryptocat\n\ncd\n\ncd .cryptocat/Cryptocat-linux-x64\n\n./Cryptocat' > /usr/local/bin/cryptocat

chmod +x /usr/local/bin/cryptocat

# Start Cryptocat

cd .cryptocat/Cryptocat-linux-x64

./Cryptocat 
