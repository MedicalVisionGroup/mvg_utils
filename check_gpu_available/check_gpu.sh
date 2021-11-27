#!/bin/bash

nodenames='nodelist-gpu.txt'

# same as `wc -l < <file>`, but handles missing EOL in `file`
n_lines=$(grep -c '^' "$nodenames")

for i in $(seq 1 $n_lines); do

    node=$(head -n ${i} "$nodenames" | tail -1)
    sbatch --nodelist=$node check_gpu_available_one_node.sh

    if [ $? -eq 0 ]; then
        :
    else
        echo "Checking GPU on ${node} failed with exit code ${?}"
    fi
done
