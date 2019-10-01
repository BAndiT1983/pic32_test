XC32_PATH=/home/dev/XC32
CC=${XC32_PATH}/bin/xc32-g++

BUILD_DIR=build
INC_DIR=${XC32_PATH}/pic32mx/include

SOURCE_FILES=Main.cpp

OPTS=-g -x c++ -c -mprocessor=32MZ2048ECG100 -fno-rtti -fno-exceptions -fno-check-new -fno-enforce-eh-specs -Wall -MMD -MF

DEPENDFILE = ${BUILD_DIR}/.depend

dep: $(SOURCE_FILES)
	@ mkdir -p ${BUILD_DIR}
	$(CC) -MM $(SOURCE_FILES) > $(DEPENDFILE)

-include $(DEPENDFILE)

${BUILD_DIR}/PIC32_UATest: ${SOURCE_FILES}
	@ mkdir -p build
	${CC} ${OPTS} ${SOURCE_FILES} -o ${BUILD_DIR}/$@ 

#%.c%.o: ${SOURCE_FILES}
	#@ mkdir -p build
	#${CC} ${OPTS} ${SOURCE_FILES} -o ${BUILD_DIR}/$@ 