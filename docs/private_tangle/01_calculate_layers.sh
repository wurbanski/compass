#!/bin/bash
set -o eu

scriptdir=$(dirname "$(readlink -f "$0")")
. $scriptdir/lib.sh

image=${1:-iota/compass/docker:layers_calculator}

load_config

docker run -t --rm -v $scriptdir/data:/data "${image}" layers_calculator_deploy.jar -sigMode $sigMode -seed $seed -depth $depth -security $security -layers /data/layers
