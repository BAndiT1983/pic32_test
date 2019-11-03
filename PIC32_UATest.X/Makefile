XC32_PATH=/home/andi/XC32
CC=${XC32_PATH}/bin/xc32-g++
LD=${XC32_PATH}/bin/xc32-ld

BUILD_DIR=build
INC_DIR=${XC32_PATH}/pic32mx/include

SOURCE_FILES=Main.cpp #$(wildcard *.cpp)
OBJS = ${SOURCE_FILES:.cpp=.o}
DEPS = ${SOURCE_FILES:.cpp=.d}

OPTS= -v -x c++ -c -mprocessor=32MZ2048ECG100 -mdspr2 -mdsp -mxc32cpp-lib -msmart-io=0 -G0 -mips32r2 -mabi=32 -mpic32mzlibs -mconfig-data-dir=/home/andi/XC32/bin/bin/../../lib/gcc/pic32mx/4.8.3/../../../../pic32mx/lib/./proc/32MZ2048ECG100 -fno-rtti -fno-exceptions -fno-check-new -fno-enforce-eh-specs -Wall -MMD -MF 
#LD_OPTS= --defsym=__MPLAB_BUILD=1 --script="procdefs_app.ld" --no-code-in-dinit --no-dinit-in-serial-mem -Map="${BUILD_DIR}/UATest_memory.map" --report-mem --cref --warn-section-align --memorysummary ${BUILD_DIR}/memoryfile.xml
LD_OPTS= --trace --defsym=__MPLAB_BUILD=1 -mprocessor=32MZ2048ECG100 --script="procdefs_app.ld" --no-code-in-dinit --no-dinit-in-serial-mem -Map="${BUILD_DIR}/UATest_memory.map" --report-mem --cref --warn-section-align --memorysummary ${BUILD_DIR}/memoryfile.xml -L${XC32_PATH}/pic32mx/lib/proc/32MZ2048ECG100 


${BUILD_DIR}/UATest.elf: ${OBJS}
	${LD} ${BUILD_DIR}/${OBJS} ${LD_OPTS} -o ${BUILD_DIR}/UATest.elf
#	${XC32_PATH}/bin/xc32-bin2hex ${BUILD_DIR}/UATest.elf ${BUILD_DIR}/UATest.hex
	objcopy -O ihex ${BUILD_DIR}/UATest.elf ${BUILD_DIR}/UATest.hex

${OBJS}: ${SOURCE_FILES}
	@ mkdir -p build
	${CC} ${OPTS} ${BUILD_DIR}/${DEPS} $< -o ${BUILD_DIR}/$@ -DXPRJ_default=default -lstdc++	

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
