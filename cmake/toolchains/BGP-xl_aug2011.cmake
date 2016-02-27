set(CMAKE_SYSTEM_NAME BlueGeneP-static)

# The serial XL compilers
set(CMAKE_C_COMPILER   /soft/apps/ibmcmp-aug2011/vacpp/bg/9.0/bin/bgxlc_r)
set(CMAKE_CXX_COMPILER /soft/apps/ibmcmp-aug2011/vacpp/bg/9.0/bin/bgxlC_r)

# The MPI wrappers for the XL C and C++ compilers
set(MPI_C_COMPILER   /bgsys/drivers/ppcfloor/comm/bin/mpixlc_r)
set(MPI_CXX_COMPILER /bgsys/drivers/ppcfloor/comm/bin/mpixlcxx_r)

set(CXX_FLAGS "-g -O4")

# TODO: the link to boost library is missing
