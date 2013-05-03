dofile("ext/glsdk/links.lua")

usedLibs = {"glload", "glutil", "freeglut"}
defineList = {"LOAD_X11", "FREEGLUT_STATIC"}
linkList = {"GL", "GLU"}

libdirList = {"lib", "ext/glsdk/freeglut/lib", "ext/glsdk/glload/lib",
                    "ext/glsdk/glutil/lib"}
includeDirList = {"common", "ext/glsdk/freeglut/include", "ext/glsdk/glutil/include",
                        "ext/glsdk/glload/include"}


solution "OpenGLTutorials"
    configurations { "Debug", "Release" }

    configuration  "Debug"
        defines { "DEBUG" }
        flags {"Symbols", "ExtraWarnings"}

    configuration  "Release"
        defines { "RELEASE", "NDEBUG" }
        flags {"Symbols", "ExtraWarnings"}


    -- Build Static Library for framework code.
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

-- Build GTest Static Library.
dofile("ext/gtest/build/gtest.lua")

-- Reset library includes so they can be accessed from within tutorial*.lua build files
libdirList = {"../../lib", "../../ext/glsdk/freeglut/lib", "../../ext/glsdk/glload/lib",
                "../../ext/glsdk/glutil/lib"}
includeDirList = {"../../common", "../../ext/glsdk/freeglut/include", "../../ext/glsdk/glutil/include",
                "../../ext/glsdk/glload/include"}

-- Now build the tutorials.
dofile("tutorial1/build/tutorial1.lua")
dofile("tutorial2/build/tutorial2.lua") 
dofile("tutorial3/build/tutorial3.lua")
dofile("tutorial4/build/tutorial4.lua")
dofile("tutorial5/build/tutorial5.lua")
