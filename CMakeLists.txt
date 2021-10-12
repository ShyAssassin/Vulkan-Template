# Set versions
cmake_minimum_required(VERSION 3.1)
set(CMAKE_CXX_STANDARD 17)

# Set project name
project(Vulkan-Template)

# Set directories
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin/lib)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Add libraries from bin/
add_subdirectory(${CMAKE_SOURCE_DIR}/lib/GLFW)
add_subdirectory(${CMAKE_SOURCE_DIR}/lib/glm)
find_package(Vulkan REQUIRED)

# Include header files and source files
set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(${CMAKE_SOURCE_DIR}/include)
file(GLOB_RECURSE SOURCES ${PROJECT_SOURCE_DIR}/src/*.c)
file(GLOB_RECURSE SOURCES ${PROJECT_SOURCE_DIR}/src/*.cpp)

add_executable(Vulkan-Template ${SOURCES})

# set properties
set_target_properties(Vulkan-Template PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR})

# Links libraries to executable
target_link_libraries (Vulkan-Template Vulkan::Vulkan)
target_link_libraries(Vulkan-Template glfw)
target_link_libraries(Vulkan-Template glm)