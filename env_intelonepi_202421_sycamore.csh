# ==========================================================================
#  Intel MPI 2024.2.1 -- tcsh/csh conversion of mpi/latest/env/vars.sh
#
#  Usage:  add to the END of ~/.cshrc (or ~/.tcshrc):
#             source ~/intel_mpi_vars.csh
#
#  Must come AFTER any `module load` lines, otherwise a site modulefile
#  will overwrite FI_PROVIDER_PATH again.
# ==========================================================================

if ( ! $?I_MPI_VARS_SET ) then

setenv I_MPI_VARS_SET 1
setenv I_MPI_ROOT /nas/sycamore/apps/intel/2024.2.1/mpi/latest

# --------------------------------------------------------------------------
#  set_standalone_vars()
#  csh dies on undefined variables, so each prepend is guarded.
#  The if/else also reproduces prepend_path()'s "no dangling colon" behaviour
#  -- a trailing ':' in LD_LIBRARY_PATH silently means "current directory".
# --------------------------------------------------------------------------

if ( $?PKG_CONFIG_PATH ) then
    setenv PKG_CONFIG_PATH ${I_MPI_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}
else
    setenv PKG_CONFIG_PATH ${I_MPI_ROOT}/lib/pkgconfig
endif

if ( $?PATH ) then
    setenv PATH ${I_MPI_ROOT}/bin:${PATH}
else
    setenv PATH ${I_MPI_ROOT}/bin
endif

if ( $?CLASSPATH ) then
    setenv CLASSPATH ${I_MPI_ROOT}/share/java/mpi.jar:${CLASSPATH}
else
    setenv CLASSPATH ${I_MPI_ROOT}/share/java/mpi.jar
endif

if ( $?LIBRARY_PATH ) then
    setenv LIBRARY_PATH ${I_MPI_ROOT}/lib:${LIBRARY_PATH}
else
    setenv LIBRARY_PATH ${I_MPI_ROOT}/lib
endif

if ( $?LD_LIBRARY_PATH ) then
    setenv LD_LIBRARY_PATH ${I_MPI_ROOT}/lib:${LD_LIBRARY_PATH}
else
    setenv LD_LIBRARY_PATH ${I_MPI_ROOT}/lib
endif

if ( $?CPATH ) then
    setenv CPATH ${I_MPI_ROOT}/include:${CPATH}
else
    setenv CPATH ${I_MPI_ROOT}/include
endif

# NOTE: Intel's vars.sh has a typo here -- it builds MANPATH but exports
# "MANPATHN", so `man mpirun` never works from the stock script. Fixed.
if ( $?MANPATH ) then
    setenv MANPATH ${I_MPI_ROOT}/share/man:${MANPATH}
else
    setenv MANPATH ${I_MPI_ROOT}/share/man
endif

# --------------------------------------------------------------------------
#  Debug library kind (optional)
#  Equivalent of: -i_mpi_library_kind=debug
#  Uncomment to link the debug build of the MPI library.
# --------------------------------------------------------------------------
# setenv LD_LIBRARY_PATH ${I_MPI_ROOT}/lib/mpi/debug:${LD_LIBRARY_PATH}

# --------------------------------------------------------------------------
#  Internal libfabric (default ON, matching the stock script)
#  Set I_MPI_OFI_LIBRARY_INTERNAL to 0 BEFORE sourcing to use system OFI.
#
#  Layout differs between installs, so detect rather than assume:
#     2024 standard :  $I_MPI_ROOT/opt/mpi/libfabric
#     this install  :  $I_MPI_ROOT/libfabric
# --------------------------------------------------------------------------

set _use_internal_ofi = 1
if ( $?I_MPI_OFI_LIBRARY_INTERNAL ) then
    switch ( "$I_MPI_OFI_LIBRARY_INTERNAL" )
        case 0:
        case no:
        case off:
        case disable:
            set _use_internal_ofi = 0
            breaksw
    endsw
endif

if ( $_use_internal_ofi == 1 ) then

    set _ofi = ""
    if ( -d ${I_MPI_ROOT}/opt/mpi/libfabric/lib/prov ) then
        set _ofi = ${I_MPI_ROOT}/opt/mpi/libfabric
    else if ( -d ${I_MPI_ROOT}/libfabric/lib/prov ) then
        set _ofi = ${I_MPI_ROOT}/libfabric
    endif

    if ( "$_ofi" != "" ) then
        setenv LD_LIBRARY_PATH ${_ofi}/lib:${LD_LIBRARY_PATH}

        # THE FIX: must end in /prov -- libfabric scans this dir for *-fi.so
        setenv FI_PROVIDER_PATH ${_ofi}/lib/prov:/usr/lib64/libfabric

        # Not in the stock script, but puts fi_info / fi_pingpong on PATH
        if ( -d ${_ofi}/bin ) then
            setenv PATH ${_ofi}/bin:${PATH}
        endif
    else
        echo "WARNING: no libfabric prov/ dir found under ${I_MPI_ROOT}"
    endif

    unset _ofi
endif

unset _use_internal_ofi

endif
# ---- end Intel MPI ----
