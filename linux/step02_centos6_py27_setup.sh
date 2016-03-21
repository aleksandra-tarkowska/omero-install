#!/bin/bash

if [ -z "$(getent passwd omero)" ]; then
	#start-create-user
    useradd -m omero
    #end-create-user
fi
chmod a+X ~omero

mkdir -p "$OMERO_DATA_DIR"
chown omero "$OMERO_DATA_DIR"

echo source \~omero/omero-centos6py27.env >> ~omero/.bashrc
