dofile("ext/glsdk/links.lua")

local usedLibs = {"glload", "glutil", "freeglut"}
local defineList = {"LOAD_X11", "FREEGLUT_STATIC"}
local linkList = {"GL", "GLU"}
local libdirList = {"lib", "ext/glsdk/freeglut/lib", "ext/glsdk/glload/lib",
                    "ext/glsdk/glutil/lib"}
local includeDirList = {"common", "ext/glsdk/freeglut/include", "ext/glsdk/glutil/include",
                        "ext/glsdk/glload/include"}


solution "OpenGLTutorials"
    configurations { "Debug", "Release" }

    configuration  "Debug"
        defines { "DEBUG" }
        flags {"Symbols", "ExtraWarnings"}

    configuration  "Release"
        defines { "RELEASE", "NDEBUG" }
        flags {"Symbols", "ExtraWarnings"}

    project "framework"
        kind "StaticLib"
        language "C++"
        location "common"
        links(linkList)
        UseLibs(usedLibs)
        libdirs(libdirList)
        buildoptions{"-std=c++0x"}
        includedirs(includeDirList)
        objdir "common/obj"
        defines(defineList)
        files { "common/framework.cpp"}
        targetdir "lib"

    project "tutorial1"
        kind "ConsoleApp"
        language "C++"
        location "tutorial1"
        links {"framework"}
        UseLibs(usedLibs)
        links(linkList)
        libdirs(libdirList)
        buildoptions { "-std=c++0x" }
        includedirs { "tutorial1" }
        includedirs(includeDirList)
        objdir "tutorial1/obj"
        defines(defineList)
        files { "tutorial1/tutorial1.cpp" }
        targetdir "tutorial1"

    project "FragPosition"
        kind "ConsoleApp"
        language "C++"
        location "tutorial2"
        links {"framework"}
        UseLibs(usedLibs)
        links(linkList)
        libdirs(libdirList)
        buildoptions { "-std=c++0x" }
        includedirs { "tutorial2" }
        includedirs(includeDirList)
        objdir "tutorial2/obj"
        defines(defineList)
        files { "tutorial2/FragPosition.cpp" }
        targetdir "tutorial2"

    project "VertexColors"
        kind "ConsoleApp"
        language "C++"
        location "tutorial2"
        links {"framework"}
        UseLibs(usedLibs)
        links(linkList)
        libdirs(libdirList)
        buildoptions { "-std=c++0x" }
        includedirs { "tutorial2" }
        includedirs(includeDirList)
        objdir "tutorial2/obj"
        defines(defineList)
        files { "tutorial2/VertexColors.cpp" }
        targetdir "tutorial2"

dofile("tutorial3/tutorial3.lua")
