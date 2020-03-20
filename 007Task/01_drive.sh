#!/bin/bash -x

#CREATE BASH PROFILE
file=~/.bash_profile
if [ ! -f $file ]; then 
	touch $file 
	cat  > $file <<-EOF
	#LINKING BASH PROFILE TO BASHRC
	if [ -f ~/.bashrc ]; then 
		source ~/.bashrc
	fi
	EOF

fi
