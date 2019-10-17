#!/bin/bash
set -e

## Create and setup a python virtual environment
virtualenv venv
source ./venv/bin/activate
pip install -r requirements.txt


## install Ruby + Bundler
sudo snap install ruby --classic
gem install bundler
