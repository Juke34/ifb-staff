#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

yamllint staff/*.yaml
