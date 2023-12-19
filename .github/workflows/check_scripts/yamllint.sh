#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

yamllint ./*.yml alumni/*.yml
