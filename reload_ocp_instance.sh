#!/bin/sh

if [ "$1" != "" ]; then
    myfilename=${1}
    echo "Positional parameter 1 contains something"
else
    myfilename="vars.yaml"
    echo "Positional parameter 1 is empty"
fi
echo "Your var filename is : $myfilename"
dir=${PWD}  
now=$(date +"%T")
echo "################################################################################"
echo "#                      PROVISIONED START TIME : $now                           #"
echo "################################################################################"
ansible-playbook  -e @vars.yaml  $dir/reload_vsi_payblook.yaml -i $dir/artifacts/hosts
now=$(date +"%T")
echo "################################################################################"
echo "#                      PROVISIONED END TIME : $now                             #"
echo "################################################################################"
