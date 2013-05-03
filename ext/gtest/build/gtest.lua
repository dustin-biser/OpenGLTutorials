-- Build Static Library for GTest.
project "gtest"
    kind "StaticLib"
    language "C++"
    includedirs {"../include", "../"}
    location "build"
    targetdir "../"
    files {"../src/gtest-all.cc","../src/gtest_main.cc"}

-- Build example test using libgtest.a
project "test1_example"
    kind "ConsoleApp"
    language "C++"
    includedirs {"../include", "../"}
    targetdir "../"
    libdirs "../"
    links "gtest"
    linkoptions "-lpthread"
    files {"../sample1.cpp", "../test1.cpp"}

