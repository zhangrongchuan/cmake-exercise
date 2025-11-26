cmake_minimum_required(VERSION 3.16)

project(cmake_exercise LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# ---- Boost ----
find_package(Boost REQUIRED COMPONENTS filesystem system)

# ---- deal.II ----
find_package(deal.II REQUIRED HINTS /usr/lib/cmake/deal.II)
DEAL_II_INITIALIZE_CACHED_VARIABLES()

# ---- yaml-cpp ----
find_package(yaml-cpp REQUIRED)

add_executable(main
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

target_link_libraries(main
    ${Boost_FILESYSTEM_LIBRARY}
    ${Boost_SYSTEM_LIBRARY}
    yaml-cpp
)

DEAL_II_SETUP_TARGET(main)

