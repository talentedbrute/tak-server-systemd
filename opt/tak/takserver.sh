#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

SCRIPT=$1

if [ "${SCRIPT}" == "" ];
then
  echo "Usage: takserver.sh <script to start>"
  exit 1
fi

cd ${SCRIPT_DIR}
./${SCRIPT}
