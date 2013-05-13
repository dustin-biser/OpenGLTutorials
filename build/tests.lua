project "tests"
    kind "ConsoleApp"
    language "C++"
    libdirs "../lib"
    buildoptions{"-std=c++0x"}
    includedirs{"../ext/gtest/include", "../ext/gtest/", "../tests/utilities", "../tests/utilities/datastructures",
        "../utilities/datastructures" }
    objdir "obj"
    links {"gtest"}
    linkoptions "-lpthread"
    targetdir "../tests/bin"
    files { "../tests/utilities/datastructures/*"}
