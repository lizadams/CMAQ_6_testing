#!/bin/csh -f
source /etc/profile.d/modules.csh

# module load intel/2024.1.0

mpiifx hello.update.f90 -o hello_world_update

mpiifx -check bounds -traceback -O0 hello.update.f90 -o hello_world_update-debug
