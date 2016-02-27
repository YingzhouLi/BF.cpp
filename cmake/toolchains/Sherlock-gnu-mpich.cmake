# The serial GNU compilers
set(COMPILER_DIR /share/PI/lexing/install/gcc-5.2.0/gcc/bin)
set(CMAKE_C_COMPILER       ${COMPILER_DIR}/gcc)
set(CMAKE_CXX_COMPILER     ${COMPILER_DIR}/g++)
set(CMAKE_Fortran_COMPILER ${COMPILER_DIR}/gfortran)

# The MPI wrappers for the C and C++ compilers
set(MPI_COMPILER_DIR /share/PI/lexing/install/gcc-5.2.0/mpich-3.2/mpich/bin)
set(MPI_C_COMPILER       ${MPI_COMPILER_DIR}/mpicc)
set(MPI_CXX_COMPILER     ${MPI_COMPILER_DIR}/mpicxx)
set(MPI_Fortran_COMPILER ${MPI_COMPILER_DIR}/mpif90)

if(CMAKE_BUILD_TYPE MATCHES Debug)
  set(CXX_FLAGS "-g")
else()
  set(CXX_FLAGS "-O3")
endif()

set(EL_INCLUDE_DIR /share/PI/lexing/install/gcc-5.2.0/mpich-3.2/Elemental/include)
set(EL_LIB_DIR /share/PI/lexing/install/gcc-5.2.0/mpich-3.2/Elemental/lib)

set(Boost_INCLUDE_DIR /share/PI/lexing/install/gcc-5.2.0/boost-1.59.0/include)
set(Boost_LIBRARY_DIR /share/PI/lexing/install/gcc-5.2.0/boost-1.59.0/lib)
