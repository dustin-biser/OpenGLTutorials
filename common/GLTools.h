/*
 * GLTools.h
 *
 *  Created on: Jan 7, 2013
 *      Author: biserd
 */

#ifndef GLTOOLS_H_
#define GLTOOLS_H_

namespace GLTools {
	GLuint createShader(GLenum eShaderType, const std::string &strShaderFile);

	GLuint createProgram(const std::vector<GLuint> &shaderList);

	std::string findFileOrThrow(const std::string &strBasename);

    GLuint loadShader(GLenum eShaderType, const std::string &strShaderFilename);
}

int main(int argc, char** argv);

#endif /* GLTOOLS_H_ */
