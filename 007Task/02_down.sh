#!/bin/bash -x



#CREATE INSTALLATION DIRECTORY 
INSTALL_DIR=~/opt
if [ ! -d $INSTALL_DIR ];then mkdir $INSTALL_DIR && echo "1.----INSTALL DIRECTORY CREATED-----";fi
cd $INSTALL_DIR


#FACTORY FUNCTIONS
getSoft() {
 if [ ! -f $INSTALL_DIR/$1 ]; then wget $2;
 fi
}


#JAVA INTALLATION
JAVA_VERSION=jdk-8u221-linux-x64.tar.gz
if [ -f ~/Downloads/$JAVA_VERSION ]; then mv ~/Downloads/$JAVA_VERSION $INSTALL_DIR;fi  


#SBT INSTALLATION
VERSION=sbt-1.2.7.tgz
LINK=https://piccolo.link/sbt-1.2.7.tgz
getSoft $VERSION $LINK

#KAFKA  INSTALLATION
VERSION=kafka_2.11-2.3.1.tgz
LINK=https://downloads.apache.org/kafka/2.3.1/kafka_2.11-2.3.1.tgz
getSoft $VERSION $LINK

#FLUME INSTALTION
VERSION=apache-flume-1.9.0-src.tar.gz
LINK=http://archive.apache.org/dist/flume/stable/apache-flume-1.9.0-src.tar.gz
getSoft $VERSION $LINK

#SCALA INSTALLATION
VERSION=scala-2.11.8.tgz
LINK=https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz
getSoft $VERSION $LINK


#UNTAR ALL THE DOWNLOADS
var=$(ls)

for item in $var
do 
	if tar -xvzf $item; then echo "xvzf WORKED";
	elif tar -xf $item ; then echo "xf WAS TO BE BROUGHT IN BASTARD";
	else  echo $item "WAS NOT UNTARRED YOU MORON OF LIFE";
        fi

done



