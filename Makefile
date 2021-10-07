.DEFAULT_GOAL := all
PROJECT_NAME := Vulkan-Template

all: dirs cmake compile
dirs:
	mkdir -p build/
	mkdir -p bin/
cmake:
	cmake . -B build
compile:
	cmake --build build
run: all
	./bin/${PROJECT_NAME}
clean:
	rm -rf build/
	rm -rf bin/
