#!/bin/bash

ICEVER=${ICEVER:-ice35}

# Ice installation
if [[ "$ICEVER" =~ "ice35" ]]; then
	#start-recommended
	curl -o /etc/yum.repos.d/zeroc-ice-el6.repo \
	http://download.zeroc.com/Ice/3.5/el6/zeroc-ice-el6.repo

	yum -y install db53 db53-utils mcpp
	mkdir /tmp/ice-download
	cd /tmp/ice-download

	wget http://downloads.openmicroscopy.org/ice/experimental/Ice-3.5.1-b1-centos6-iuspy27-x86_64.tar.gz

	tar -zxvf /tmp/ice-download/Ice-3.5.1-b1-centos6-iuspy27-x86_64.tar.gz

	# so we don't have to update ICE_HOME
	mv Ice-3.5.1-b1-centos6-iuspy27-x86_64 /opt/Ice-3.5.1

	# make path to Ice globally accessible
	# if globally set, there is no need to export LD_LIBRARY_PATH
	echo /opt/Ice-3.5.1/lib64 > /etc/ld.so.conf.d/ice-x86_64.conf
	ldconfig
	#end-recommended
fi