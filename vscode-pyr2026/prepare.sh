#!/bin/bash

BASE=/opt/ide
PYTHON_DIR=$BASE/user-python
R_DIR=$BASE/user-R

mkdir -p $PYTHON_DIR
pip3 install --target $PYTHON_DIR -r requirements.txt

mkdir -p $R_DIR
export R_LIBS_USER=$R_DIR
Rscript install-r-packages.r
