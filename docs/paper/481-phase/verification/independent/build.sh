#!/bin/sh
set -eu
cd "$(dirname "$0")"
${CXX:-g++} -O3 -g -std=c++17 -fopenmp -fsanitize=undefined \
  -fno-sanitize-recover=all check_phase.cpp -o check_phase
