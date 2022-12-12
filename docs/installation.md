---
layout: default
title: Installation
nav_order: 11
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


# Installation

CHAMP relies on various other program packages:

1. [Parser](https://github.com/neelravi/mpi-libfdf-parser):
   An easy-to-use and easy-to-extend keyword-value pair based input file parser written in Fortran 2008.  This parser uses a heavily modified libFDF library and is written by [Ravindra Shinde](https://github.com/neelravi). It can parse keyword-value pairs, blocks of data, and general variables with different physical units in an order-independent manner. Our implementation can handle multiple data types and file formats. The parser is kept as a library in the code, however, it can be easily adapted by any other Fortran-based code.

2. GAMESS:
   For finite systems the starting wavefunction is obtained from the
   quantum chemistry program GAMESS, written by Mike Schmidt and
   collaborators at Iowa State University.

3. GAMESS_Interface:
   The wavefunction produced by GAMESS has to be cast in a form
   suitable for input to CHAMP.  This is a lot more work than first meets
   the eye. We provide a python package inside the CHAMP's tool directory to extract all the necessary information needed from a GAMESS calculation. The tool can also extract information from a TREXIO file in the hdf5 file format. This utility is written by [Ravindra Shinde](https://github.com/neelravi).

4. MOLCAS Interface:
   A python package qc2champ can be used to convert a    MOLCAS or an openMOLCAS calculation into the input files needed by CHAMP. This package is written by [Ravindra Shinde](https://github.com/neelravi). An independent version of the convertor script was added thanks to Csaba Daday and Monika Dash.

5. TREXIO (optional):
    The TREXIO library is a C library for reading and writing the
    TREXIO file format. The TREXIO file format is a HDF5 file format
    for storing the electronic wavefunctions.

6. QMCkl (optional):
    QMCkl is a high-performance library for executing common quantum Monte Carlo calculations kernels.

## Requirements
1. cmake >= 3.17
2. gfortran/gcc >= 9.3.0 or Intel Fortran 2020 onwards
3. BLAS/LAPACK or Intel MKL
4. openMPI >= 3.0 or Intel MPI
5. [Optional] TREXIO library >= 2.0.0
6. [Optional] QMCkl library >= 0.2.1
7. [Optional] doxygen (for documentation)


## Installation of dependencies


### 1. Install or load [cmake](https://cmake.org/)

```bash
sudo apt-get install -y cmake
```

or

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.25.1/cmake-3.25.1-linux-x86_64.sh
tar -xzvf cmake-3.25.1-linux-x86_64.sh
export PATH=cmake-3.25.1-linux-x86_64/bin:$PATH
```

{: .warning }
The version of the cmake must be greater than 3.17.


### 2. Installation of Intel oneAPI compiler suite (v2022.3.1)

#### Installation without sudo access

Download Intel oneAPI basekit and HPCkit for free from

```bash
wget https://registrationcenter-download.intel.com/akdlm/irc_nas/18970/l_BaseKit_p_2022.3.1.17310_offline.sh
chmod a+x ./l_BaseKit_p_2022.3.1.17310_offline.sh
sh ./l_BaseKit_p_2022.3.1.17310_offline.sh

wget https://registrationcenter-download.intel.com/akdlm/irc_nas/18975/l_HPCKit_p_2022.3.1.16997_offline.sh
chmod a+x ./l_HPCKit_p_2022.3.1.16997_offline.sh
sh ./l_HPCKit_p_2022.3.1.16997_offline.sh
```

After installation export the path to your `~/.bashrc` file


#### Installation with sudo access

```bash
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
sudo add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"
sudo apt-get update
```

#### Install the components

```bash
sudo apt-get install -y intel-oneapi-common-vars
sudo apt-get install -y intel-oneapi-compiler-fortran-2022.3.1
sudo apt-get install -y intel-oneapi-mkl-2022.3.1
sudo apt-get install -y intel-oneapi-mkl-devel-2022.3.1
sudo apt-get install -y intel-oneapi-mpi-2022.3.1
sudo apt-get install -y intel-oneapi-mpi-devel-2022.3.1
```

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

## Installation on HPC facilities

Here are a couple of recipes for commonly used computing facilities, which can be easily adapted.

**Snellius** (snellius.surf.nl):

To compile the code, first load the required modules:

```bash
module purge
module load 2022
module load git
module load intel/2022a
module load intel-compilers/2022.1.0
module load CMake/3.23.1-GCCcore-11.3.0
module load iimpi/2022a
module load HDF5/1.12.2-iimpi-2022a
module load imkl/2022.1.0
```

then set-up the build:

```bash
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=mpiifort
```

and finally build:
```bash
cmake --build build -j8 --clean-first
```

To run the code, you need to submit a job to the queue system:
```bash
sbatch job.cmd
```

where `job.cmd` is a SLURM script that looks like this:

```bash
#!/bin/bash
#!/bin/bash
#SBATCH -t 0-12:00:00            # time in (day-hours:min:sec)
#SBATCH -N 1                     # number of nodes
#SBATCH -n 128                   # number of cores
#SBATCH --ntasks-per-node 128    # tasks per node
#SBATCH -J 1-128-AMD             # name of the job
#SBATCH -o vmc.%j.out            # std output file name for slurm
#SBATCH -e vmc.%j.err            # std error file name for slurm
#SBATCH --exclusive              # specific requirements about node
#SBATCH --partition thin         # partition (queue)
#
module purge
module load 2022
module load intel/2022a
module load intel-compilers/2022.1.0
module load CMake/3.23.1-GCCcore-11.3.0
module load iimpi/2022a
module load HDF5/1.12.2-iimpi-2022a
module load imkl/2022.1.0
#
export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi2.so
cd $PWD
srun champ/bin/vmc.mov1 -i input.inp -o output.out -e error
```

**CCPGate**:

To build with mpiifort, load the required modules of the Intel Compiler and MPI:

```bash
module load compiler
module load compiler-rt
module load mkl
module load mpi
module load trexio/2.3.0-intel     # Optional
module load python3                # Optional
```
Setup the build:
```
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=mpiifort -DENABLE_TREXIO=yes
```

To run the code with Intel Compilers and MPI:
```bash
mpirun -np 24  champ/bin/vmc.mov1 -i input.inp -o output.out -e error
```

To build with gfortran:

Setup the build:

```bash
cmake -H. -Bbuild -DCMAKE_Fortran_COMPILER=/usr/bin/mpif90
```

which will use LAPACK & BLAS from the Ubuntu repository. (Cmake should find them already if none of the Intel MKL variables are set.) Combining gfortran with the Intel MKL is possible but requires special care to work with the compiler flag `-mcmodel=large`.

To run the code:
```bash
mpirun -s all -np "n process" -machinefile "machinefile"
```

## Installation on Ubuntu Desktop

Ubuntu 20:
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
mpirun --stdin all -n 2 path_to_CHAMP/bin/vmc.mov1 -i vmc.inp -o vmc.out -e error
```

