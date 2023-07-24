#!/bin/bash

echo "  __  __            ____        _    "  
echo " |  \/  |          |  _ \      | |  "
echo " | \  / | ___  _ __| |_) | ___ | |_ "
echo " | |\/| |/ _ \| '__|  _ < / _ \| __| "
echo " | |  | | (_) | |  | |_) | (_) | |_  "
echo " |_|  |_|\___/|_|  |____/ \___/ \__| "

echo""

echo -e "\033[0;36mWelcome to MorBot Start UP script !"
echo -e "Before installation please check if you have Ubuntu 18.04 and python3.6 on your system . \033[0m"
while true; do
    read -p "Do you wish to continue?[Y/n]" yn
    case $yn in
        [Yy] ) break;;
        [Nn] ) exit;;
        * ) echo "Please answer 'y' or 'n'";;
    esac
done


#!/bin/bash

echo "Please enter your sudo password:"
read -s SUDO_PASSWORD

# Update package list
echo $SUDO_PASSWORD | sudo -S apt-get update

# Check Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)
REQUIRED_UBUNTU_VERSION="18.04"

if [ "$UBUNTU_VERSION" == "$REQUIRED_UBUNTU_VERSION" ]; then
    echo "Ubuntu version 18.04 detected. Proceeding with package installation."

    # Array of system package names to be installed
    SYSTEM_PACKAGE_NAMES=("ssh" "curl" "libffi-dev" "python3-dev" "nano" "v4l-utils")

    # Iterate through the system packages and install each one
    for PACKAGE_NAME in "${SYSTEM_PACKAGE_NAMES[@]}"; do
        echo "Installing $PACKAGE_NAME..."
        echo $SUDO_PASSWORD | sudo -S apt-get install -y $PACKAGE_NAME

        # Check the package version
        PACKAGE_VERSION=$($PACKAGE_NAME --version)
        echo "Installed $PACKAGE_NAME version: $PACKAGE_VERSION"
        echo ""
    done

    # Array of Python package names to be installed
    PYTHON_PACKAGE_NAMES=("pip" "cffi" "ipywidgets" "torchvision")

    # Ensure Python 3.6 and pip are installed
    echo $SUDO_PASSWORD | sudo -S apt-get install -y python3.6 python3-pip

    # Iterate through the Python packages and install each one
    for PACKAGE_NAME in "${PYTHON_PACKAGE_NAMES[@]}"; do
        echo "Installing Python package $PACKAGE_NAME..."
        echo  python3.6 -m pip install $PACKAGE_NAME

        # Check the package version
        PACKAGE_VERSION=$(python3.6 -c "import $PACKAGE_NAME; print($PACKAGE_NAME.__version__)")
        echo "Installed Python package $PACKAGE_NAME version: $PACKAGE_VERSION"
        echo ""
    done

else
    echo "This script is designed for Ubuntu 18.04. Your current version is $UBUNTU_VERSION."
    exit 1
fi
