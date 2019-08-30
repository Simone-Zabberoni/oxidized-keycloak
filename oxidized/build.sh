#!/bin/bash

VERSION="$1"
BASEIMAGENAME="szabberoni/oxidized"

if [ -z "$1" ]; then
    echo "Provide a tag for the build"
else
    echo "Building from Dockerfile to image $BASEIMAGENAME:${VERSION}..."
    docker build -t $BASEIMAGENAME:${VERSION} .
fi


