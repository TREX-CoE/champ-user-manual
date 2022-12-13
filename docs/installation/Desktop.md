---
layout: default
title: Desktop
nav_order: 3
parent: Installation
---

# Installation on Ubuntu Desktop

Ubuntu 22.04 onwards:

Install the required packages:
```bash
sudo apt install gfortran openmpi-bin libopenmpi-dev gawk libblacs-mpi-dev liblapack-dev
```
Set-up the build:
```bash
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=mpifort
```
Build:
```bash
cmake --build build -- -j2
```
To run in parallel:
```bash
mpirun -n 2 path_to_CHAMP/bin/vmc.mov1 -i vmc.inp -o vmc.out -e error
```