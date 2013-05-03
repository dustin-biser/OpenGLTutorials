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
        location "common"
        links(linkList)
        UseLibs(usedLibs)
        libdirs(libdirList)
        buildoptions{"-std=c++0x"}
        includedirs(includeDirList)
        objdir "common/obj"
        defines(defineList)
        files { "common/framework.cpp"}
        excludes "common/empty.cpp"
        targetdir "lib"

-- Build GTest Static Library.
dofile("ext/gtest/build/gtest.lua")

-- Reset library and includes directories so they can be accessed from the tutorial*.lua build files.
libdirList = {"../../lib", "../../ext/glsdk/freeglut/lib", "../../ext/glsdk/glload/lib",
                "../../ext/glsdk/glutil/lib"}
includeDirList = {"../../common", "../../ext/glsdk/freeglut/include", "../../ext/glsdk/glutil/include",
                "../../ext/glsdk/glload/include"}

-- Common project settings for each tutorial.
function SetupProject(projName, ...)
	project(projName)
		kind "ConsoleApp"
		language "c++"
		includedirs {"../common"}
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
dofile("tutorial1/build/tutorial1.lua")
dofile("tutorial2/build/tutorial2.lua") 
dofile("tutorial3/build/tutorial3.lua")
dofile("tutorial4/build/tutorial4.lua")
dofile("tutorial5/build/tutorial5.lua")
dofile("tutorial6/build/tutorial6.lua")
