#!/bin/bash

BASE=/opt/ide

EMACS_DIR=$BASE/user-emacs
R_DIR=$BASE/user-R

mkdir -p $EMACS_DIR
cp dot-emacs $EMACS_DIR/.emacs

mkdir -p $R_DIR
export R_LIBS_USER=$R_DIR
Rscript install-r-packages.r
