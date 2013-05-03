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
    targetdir "../bin"
    files { "../OrthoCube.cpp" }

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
    targetdir "../bin"
    files { "../AspectRatio.cpp" }

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
    targetdir "../bin"
    files { "../MatrixPerspective.cpp" }

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
    targetdir "../bin"
    files { "../ShaderPerspective.cpp" }

