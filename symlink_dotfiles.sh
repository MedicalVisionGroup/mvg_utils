#!/bin/bash
# Author: Nalini

programname=$0

usage (){
    echo "usage: $programname source target"
    echo "  source: specify source file to copy"
    echo "  target: specify target location of symlink"
    exit 1
}


export machines="anise
    aniseed
    bergamot
    caraway
    cassia
    chili
    clove
    coriander
    curcum
    fennel
    fenugreek
    jimbu
    juniper
    lemongrass
    mace
    malt
    marjoram
    mint
    neem
    olida
    pandan
    peppercorn
    peppermint
    perilla
    rosemary
    sassafras
    sumac
    thyme
    turmeric
    wasabi
    zaatar
    "

    for machine in $machines;
        do
            ssh nmsingh@$machine.csail.mit.edu -q ln -sfn $1 $2
            echo "Symlinked $machine"
    done
