#! /bin/sh
#
# pyfrs2vtu.sh
# Copyright (C) 2016 Pi-Yueh Chuang <pychuang@gwu.edu>
#
# Distributed under terms of the MIT license.
#

if [ -z ${PyFR} ]
then
    echo ERROR: the environmenal variable PyFR is not set
    exit 1
fi

if [[ ! ${PYTHONPATH} =~ ${PyFR} ]]
then
    echo ERROR: the environmenal variable PYTHONPATH does not contain PyFR path
    exit 1
fi

if [ ! -d "solutions" ]
then
    echo ERROR: the directory solutions does not exist
    exit 1
fi

if [ -z $1 ]
then
    echo ERROR: the script misses its only one argument
    exit 1
else
    if [[ ${1: -6} != ".pyfrm" ]]
    then
        echo ERROR: the extension of mesh file indicates it is not a PyFR mesh
        exit 1
    fi
fi

if [ ! -d "vtu" ]
then
    mkdir vtu
fi

for file in `ls solutions`
do
    vtuFile=`echo ${file} | sed "s/pyfrs/vtu/g"`

    if [ ! -f vtu/${vtuFile} ]
    then
        echo "Converting ${file} to ${vtuFile}"
        $PyFR/pyfr/pyfr export $1 solutions/${file} vtu/${vtuFile} -p double
    fi
done
