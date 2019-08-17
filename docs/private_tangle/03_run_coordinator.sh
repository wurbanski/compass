#!/bin/bash
set -o eu

scriptdir=$(dirname "$(readlink -f "$0")")
. $scriptdir/lib.sh

image=${1:-iota/compass/docker:coordinator}

load_config

docker run -t --net host --rm -v $scriptdir/data:/data "${image}" coordinator_deploy.jar \
	-layers /data/layers \
	-statePath /data/compass.state \
	-sigMode $sigMode \
	-powMode $powMode \
	-mwm $mwm \
	-security $security \
	-seed $seed \
	-tick $tick \
	-host $host \
	"$@"
