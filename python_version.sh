#!/bin/bash
which python3 > /dev/null 2>&1; rc=$?; if [[ $rc != 0 ]]; then echo python; else echo python3; fi
