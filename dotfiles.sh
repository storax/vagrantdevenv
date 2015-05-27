#!/bin/bash -eux

sudo gem install homesick
homesick clone storax/storaxcastle
homesick symlink storaxcastle
