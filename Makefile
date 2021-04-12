BUILD_DIR := ${PWD}
DESTDIR := ${BUILD_DIR}/build

all: build
build: build-ltrace shadow-trace

shadow-trace:
	mkdir -p ${DESTDIR}/obj
	gcc -ldl -o ${DESTDIR}/obj/main.o -c main.cpp -I./modules/ltrace -I./modules/ltrace/sysdeps/ -I./modules/ltrace/sysdeps/linux-gnu -I./modules/ltrace/sysdeps/linux-gnu/x86
	./libtool --tag=CC --mode=link gcc -ldl -Wall -Wsign-compare -Wfloat-equal -Wformat-security -Werror -g -O2 -o ${DESTDIR}/shadow-trace ${DESTDIR}/obj/main.o ./modules/ltrace/libltrace.la 

ltrace:
	cd ./modules/ltrace && \
	make
	
build-ltrace:
	cd ./modules/ltrace && \
	./autogen.sh && \
	./configure && \
	make
	
install:
	cp -r ${DESTDIR}/shadow-trace /usr/local/bin/shadow-trace

clean:
	rm -rf ${DESTDIR}