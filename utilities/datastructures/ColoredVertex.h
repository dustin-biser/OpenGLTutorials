#ifndef COLORED_VERTEX_H
#define COLORED_VERTEX_H

#include <array>

namespace utilities {
 namespace datastructures {

	class ColoredVertex {
	private:

		//TODO - Change all float arrays to std::array<float> for easier management.

		static std::array<float, 4> defaultRgba;

		std::array<float, 4> rgba;
		std::array<float, 4> xyzw {{0.0f, 0.0f, 0.0f, 1.0f}};

		static const char numColorElements = 4;
		static const char numPositionElements = 4;

	public:
		ColoredVertex() {
			// Initialize vertex color to default color.
			for(int i = 0; i < numColorElements; i ++) {
				rgba[i] = defaultRgba[i];
			}
		}
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
		// Setters
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */

		void setDefaultRGB(float r, float g, float b){
			setDefaultRGBA(r, g, b, 1.0f);
		}

		void setDefaultRGBA(float r, float g, float b, float a) {
			defaultRgba[0] = r;
			defaultRgba[1] = g;
			defaultRgba[2] = b;
			defaultRgba[3] = a;
		}

		void setXYZ(float x, float y, float z) {
			setXYZW(x, y, z, 1.0f);
		}

		void setXYZW(float x, float y, float z, float w) {
			xyzw[0] = x;
			xyzw[1] = y;
			xyzw[2] = z;
			xyzw[3] = w;
		}

		void setRGB(float r, float g, float b) {
			setRGBA(r, g, b, 1.0f);
		}

		void setRGBA(float r, float g, float b, float a) {
			rgba[0] = r;
			rgba[1] = g;
			rgba[2] = b;
			rgba[3] = a;
		}

		/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
		// Getters
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
		std::array<float, 4> getXYZW() {
			return std::array<float, 4>(xyzw);
		}


		inline friend std::ostream& operator << (std::ostream &out,
				const ColoredVertex &v) {
			out << "ColoredVertex( { xyzw = " << v.xyzw[0] << ", "
			                                  << v.xyzw[1] << ", "
			                                  << v.xyzw[2] << ", "
			                                  << v.xyzw[3] << " }, "

								  "{ rgba = " << v.rgba[0] << ", "
								    		  << v.rgba[1] << ", "
								    		  << v.rgba[2] << ", "
								    		  << v.rgba[3] << " } )";


			return out;
		}

	};

	// Initialize default color.
	std::array<float, 4> ColoredVertex::defaultRgba = {{1.0f, 1.0f, 1.0f, 1.0f}};

 }
}

#endif
