project "FragPosition"
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
    files { "../FragPosition.cpp" }

project "VertexColors"
    kind "ConsoleApp"
    language "C++"
    location "tutorial2"
    links {"framework"}
    UseLibs(usedLibs)
    links(linkList)
    libdirs(libdirList)
    buildoptions { "-std=c++0x" }
    includedirs(includeDirList)
    objdir "obj"
    defines(defineList)
    targetdir "../bin"
    files { "../VertexColors.cpp" }
