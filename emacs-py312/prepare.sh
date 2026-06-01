#!/bin/bash

BASE=/opt/ide
EMACS_DIR=$BASE/user-emacs
PYTHON_DIR=$BASE/user-python

mkdir -p $EMACS_DIR
cp dot-emacs $EMACS_DIR/.emacs

mkdir -p $PYTHON_DIR
pip3 install --target $PYTHON_DIR -r requirements.txt
