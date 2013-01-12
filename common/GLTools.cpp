/*
 * GLTools.cpp
 *
 *  Created on: Jan 7, 2013
 *      Author: biserd
 */

#include <iostream>
#include <vector>
#include <fstream>
#include <stdexcept>
#include <sstream>
#include <GL/glew.h>
#include <GL/freeglut.h>
#include <glutil/Shader.h>
#include "GLTools.h"

// Location of shader files
#define LOCAL_FILE_DIR "data/"
#define GLOBAL_FILE_DIR "..data/"

namespace GLTools {
	/**
	 * Creates and compiles the shader.  Prints compilation errors to stderr if any
	 * exist.
	 *
	 * @param eShaderType - One of GL_VERTEX_SHADER, GL_TESS_CONTROL_SHADER,
	 *  	GL_TESS_EVALUATION_SHADER, GL_GEOMETRY_SHADER, or GL_FRAGMENT_SHADER.
	 *
	 * @param strShaderFile - string object that holds the contents of the shader
	 * 		program.
	 *
	 * @return Returns a GLunit handle to a shader object
	 */
	GLuint createShader(GLenum eShaderType, const std::string &strShaderFile){
		GLuint shader = glCreateShader(eShaderType);
		const char *strFileData = strShaderFile.c_str();
		glShaderSource(shader, 1, &strFileData, NULL);

		glCompileShader(shader);

		GLint status;
		glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
		if (status == GL_FALSE)
		{
			GLint infoLogLength;
			glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &infoLogLength);

			GLchar *strInfoLog = new GLchar[infoLogLength + 1];
			glGetShaderInfoLog(shader, infoLogLength, NULL, strInfoLog);

			const char *strShaderType = NULL;
			switch(eShaderType)
			{
				case GL_VERTEX_SHADER: strShaderType = "vertex"; break;
				case GL_GEOMETRY_SHADER: strShaderType = "geometry"; break;
				case GL_FRAGMENT_SHADER: strShaderType = "fragment"; break;
			}

			fprintf(stderr, "Compile failure in %s shader:\n%s\n", strShaderType, strInfoLog);
			delete[] strInfoLog;
		}

		return shader;
	}

	/**
	 * Creates a program using the shader identifiers supplied.  Attempts to link
	 * the program and prints out any linker errors to stderr.
	 *
	 * @param shaderList
	 * @return a GLuint representing the program identifier.
	 */
	GLuint createProgram(const std::vector<GLuint> &shaderList)
	{
		GLuint program = glCreateProgram();

		for(size_t i = 0; i < shaderList.size(); i++)
			glAttachShader(program, shaderList[i]);

		glLinkProgram(program);

		GLint linkStatus;
		glGetProgramiv (program, GL_LINK_STATUS, &linkStatus);
		if (linkStatus == GL_FALSE)
		{
			GLint infoLogLength;
			glGetProgramiv(program, GL_INFO_LOG_LENGTH, &infoLogLength);

			GLchar *strInfoLog = new GLchar[infoLogLength + 1];
			glGetProgramInfoLog(program, infoLogLength, NULL, strInfoLog);
			fprintf(stderr, "Linker failure: %s\n", strInfoLog);
			delete[] strInfoLog;
		}

		for(size_t i = 0; i < shaderList.size(); i++)
			glDetachShader(program, shaderList[i]);

		return program;
	}

    GLuint loadShader(GLenum eShaderType, const std::string &strShaderFilename)
    {
        std::string strFilename = findFileOrThrow(strShaderFilename);
        std::ifstream shaderFile(strFilename.c_str());
        std::stringstream shaderData;
        shaderData << shaderFile.rdbuf();
        shaderFile.close();

        GLuint shader;
        try
        {
            shader = glutil::CompileShader(eShaderType, shaderData.str());
        }
        catch(std::exception &e)
        {
            fprintf(stderr, "%s\n", e.what());
            throw;
        }

        return shader;
    }

	/**
	 * Attempts to find file strBasname within data/ or ../data/.  If file cannot
	 * be found, a std::runtime_error is thrown.
	 *
	 * @param strBasename
	 * @return
	 */
	std::string findFileOrThrow( const std::string &strBasename )
	{
		std::string strFilename = LOCAL_FILE_DIR + strBasename;
		std::ifstream testFile(strFilename.c_str());
		if(testFile.is_open())
			return strFilename;


		strFilename = GLOBAL_FILE_DIR + strBasename;
		testFile.open(strFilename.c_str());
		if(testFile.is_open())
			return strFilename;

		throw std::runtime_error("Could not find the file " + strBasename);
	}

} // end namespace GLTools

void init();
void display();
void reshape(int w, int h);
void keyboard(unsigned char key, int x, int y);


int main(int argc, char** argv)
{
    glutInit(&argc, argv);

    int width = 500;
    int height = 500;
    unsigned int displayMode = GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH | GLUT_STENCIL;

    glutInitDisplayMode (displayMode);
    glutInitContextVersion (3, 3);
    glutInitContextProfile(GLUT_CORE_PROFILE);
#ifdef DEBUG
    glutInitContextFlags(GLUT_DEBUG);
#endif
    glutInitWindowSize (width, height);
    glutInitWindowPosition (300, 200);
    int window = glutCreateWindow (argv[0]);

    glutSetOption(GLUT_ACTION_ON_WINDOW_CLOSE, GLUT_ACTION_CONTINUE_EXECUTION);

    init();

    glutDisplayFunc(display);
    glutReshapeFunc(reshape);
    glutKeyboardFunc(keyboard);
    glutMainLoop();
    return 0;
}
