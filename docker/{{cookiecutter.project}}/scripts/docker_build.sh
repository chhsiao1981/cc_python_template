#!/bin/bash

branch=`git status|head -1|sed -E 's/^HEAD detached at //g'|sed -E 's/^On branch //g'`
project=`basename \`pwd\``

echo -e "\033[1;32m[INFO]\033[m to build ${project}:${branch}"
docker build -t ${project}:${branch} .
