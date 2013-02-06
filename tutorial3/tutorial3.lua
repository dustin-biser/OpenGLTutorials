local usedLibs = {"glload", "glutil", "freeglut"}
local defineList = {"LOAD_X11", "FREEGLUT_STATIC"}
local linkList = {"GL", "GLU"}
local libdirList = {"../lib", "../ext/glsdk/freeglut/lib", "../ext/glsdk/glload/lib",
                    "../ext/glsdk/glutil/lib"}
local includeDirList = {"../common", "../ext/glsdk/freeglut/include", "../ext/glsdk/glutil/include",
                        "../ext/glsdk/glload/include"}

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
    files { "vertPositionOffset.cpp" }

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
    files { "cpuPositionOffset.cpp" }

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
    files { "fragChangeColor.cpp" }

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
    files { "vertCalcOffset.cpp" }

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
    files { "vertCalcOffset_Remixed.cpp" }

