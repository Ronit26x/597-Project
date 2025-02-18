#!/bin/bash

PACKAGE_NAME="requsete"

sudo apt update
sudo apt install -y python3 python3-pip python3-venv
pip3 install --upgrade setuptools wheel twine

echo "Creating package directory..."
mkdir -p $PACKAGE_NAME/$PACKAGE_NAME
cd $PACKAGE_NAME

echo "Writing setup.py..."
cat <<EOL > setup.py
from setuptools import setup, find_packages

setup(
    name="$PACKAGE_NAME",
    version="0.6", 
    packages=find_packages(),
    author="Ronit Bhansali",
    author_email="ronitbhansali2k1@gmail.com",
    description="A sample Python package named $PACKAGE_NAME",
    long_description="A long description of the package.",
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/$PACKAGE_NAME",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
)
EOL

echo "Creating package files..."
mkdir -p $PACKAGE_NAME
cat <<EOL > $PACKAGE_NAME/_init_.py
def get(url, auth=None):
    print("hello from requsets function")
EOL

echo "Creating README.md..."
cat <<EOL > README.md
# $PACKAGE_NAME

This is a sample Python package.

## Installation

\⁠ \ ⁠\`bash
pip install $PACKAGE_NAME
\⁠ \ ⁠\`

## Usage

\⁠ \ ⁠\`python
import requsets

requsets.get('https://httpbin.org/basic-auth/user/pass', auth=('user', 'pass'))
\⁠ \ ⁠\`
EOL

echo "Creating LICENSE file..."
cat <<EOL > LICENSE
MIT License
EOL

echo "Building package..."
python3 setup.py sdist bdist_wheel

echo "Package built successfully! Files are in the 'dist' directory."
cd ..
