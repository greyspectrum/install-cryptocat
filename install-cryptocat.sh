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

# Download Werner Koch's signing keys. This is necessary to verify
# the GPG source files.

gpg --recv-keys 0x249b39d24f25e3b6

gpg --recv-keys 0x53b620d01ce0c630

cd Downloads

# Fetch dependencies for GPG 2.1.15, verify the source files,
# extract the archives, and build from source.

curl -O ftp://ftp.gnupg.org/gcrypt/npth/npth-1.2.tar.bz2

curl -O ftp://ftp.gnupg.org/gcrypt/npth/npth-1.2.tar.bz2.sig

gpg --verify npth-1.2.tar.bz2.sig npth-1.2.tar.bz2

tar -xvf npth-1.2.tar.bz2

cd npth-1.2

./configure
make
sudo make install

curl -O ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.9.tar.gz

curl -O ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.9.tar.gz.sig

gpg --verify libgpg-error-1.9.tar.gz.sig libgpg-error-1.9.tar.gz

tar -xvf libgpg-error-1.9.tar.gz

cd libgpg-error-1.9

./configure
make
sudo make install

curl -O ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.7.3.tar.gz

curl -O ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.7.3.tar.gz.sig

gpg --verify libgcrypt-1.7.3.tar.gz.sig libgcrypt-1.7.3.tar.gz

tar -xvf libgcrypt-1.7.3.tar.gz

cd libgcrypt-1.7.3

./configure
make
sudo make install

curl -O ftp://ftp.gnupg.org/gcrypt/libksba/libksba-1.3.5.tar.bz2

curl -O ftp://ftp.gnupg.org/gcrypt/libksba/libksba-1.3.5.tar.bz2.sig

gpg --verify libksba-1.3.5.tar.bz2.sig libksba-1.3.5.tar.bz2

tar -xvf libksba-1.3.5.tar.bz2

cd libksba-1.3.5

./configure
make
sudo make install

curl -O ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-2.4.3.tar.bz2

curl -O ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-2.4.3.tar.bz2.sig

gpg --verify libassuan-2.4.3.tar.bz2.sig libassuan-2.4.3.tar.bz2

tar -xvf libassuan-2.4.3.tar.bz2

cd libassuan-2.4.3

./configure
make
sudo make install

# Fetch the source files for GPG 2.1.15

curl -O https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.15.tar.bz2

curl -O https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.15.tar.bz2.sig

# Verify the source files and extract the archive.

gpg --verify gnupg-2.1.15.tar.bz2.sig gnupg-2.1.15.tar.bz2

tar -xvf gnupg-2.1.15.tar.bz2

cd gnupg-2.1.15

./configure
make
sudo make install

cd

# Fetch Cryptocat signing keys

gpg --recv-keys 0xab266cb76091b1f8

# Install Cryptocat

mkdir .cryptocat

cd .cryptocat

curl -O https://download.crypto.cat/client/Cryptocat-linux-x64.zip

unzip Cryptocat-linux-x64.zip

gpg --verify Cryptocat.zip.asc Cryptocat.zip

unzip Cryptocat.zip

rm Cryptocat-linux-x64.zip

cd Cryptocat-linux-x64

./Cryptocat
