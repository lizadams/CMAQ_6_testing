#!/bin/csh -f
#SBATCH -J CMAQ_6.0
#SBATCH --mail-user=lizadams@email.unc.edu
#SBATCH --mail-type=all         # Send email at begin and end of job
## Hard Requirement for Epyc 9684x Processor
#SBATCH -C 9684x
#SBATCH -C ndr
##SBATCH --hint=nomultithread
#SBATCH --nodes=1
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --cpus-per-task=48
#SBATCH --mem-per-cpu=200M
#SBATCH -t 00:30:00

module purge
module add intel/2024.2.1

ulimit -s unlimited
#setenv UCX_TLS ^ud
#setenv I_MPI_SHM off
#setenv I_MPI_SHM shm
#setenv I_MPI_FABRICS shm
#setenv I_MPI_DEBUG 10
#setenv I_MPI_OFI_LIBRARY_INTERNAL 1
mpirun -n 2 ./hello_world_update
