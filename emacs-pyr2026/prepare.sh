#!/bin/bash

BASE=/opt/ide
EMACS_DIR=$BASE/user-emacs
PYTHON_DIR=$BASE/user-python
R_DIR=$BASE/user-R

mkdir -p $EMACS_DIR
cp dot-emacs $EMACS_DIR/.emacs

mkdir -p $PYTHON_DIR
pip3 install --target $PYTHON_DIR -r requirements.txt

mkdir -p $R_DIR
export R_LIBS_USER=$R_DIR
Rscript install-r-packages.r
