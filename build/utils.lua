project "utils"
    kind "StaticLib"
    language "C++"
    buildoptions{"-std=c++0x"}
    includedirs {"../utilities", "../utilities/datastructures"}
    objdir "obj"
    targetdir "../lib"
    files { "../utilities/datastrucutes/*"}
