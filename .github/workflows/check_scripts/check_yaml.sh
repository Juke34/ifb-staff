#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

.github/workflows/check_scripts/check_yaml.py staff/*.yaml
