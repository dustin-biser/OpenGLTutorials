project "tutorial1"
    kind "ConsoleApp"
    language "C++"
    links {"framework"}
    UseLibs(usedLibs)
    links(linkList)
    libdirs(libdirList)
    buildoptions { "-std=c++0x" }
    includedirs(includeDirList)
    objdir "obj"
    defines(defineList)
    targetdir "../bin"
    files { "../tutorial1.cpp" }
