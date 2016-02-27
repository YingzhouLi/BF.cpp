#
# Stanford University
#
cmake_minimum_required(VERSION 2.8.8) # for the new FindMPI module
project(BF CXX)

set(BF_VERSION_MAJOR 1)
set(BF_VERSION_MINOR 0)

if(CMAKE_BUILD_TYPE STREQUAL "Release")
  set(CMAKE_CXX_FLAGS "-std=c++11 -O3")
  option(RELEASE "Release mode flag" ON)
else()
  set(CMAKE_CXX_FLAGS "-std=gnu++11 -g -O2  -Wall")
  option(RELEASE "Release mode flag" OFF)
endif()

# Store all of our system-specific definitions
configure_file(${PROJECT_SOURCE_DIR}/cmake/config.h.cmake
               ${PROJECT_BINARY_DIR}/include/config.h)
install(FILES ${PROJECT_BINARY_DIR}/include/config.h
        DESTINATION include)

# Grab all of the .c, .cpp, .h, and .hpp BF files
file(GLOB_RECURSE BF_CPP RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
     "src/*.c" "src/*.cpp")
file(GLOB_RECURSE BF_HEADERS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
     "include/*.h" "include/*.hpp")
set(BF_SRC "${BF_CPP};${BF_HEADERS}")

# Find packages
find_package(MPI REQUIRED)
include_directories(${MPI_C_INCLUDE_PATH})
include_directories(${MPI_CXX_INCLUDE_PATH})

find_package(El REQUIRED)
link_directories(${EL_LIB_DIR})
include_directories(${EL_INCLUDE_DIR})

# Build the BF source
add_library(BF STATIC ${BF_SRC})
install(TARGETS BF DESTINATION lib)

# Copy the headers into the build directory
set(PREPARED_HEADERS)
foreach(HEADER ${BF_HEADERS})
  add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${HEADER}
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${HEADER}
            ${CMAKE_CURRENT_BINARY_DIR}/${HEADER}
    DEPENDS "${PROJECT_SOURCE_DIR}/${HEADER}")
  list(APPEND PREPARED_HEADERS ${PROJECT_BINARY_DIR}/${HEADER})

  get_filename_component(HEADER_PATH ${HEADER} PATH)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${HEADER} DESTINATION ${HEADER_PATH})
endforeach()
add_custom_target(prepare_BF_headers DEPENDS ${PREPARED_HEADERS})
add_dependencies(BF prepare_BF_headers)

# Make sure the BF headers can be found
include_directories("${PROJECT_BINARY_DIR}/include")

set(TEST_DIR ${PROJECT_SOURCE_DIR}/test)
set(TEST_TYPES BF IBF PBF MBF)
set(BF_TESTS Factorization)
set(IBF_TESTS Factorization)
set(PBF_TESTS Factorization)
set(MBF_TESTS Factorization)
foreach(TYPE ${TEST_TYPES})
  set(OUTPUT_DIR "${PROJECT_BINARY_DIR}/bin/${TYPE}")
  foreach(TEST ${${TYPE}_TESTS})
    add_executable(${TYPE}-${TEST} ${TEST_DIR}/${TYPE}/${TEST}.cpp)
    target_link_libraries(${TYPE}-${TEST} El BF)
    set_target_properties(${TYPE}-${TEST}
                          PROPERTIES
                          OUTPUT_NAME ${TEST}
                          RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR})
    install(TARGETS ${TYPE}-${TEST} DESTINATION bin/${TYPE})
  endforeach()
endforeach()
