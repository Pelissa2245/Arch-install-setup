#!/bin/bash

# This script installs the organize tool on Arch Linux and its derivatives.


git clone https://github.com/Pelissa2245/organizer.git
cd organizer
chmod +x install_organize.sh
./install_organize.sh
cd ..
rm -rf organizer
echo "organize has been installed successfully."
