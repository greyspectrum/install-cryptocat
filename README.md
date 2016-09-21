# install-cryptocat

Automates the process of fetching, verifying, and installing Cryptocat.

This script automatically fetches the Cryptocat signing keys and verifies the signature on the copy of Cryptocat it downloads from the official project website. The results of this GPG signature verification are printed to the terminal.

This script also creates an additional shell script for launching Cryptocat in /usr/local/bin, so after this installation script runs, you can run Cryptocat at any time by typing `cryptocat` in the terminal, just like any other program. You can also launch Cryptocat from the GUI or save it to your dock/launcher, if you prefer.

***I'm still debugging one small issue with this script, so please don't try to use it, yet.***

## Installation

First, make this script executable:

`$ chmod +x install-cryptocat.sh`

Then, run it:

`$ ./install-cryptocat.sh`

## Disclaimer

**I am not associated with the Cryptocat project. This is just a script I wrote to make the installation less painful.**
