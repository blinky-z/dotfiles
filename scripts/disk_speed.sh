#!/bin/bash

if [[ -x "$(command -v fio)" ]]; then
    sudo apt update && sudo apt install fio
fi

fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test \
    --filename=test --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75

