---
layout: default
title: Installation
nav_order: 3
has_children: true
permalink: /docs/installation
---

# Installation

## Compile script for CHAMP using Intel oneAPI compiler suite
To install **CHAMP** using [cmake](https://cmake.org/) you need to run the following commands:

```bash
cmake -S. -Bbuild -DCMAKE_Fortran_COMPILER=mpiifort -DBLAS_LIBRARIES="-qmkl=parallel"
cmake --build build -j 8
```

The first command is only required to set up the build directory and needs to be executed only once. An additional flag in the second line `--clean-first` is required to clean the build directory before compiling.


## CMAKE Options

To enable TREXIO library:
```bash
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=mpiifort -DENABLE_TREXIO=yes
```

To enable QMCkl library:
```bash
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=mpiifort -DENABLE_QMCKL=yes
```

To enable/disable vectorization based on the architecture:
```bash
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=mpiifort -DVECTORIZED=yes | no | auto
```

Clean and build:
```
cmake --build build --clean-first
```
