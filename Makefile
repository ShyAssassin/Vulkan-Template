.DEFAULT_GOAL := all
PROJECT_NAME := Vulkan-Template

all: dirs cmake shaders compile
dirs:
	mkdir -p build/
	mkdir -p bin/
	mkdir -p bin/shaders
	mkdir -p build/shaders
cmake:
	cmake . -B build
compile:
	cmake --build build
shaders:
	glslc src/shaders/shader.vert -o bin/shaders/vert.spv
	glslc src/shaders/shader.frag -o bin/shaders/frag.spv
	glslc src/shaders/shader.vert -o build/shaders/vert.spv
	glslc src/shaders/shader.frag -o build/shaders/frag.spv
run: all
	cd bin/ && ./${PROJECT_NAME}
clean:
	rm -rf build/
	rm -rf bin/
