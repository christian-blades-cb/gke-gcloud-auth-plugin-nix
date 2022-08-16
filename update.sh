#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nix -p jq -p curl

BASE_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/

MANIFEST="${BASE_URL}components-2.json"

manifest=$(curl -s $MANIFEST)

curl -s $MANIFEST | jq '[.components[] | select(.id | test("gke-gcloud-auth-plugin-")) | {"key": (.id|tostring), "value": { "url": .data.source, "sha256": .data.checksum, "version": .version } }] | from_entries' < ~/components.json > sources.json
