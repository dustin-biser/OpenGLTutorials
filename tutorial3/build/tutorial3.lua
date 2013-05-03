project "vertPositionOffset"
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
    files { "../vertPositionOffset.cpp" }

project "cpuPositionOffset"
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
    files { "../cpuPositionOffset.cpp" }

project "fragChangeColor"
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
    files { "../fragChangeColor.cpp" }

project "vertCalcOffset"
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
    files { "../vertCalcOffset.cpp" }

project "vertCalcOffset_Remixed"
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
    files { "../vertCalcOffset_Remixed.cpp" }

