#!/bin/csh -f

########################################################################
# Revision History: 
# B. Murphy: Initial Implementation 
#
#
# 6/24/2019 F. Sidi: Added gcc-9.1.0 option
# 12/10/2019 F. Sidi: Added Two-Way environment variables
# 08/07/2023 C. Hogrefe Added RHEL7/8 backward/forward compatibility
# 11/13/2024 F. Sidi Updated Default Compilers, removed RHEL7 compatibility
########################################################################
#> This script is for setting up compilation and runtime environments
#> at EPA on Atmos.

source /etc/profile.d/lmod-modules.csh 
module purge

#> Compiler settings
 switch ( $compiler )

    #> Intel fortran compiler......................................................
    case intel:
    
      switch ( $compilerVrsn )
        
         case 21.4:                                                                      # Added by J. Herwehe 11/23/2021

               module load AllLibraries intel/21.4 intel/21/intelmpi/21.4 intel/21/netcdf/4.8.1 intel/21/hdf5/1.10.8 #intel/21/pnetcdf/1.12.3
               #module load intel intelmpi netcdf pnetcdf hdf5
               #> If the above pnetcdf module does not work because of the older Intel compiler, try this build
               #> for MPAS-A, available at /home/jherwehe/mpas/mpas_io.with_fPIC/pnetcdf-1.12.2/intel-21.4

               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /home/wdx/lib/x86_64/ifc-18.0/ioapi_3.1/ioapi/fixed_src    #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /home/wdx/lib/x86_64/ifc-18.0/ioapi_3.1/Linux2_x86_64ifort #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.8.1/intel-21.4/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.8.1/intel-21.4/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.8.1/intel-21.4/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.8.1/intel-21.4/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/oneapi/mpi/2021.6.0/libfabric/lib       #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/oneapi/mpi/2021.6.0/include   #> MPI directory path

               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.8.1/intel-21.4
               setenv IOAPI  /home/wdx/lib/x86_64/ifc-18.0/ioapi_3.1
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/22.1.3 

               breaksw
   
         case 23.2:                                                                      

               module load AllLibraries intel/23.2 intel/23/intelmpi/23.2 intel/23/netcdf/4.9.2 intel/23/hdf5/1.10.8 intel/23/ioapi/3.2 #intel/21/pnetcdf/1.12.3
               #module load intel intelmpi netcdf pnetcdf hdf5
               #> If the above pnetcdf module does not work because of the older Intel compiler, try this build
               #> for MPAS-A, available at /home/jherwehe/mpas/mpas_io.with_fPIC/pnetcdf-1.12.2/intel-21.4

               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /usr/local/apps/ioapi-3.2/intel-23.1/include            #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /usr/local/apps/ioapi-3.2/intel-23.1/lib                #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.9.2/intel-23.1/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.9.2/intel-23.1/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/intel-23.1/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/intel-23.1/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/oneapi/2023.2/mpi/2021.10.0/lib/release #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/oneapi/2023.2/mpi/2021.10.0/include     #> MPI directory path

               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/intel-23.1
               setenv IOAPI  /home/wdx/lib/x86_64/ifc-18.0/ioapi_3.1
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/24.1 

               breaksw
 
         case 24.2:                                                                      

               module load AllLibraries intel/24.2 intel/24/intelmpi/24.2 intel/24/netcdf/4.9.2 intel/24/hdf5/1.14.5 intel/24/ioapi/3.2 #intel/21/pnetcdf/1.12.3
               #module load intel intelmpi netcdf pnetcdf hdf5
               #> If the above pnetcdf module does not work because of the older Intel compiler, try this build
               #> for MPAS-A, available at /home/jherwehe/mpas/mpas_io.with_fPIC/pnetcdf-1.12.2/intel-21.4

               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /usr/local/apps/ioapi-3.2/intel-24.2/include            #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /usr/local/apps/ioapi-3.2/intel-24.2/lib                #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.9.2/intel-24.2/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.9.2/intel-24.2/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/intel-24.2/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/intel-24.2/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/oneapi/2024.2/mpi/2021.13/lib           #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/oneapi/2024.2/mpi/2021.13/include       #> MPI directory path

               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/intel-24.2
               setenv IOAPI  /home/wdx/lib/x86_64/ifc-18.0/ioapi_3.1
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/24.1 

               breaksw
  
        default: 

               echo "No compiler version given. Assume Intel 23.2"
               setenv compilerVrsn 23.2

               module load AllLibraries intel/23.2 intel/23/intelmpi/23.2 intel/23/netcdf/4.9.2 intel/23/hdf5/1.10.8 intel/23/ioapi/3.2 #intel/21/pnetcdf/1.12.3
               #module load intel intelmpi netcdf pnetcdf hdf5
               #> If the above pnetcdf module does not work because of the older Intel compiler, try this build
               #> for MPAS-A, available at /home/jherwehe/mpas/mpas_io.with_fPIC/pnetcdf-1.12.2/intel-21.4

               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /usr/local/apps/ioapi-3.2/intel-23.1/include            #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /usr/local/apps/ioapi-3.2/intel-23.1/lib                #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.9.2/intel-23.1/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.9.2/intel-23.1/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/intel-23.1/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/intel-23.1/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/oneapi/2023.2/mpi/2021.10.0/lib/release #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/oneapi/2023.2/mpi/2021.10.0/include     #> MPI directory path

               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/intel-23.1
               setenv IOAPI  /home/wdx/lib/x86_64/ifc-18.0/ioapi_3.1
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/24.1 



               breaksw

      endsw

      breaksw
    
#>  Portland Group fortran compiler.............................................
    case pgi:
 
      switch ( $compilerVrsn )
        
         case 22.11:

               module load AllLibraries nvhpc/22.11 nvhpc/22/openmpi/4.1.4 nvhpc/22/netcdf/4.9.2 nvhpc/22/ioapi/3.2 #nvhpc/22/pnetcdf/1.12.3 


               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /usr/local/apps/ioapi-3.2/nvhpc-22.11/include            #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /usr/local/apps/ioapi-3.2/nvhpc-22.11/lib                #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.9.2/nvhpc-22.11/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.9.2/nvhpc-22.11/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/nvhpc-22.11/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/nvhpc-22.11/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/openmpi-4.1.4/nvhpc-22.11/include        #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/openmpi-4.1.4/nvhpc-22.11/lib            #> MPI directory path

               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/nvhpc-22.11
               setenv IOAPI  /usr/local/apps/ioapi-3.2
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/22.1.3 

               breaksw
   
         case 24.7:

               module load AllLibraries nvhpc/24.7 nvhpc/24/openmpi/4.1.6 nvhpc/24/netcdf/4.9.2 nvhpc/24/hdf5/1.10.8 nvhpc/24/ioapi/3.2 #nvhpc/22/pnetcdf/1.12.3 


               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /usr/local/apps/ioapi-3.2/nvhpc-24.7/include            #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /usr/local/apps/ioapi-3.2/nvhpc-24.7/lib                #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/openmpi-4.1.6/nvhpc-24.7/include        #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/openmpi-4.1.6/nvhpc-24.7/lib            #> MPI directory path


               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/nvhpc-24.7
               setenv IOAPI  /usr/local/apps/ioapi-3.2
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/22.1.3 

               breaksw
   
         default: 

               echo "No compiler version given. Assume PGI 24.7 (NVHPC24.7)"
               setenv compilerVrsn 24.7

               module load AllLibraries nvhpc/24.7 nvhpc/24/openmpi/4.1.6 nvhpc/24/netcdf/4.9.2 nvhpc/24/hdf5/1.10.8 nvhpc/24/ioapi/3.2 #nvhpc/22/pnetcdf/1.12.3 


               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR   /usr/local/apps/ioapi-3.2/nvhpc-24.7/include            #> I/O API include header files (unchanged)
               setenv IOAPI_LIB_DIR    /usr/local/apps/ioapi-3.2/nvhpc-24.7/lib                #> I/O API libraries (unchanged)
               setenv NETCDF_LIB_DIR   /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/lib             #> netCDF directory path
               setenv NETCDF_INCL_DIR  /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/include         #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/lib             #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/nvhpc-24.7/include         #> netCDF directory path
               setenv MPI_LIB_DIR      /usr/local/apps/openmpi-4.1.6/nvhpc-24.7/include        #> MPI directory path
               setenv MPI_INCL_DIR     /usr/local/apps/openmpi-4.1.6/nvhpc-24.7/lib            #> MPI directory path


               #> I/O API and netCDF for Offline TWO-WAY Model:
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/nvhpc-24.7
               setenv IOAPI  /usr/local/apps/ioapi-3.2
               setenv WRF_ARCH 66

               #> Load ARM Forge DDT Modules for Debugging and Profiling
               module load forge/22.1.3 

               breaksw
   
      endsw
 
      breaksw
    
#>  gfortran compiler............................................................
    case gcc:
 
      switch ( $compilerVrsn )
        
         case 9.5:                                                                       

               module load AllLibraries gcc/9.5 gcc/9/openmpi/4.1.4 gcc/9/netcdf/4.9.2 #gcc/9/pnetcdf/1.12.3
               
               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR  /home/fsidi/lib/gcc/9.1.0/ioapi-3.2-internal/ioapi/fixed_src              #> I/O API directory path
               setenv IOAPI_LIB_DIR   /home/fsidi/lib/gcc/9.1.0/ioapi-3.2-internal/Linux2_x86_64gfort     #> I/O API directory path
               setenv NETCDF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/gcc-9.5/lib                 #> netCDF directory path
               setenv NETCDF_INCL_DIR /usr/local/apps/netcdf-4.9.2/gcc-9.5/include             #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/gcc-9.5/lib                 #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/gcc-9.5/include             #> netCDF directory path
               setenv MPI_LIB_DIR     /usr/local/apps/openmpi-4.1.4/gcc-9.5/lib                   #> MPI directory path
               setenv MPI_INCL_DIR    /usr/local/apps/openmpi-4.1.4/gcc-9.5/include                    #> MPI directory path


               #> I/O API and netCDF for Offline TWO-WAY Model: 
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/gcc-9.5
               setenv IOAPI /home/fsidi/lib/gcc/9.1.0/ioapi-3.2-internal
               setenv WRF_ARCH 34  

               breaksw
   
          case 12.2:                                                                       

               module load AllLibraries gcc/12.2 gcc/12/openmpi/4.1.6 gcc/12/netcdf/4.9.2 gcc/12/hdf5/1.10.8 gcc/12/ioapi/3.2 #gcc/9/pnetcdf/1.12.3
               
               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR  /usr/local/apps/ioapi-3.2/gcc-12.2/include               #> I/O API directory path
               setenv IOAPI_LIB_DIR   /usr/local/apps/ioapi-3.2/gcc-12.2/lib                   #> I/O API directory path
               setenv NETCDF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/gcc-12.2/lib                #> netCDF directory path
               setenv NETCDF_INCL_DIR /usr/local/apps/netcdf-4.9.2/gcc-12.2/include            #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/gcc-12.2/lib               #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/gcc-12.2/include           #> netCDF directory path
               setenv MPI_LIB_DIR     /usr/local/apps/openmpi-4.1.6/gcc-12.2/lib               #> MPI directory path
               setenv MPI_INCL_DIR    /usr/local/apps/openmpi-4.1.6/gcc-12.2/include           #> MPI directory path


               #> I/O API and netCDF for Offline TWO-WAY Model: 
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/gcc-12.2
               setenv IOAPI /home/fsidi/lib/gcc/9.1.0/ioapi-3.2-internal
               setenv WRF_ARCH 34  

               breaksw
        
         default: 

               echo "No compiler version given. Assume GCC 12.2"
               setenv compilerVrsn 12.2

               module load AllLibraries gcc/12.2 gcc/12/openmpi/4.1.6 gcc/12/netcdf/4.9.2 gcc/12/hdf5/1.10.8 gcc/12/ioapi/3.2 #gcc/9/pnetcdf/1.12.3
               
               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR  /usr/local/apps/ioapi-3.2/gcc-12.2/include               #> I/O API directory path
               setenv IOAPI_LIB_DIR   /usr/local/apps/ioapi-3.2/gcc-12.2/lib                   #> I/O API directory path
               setenv NETCDF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/gcc-12.2/lib                #> netCDF directory path
               setenv NETCDF_INCL_DIR /usr/local/apps/netcdf-4.9.2/gcc-12.2/include            #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/gcc-12.2/lib               #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/gcc-12.2/include           #> netCDF directory path
               setenv MPI_LIB_DIR     /usr/local/apps/openmpi-4.1.6/gcc-12.2/lib               #> MPI directory path
               setenv MPI_INCL_DIR    /usr/local/apps/openmpi-4.1.6/gcc-12.2/include           #> MPI directory path


               #> I/O API and netCDF for Offline TWO-WAY Model: 
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/gcc-12.2
               setenv IOAPI /home/fsidi/lib/gcc/9.1.0/ioapi-3.2-internal
               setenv WRF_ARCH 34  

               breaksw
   

      endsw
  
      breaksw

#>  AMD compiler............................................................
    case amd:
 
      switch ( $compilerVrsn )
        
         default: 

               echo "No compiler version given. AMD 4.1"
               setenv compilerVrsn 4.1

               module load AllLibraries amd/4.1 amd/4/openmpi/4.1.6 amd/4/netcdf/4.9.2 amd/4/hdf5/1.10.8 amd/4/ioapi/3.2 #gcc/9/pnetcdf/1.12.3
               
               #> I/O API, netCDF, and MPI library locations for Offline CMAQ
               setenv IOAPI_INCL_DIR  /usr/local/apps/ioapi-3.2/amd-4.0/include               #> I/O API directory path
               setenv IOAPI_LIB_DIR   /usr/local/apps/ioapi-3.2/amd-4.0/lib                   #> I/O API directory path
               setenv NETCDF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/amd-4.0/lib                #> netCDF directory path
               setenv NETCDF_INCL_DIR /usr/local/apps/netcdf-4.9.2/amd-4.0/include            #> netCDF directory path
               setenv NETCDFF_LIB_DIR  /usr/local/apps/netcdf-4.9.2/amd-4.0/lib               #> netCDF directory path
               setenv NETCDFF_INCL_DIR /usr/local/apps/netcdf-4.9.2/amd-4.0/include           #> netCDF directory path
               setenv MPI_LIB_DIR     /usr/local/apps/openmpi-4.1.6/amd-4.1/lib               #> MPI directory path
               setenv MPI_INCL_DIR    /usr/local/apps/openmpi-4.1.6/amd-4.1/include           #> MPI directory path


               #> I/O API and netCDF for Offline TWO-WAY Model: 
               setenv NETCDF /usr/local/apps/netcdf-4.9.2/amd-4.0
               setenv IOAPI /home/fsidi/lib/gcc/9.1.0/ioapi-3.2-internal
               setenv WRF_ARCH 34  

               breaksw
   

      endsw
  
      breaksw

    default:
        echo "*** Compiler $compiler not found"
        exit(2)
        breaksw

 endsw

