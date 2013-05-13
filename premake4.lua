dofile("ext/glsdk/links.lua")

usedLibs = {"glload", "glimage", "glutil", "freeglut", "glm", "glmesh"}
linkList = {"GL", "GLU"}

libdirList = {"lib", "ext/glsdk/freeglut/lib", "ext/glsdk/glload/lib",
                    "ext/glsdk/glutil/lib"}
includeDirList = {"common", "ext/glsdk/freeglut/include", "ext/glsdk/glutil/include",
                        "ext/glsdk/glload/include"}


solution "OpenGLTutorials"
    configurations { "Debug", "Release" }
    -- Some defines that Jason McKesson uses, not sure why though.
    defines {"_CRT_SECURE_NO_WARNINGS", "_CRT_SECURE_NO_DEPRECATE", "_SCL_SECURE_NO_WARNINGS",
        "TIXML_USE_STL"}
    -- Linux specific defines.
    defines {"LOAD_X11", "FREEGLUT_STATIC"}

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
        location "build"
        links(linkList)
        UseLibs(usedLibs)
        libdirs(libdirList)
        buildoptions{"-std=c++0x"}
        includedirs(includeDirList)
        objdir "build/obj"
        defines(defineList)
        files { "common/*.cpp"}
        excludes "common/empty.cpp" 
        targetdir "lib"

-- Build GTest Static Library.
dofile("build/gtest.lua")

-- Build utilities Static Library.
--dofile("build/utils.lua")

-- Build tests
dofile("build/tests.lua")

-- Reset library and includes directories so they can be accessed from the tutorial*.lua build files.
libdirList = {"../../lib", "../../ext/glsdk/freeglut/lib", "../../ext/glsdk/glload/lib",
                "../../ext/glsdk/glutil/lib"}
includeDirList = {"../../../common", "../../../ext/glsdk/freeglut/include", "../../../ext/glsdk/glutil/include",
                "../../../ext/glsdk/glload/include"}

-- Common project settings for each tutorial.
function SetupProject(projName, ...)
    project(projName)
        kind "ConsoleApp"
        language "c++"
        includedirs {includeDirList}
        links "framework"
        --Must be after including framwork... because GCC is stupid.
        UseLibs(usedLibs)
        links{linkList}
        libdirs(libdirList)
        buildoptions { "-std=c++0x" }
        objdir "obj"
        targetdir "../bin"
        files {...}
end

-- Now build the tutorials.
dofile("tutorials/tutorial1/build/tutorial1.lua")
dofile("tutorials/tutorial2/build/tutorial2.lua") 
dofile("tutorials/tutorial3/build/tutorial3.lua")
dofile("tutorials/tutorial4/build/tutorial4.lua")
dofile("tutorials/tutorial5/build/tutorial5.lua")
dofile("tutorials/tutorial6/build/tutorial6.lua")
dofile("tutorials/tutorial7/build/tutorial7.lua")
