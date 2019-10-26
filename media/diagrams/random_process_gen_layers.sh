#!/bin/bash
set -e

mkdir -p ./random_process_layers

declare -a layers=("layer-6" "layer-5" "layer-4" "layer-3" "layer-2" "layer-1")

for layer in "${layers[@]}"; do
    sed "s/\\(<\!-- set_layer -->\\).*\\(<\!-- end_set_layer -->\\)/\\1${layer}\\2/g" random_process.svg > random_process_layers/random_process_${layer}.svg
done