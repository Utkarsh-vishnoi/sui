#!/bin/sh
set -e

CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    step ca bootstrap --ca-url "${CA_URL}" --fingerprint "${CA_FINGERPRINT}" --install --force
    step ca root ca.crt
    update-ca-certificates
else
    echo "-- Not first container startup --"
fi

exec "$@"
