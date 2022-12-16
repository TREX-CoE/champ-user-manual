---
layout: default
title: QMCkl Library
parent: Dependencies
nav_order: 4
authors:
    - Ravindra Shinde
tags:
    - CHAMP
    - QMCKL
---


## QMCkl Library

{: .warning }
The version of the the library must be greater than v0.2.1 for usage in CHAMP.


The domain of quantum chemistry needs a library in which the main
kernels of Quantum Monte Carlo (QMC) methods are implemented. In the
library proposed in this project, we expose the main algorithms in a
simple language and provide a standard API and tests to enable the
development of high-performance QMCkl implementations taking
advantage of modern hardware.


### Source Code

Obtain a source distribution.

To clone the repository, use:
```bash
git clone https://github.com/TREX-CoE/qmckl.git
```


### Build and Install
To build the documentation version:

```bash
./configure
```

To build an optimized version with Intel compilers:
```bash
./configure \
   --with-icc \
   --with-ifort \
   --enable-hpc
```

To build an optimized version with GCC:
```bash
./configure \
  CC=gcc \
  CFLAGS="-g -O2 -march=native  -flto -fno-trapping-math -fno-math-errno -ftree-vectorize" \
  FC=gfortran \
  FCFLAGS="-g -O2 -march=native  -flto -ftree-vectorize" \
  --enable-hpc
```


Then, compile with:
```bash
make -j
make -j check
sudo make install
sudo make installcheck
```