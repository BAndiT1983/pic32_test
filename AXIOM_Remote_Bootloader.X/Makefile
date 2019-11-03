XC32_PATH=/home/andi/XC32
CC=${XC32_PATH}/bin/xc32-g++
LD=${XC32_PATH}/bin/xc32-ld

DEVICE=32MZ2048ECG100

BUILD_DIR=build
INC_DIR=-I${XC32_PATH}/pic32mx/include

SOURCE_FILES=$(wildcard *.cpp) $(wildcard **/*.cpp)
OBJ_FILES=${SOURCE_FILES:%.cpp=${BUILD_DIR}/%.o}
#DEPS=${SOURCE_FILES:.o=.d}



#DEPENDFILE = ${BUILD_DIR}/.depend

OPTS=-c -g -G0 -mprocessor=${DEVICE} -mconfig-data-dir=${XC32_PATH}/pic32mx/lib/proc/${DEVICE} -iprefix ${XC32_PATH}/lib/gcc/pic32mx/4.8.3/ -Wall -MMD -MF ${BUILD_DIR}/.depend
#LD_OPTS= --trace --script="procdefs.ld" --cref -L${XC32_PATH}/pic32mx/lib/proc/${DEVICE} -Map="${BUILD_DIR}/UATest_memory.map"
LD_OPTS= -v -Wl,--trace,--script="procdefs_boot.ld",--cref,-Map="${BUILD_DIR}/UATest_memory.map",--report-mem,--cref,--warn-section-align,--memorysummary=${BUILD_DIR}/memoryfile.xml

all: ${BUILD_DIR}/UATest.elf

${BUILD_DIR}/UATest.elf: ${OBJ_FILES}
	$(info "files123" $^)
	${CC} -mprocessor=32MZ2048ECG100 ${LD_OPTS} $^ -o $@
	${XC32_PATH}/bin/xc32-bin2hex $@ 

${OBJ_FILES}: ${BUILD_DIR}/%.o: %.cpp #${SOURCE_FILES}
	@ mkdir -p build
	@ mkdir -p build/Periphery
	$(info $(SOURCE_FILES))
	${CC} -c ${OPTS} $< -o $@ ${INC_DIR}

#dep: $(SRC)
#	$(CC) -MM ${SOURCE_FILES} > ${DEPENDFILE}

#-include $(DEPENDFILE)

#-include ${OBJ_FILES:.o=.d}

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}

#.PHONY: all clean
