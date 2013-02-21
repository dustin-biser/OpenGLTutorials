local usedLibs = {"glload", "glutil", "freeglut"}
local defineList = {"LOAD_X11", "FREEGLUT_STATIC"}
local linkList = {"GL", "GLU"}
local libdirList = {"../lib", "../ext/glsdk/freeglut/lib", "../ext/glsdk/glload/lib",
                    "../ext/glsdk/glutil/lib"}
local includeDirList = {"../common", "../ext/glsdk/freeglut/include", "../ext/glsdk/glutil/include",
                        "../ext/glsdk/glload/include"}

project "OrthoCube"
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
    files { "OrthoCube.cpp" }

project "AspectRatio"
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
    files { "AspectRatio.cpp" }

project "MatrixPerspective"
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
    files { "MatrixPerspective.cpp" }

project "ShaderPerspective"
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
    files { "ShaderPerspective.cpp" }

