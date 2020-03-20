#!/bin/bash -x


INSTALL_DIR=~/opt
#JAVA
VERSION=jdk1.8.0_221
#echo "#---JAVA ENV VARIABLES----"  >> ~/.bashrc
#echo J2SDKDIR="$INSTALL_DIR/$VERSION" >> ~/.bashrc
#echo J2REDIR="$INSTALL_DIR/$VERSION/jre" >> ~/.bashrc
#echo JAVA_HOME="$INSTALL_DIR/$VERSION" >> ~/.bashrc
#echo export PATH="$PATH:$INSTALL_DIR/$VERSION/bin" >> ~/.bashrc
#
#mkdir $INSTALL_DIR/$VERSION/db 
#echo DERBY_HOME="$INSTALL_DIR/$VERSION/db"  >> ~/.bashrc


#RUN THIS IF ABOVE METHOD FAILS
sudo update-alternatives --install "/usr/bin/java" "java" "$INSTALL_DIR/$VERSION/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "$INSTALL_DIR/$VERSION/bin/javac" 0
sudo update-alternatives --set java $INSTALL_DIR/$VERSION/bin/java
sudo update-alternatives --set javac $INSTALL_DIR/$VERSION/bin/javac

