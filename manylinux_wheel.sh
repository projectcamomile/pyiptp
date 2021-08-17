#!/bin/bash

ENV_NAME[0]="cp36-cp36m"
ENV_NAME[1]="cp37-cp37m"
ENV_NAME[2]="cp38-cp38"
ENV_NAME[3]="cp39-cp39"

ENV_DIR="/opt/python"
ENV_EX="/bin/python3"

for IND in 0 1 2 3
do
	PY_PATH=$ENV_DIR/${ENV_NAME[IND]}$ENV_EX
	WH_NAME="pyiptp-0.1.0-${ENV_NAME[IND]}-linux_x86_64.whl"
	echo "working on ${ENV_NAME[IND]}"
	echo "Exe path is $PY_PATH"
	$PY_PATH -m pip install numpy scipy cython lxml matplotlib
	$PY_PATH -m pip wheel ./ -w output
	auditwheel repair ./output/$WH_NAME
done
exit 0
