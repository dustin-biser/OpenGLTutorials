/*
 * ColoredVertex_Test.cpp
 *
 *  Created on: May 4, 2013
 *      Author: Dustin Biser
 */

#include "gtest/gtest.h"
#include "ColoredVertex.h"
#include <array>
#include <memory>

using namespace utilities::datastructures;

namespace {	 // class visibility limited to this file.

	class ColoredVertex_Test: public ::testing::Test {
	protected:

		ColoredVertex_Test() {
			v = std::make_shared<ColoredVertex>();
		}

		virtual ~ColoredVertex_Test() {
		}

		// Code here will be called immediately after the constructor (right
		// before each test).
		virtual void SetUp() {
		}

		// Code here will be called immediately after each test (right
		// before the destructor).
		virtual void TearDown() {
		}

		std::shared_ptr<ColoredVertex> v;
	};

}

TEST_F(ColoredVertex_Test, test_withXYZ){
	std::array<float, 4> xyzw = v->getXYZW();

	EXPECT_EQ(0.0f, xyzw[0]);
	EXPECT_EQ(0.0f, xyzw[1]);
	EXPECT_EQ(0.0f, xyzw[2]);
	EXPECT_EQ(1.0f, xyzw[3]);
}
