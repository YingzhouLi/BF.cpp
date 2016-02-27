# The serial GNU compilers
set(COMPILER_DIR /cm/shared/apps/gcc/4.8.4/bin)
set(CMAKE_C_COMPILER       ${COMPILER_DIR}/gcc)
set(CMAKE_CXX_COMPILER     ${COMPILER_DIR}/g++)
set(CMAKE_Fortran_COMPILER ${COMPILER_DIR}/gfortran)

# The MPI wrappers for the C and C++ compilers
set(MPI_COMPILER_DIR /cm/shared/apps/mpich/ge/gcc/64/3.1/bin)
set(MPI_C_COMPILER       ${MPI_COMPILER_DIR}/mpicc)
set(MPI_CXX_COMPILER     ${MPI_COMPILER_DIR}/mpicxx)
set(MPI_Fortran_COMPILER ${MPI_COMPILER_DIR}/mpif90)

set(EL_INCLUDE_DIR /home/ryanlee/install/Elemental/include)
set(EL_LIB_DIR /home/ryanlee/install/Elemental/lib)

set(Boost_INCLUDE_DIR /cm/shared/apps/boost/include)
set(Boost_LIBRARY_DIR /cm/shared/apps/boost/lib)
