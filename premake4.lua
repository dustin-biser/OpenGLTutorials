solution "OpenGLTutorials"
    configurations { "Debug" }

    project "GLTools"
        kind "StaticLib"
        language "C++"
        links { "GLEW", "GL", "GLUT", "glutil"}
        libdirs { "/usr/lib/", "/usr/local/lib", "ext/glutil/lib" }
        buildoptions{"-std=c++0x"}
        includedirs {"common", "ext/glsdk/glutil/include"}
        objdir "obj"
        files { "common/*.cpp", "common/*.h"}
        targetdir "lib"

        configuration  "Debug"
            defines { "DEBUG" }
            flags {"Symbols", "ExtraWarnings"}

    --project "tutorial1"
        --kind "ConsoleApp"
        --language "C++"
        --location "tutorial1"
        --links { "GLTools" }
        --libdirs { "lib" }
        --buildoptions { "-std=c++0x" }
        --includedirs { "tutorial1", "common" }
        --objdir "obj"
        --targetdir "tutorial1"

        --configuration  "Debug"
            --defines { "DEBUG" }
            --flags {"Symbols", "ExtraWarnings"}

