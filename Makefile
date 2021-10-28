# Makefile

ifeq ($(OS), Windows_NT)
	OPTION=src/import_/eexec_.cpp include/dlfcn.c -std=c++11
else
	OPTION=src/import_/eexec_.cpp -std=c++11 -ldl
endif

Wopslang :
	g++ -fPIC -shared lib/library.cpp -o lib/library.so -std=c++11 | g++ -o Wopslang src/interpreter.cpp src/parser/parse.cpp $(OPTION)

CI-TEST-Wopslang: # it will be used to run CI
	g++ -fPIC -shared lib/library.cpp -o test/lib/library.so -std=c++11 | g++ -o Wopslang src/interpreter.cpp src/parser/parse.cpp $(OPTION)

clean:
	rm Wopslang 
