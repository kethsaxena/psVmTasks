#!/bin/bash -x

INSTALL_DIR=~/opt
#FACTORY FUNCTIONS
getSoft() {
 if [ ! -f $INSTALL_DIR/$1 ]; then wget $2;
 fi
}

#PYTHON VANILLA SOURCE INSTALLATION
PYVERSION=Python-3.7.0.tgz
LINK=https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
getSoft $PYVERSION $LINK

tar -xvzf $PYVERSION


#PYTHON BUILD TOOLS INSTALLATION

sudo apt-get install build-essential
sudo apt-install libffi-devel
sudo apt install python3-pip


cd  $INSTALL_DIR/"${PYVERSION%.*}"

if [ ! -d $INSTALL_DIR/python3 ]; then  
	mkdir $INSTALL_DIR/python3 
	echo  $INSTALL_DIR/python3 "CREATED SUCCESSFULLY" ;
fi


if [ -d $INSTALL_DIR/python3 ]; then  $INSTALL_DIR/${PYVERSION%.*}/configure --prefix=$INSTALL_DIR/python3 --enable-optimizations;fi


make clean
make -j 8
#make test
sudo make altinstall
sudo update-alternatives --install /usr/bin/python python $INSTALL_DIR/bin/python3.7 1


echo "YOUR OWN PYTHON BUILD TO SUFFOCATE YOUR WORLD"


