XC32_PATH=/home/andi/XC32
CC=${XC32_PATH}/bin/xc32-g++
LD=${XC32_PATH}/bin/xc32-ld

DEVICE=32MZ2048ECG100

BUILD_DIR=build
INC_DIR=${XC32_PATH}/pic32mx/include

SOURCE_FILES=Main.cpp #$(wildcard *.cpp)
OBJS = ${SOURCE_FILES:.cpp=.o}
DEPS = ${SOURCE_FILES:.cpp=.d}

OPTS= -g -c -G0 -mprocessor=${DEVICE} -mconfig-data-dir=${XC32_PATH}/pic32mx/lib/proc/${DEVICE} -iprefix ${XC32_PATH}/lib/gcc/pic32mx/4.8.3/ -Wall -MD -MF
#LD_OPTS= --trace --script="procdefs.ld" --cref -L${XC32_PATH}/pic32mx/lib/proc/${DEVICE} -Map="${BUILD_DIR}/UATest_memory.map"
LD_OPTS= -Wl,--trace,--script="procdefs.ld",--cref,-Map="${BUILD_DIR}/UATest_memory.map",--report-mem,--cref,--warn-section-align,--memorysummary=${BUILD_DIR}/memoryfile.xml

${BUILD_DIR}/UATest.elf: ${OBJS}
	${CC} -mprocessor=32MZ2048ECG100 ${BUILD_DIR}/$< -o $@ ${LD_OPTS}
	${XC32_PATH}/bin/xc32-bin2hex $@ 

${OBJS}: ${SOURCE_FILES}
	@ mkdir -p build
	${CC} ${OPTS} ${BUILD_DIR}/${DEPS} $< -o ${BUILD_DIR}/$@

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
