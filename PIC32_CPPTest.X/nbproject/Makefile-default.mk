#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Periphery/ILI9341Device.cpp Periphery/USBCDCDevice.cpp UI/Painter.cpp Main.cpp GlobalSettings.cpp

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Periphery/ILI9341Device.o ${OBJECTDIR}/Periphery/USBCDCDevice.o ${OBJECTDIR}/UI/Painter.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/GlobalSettings.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Periphery/ILI9341Device.o.d ${OBJECTDIR}/Periphery/USBCDCDevice.o.d ${OBJECTDIR}/UI/Painter.o.d ${OBJECTDIR}/Main.o.d ${OBJECTDIR}/GlobalSettings.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Periphery/ILI9341Device.o ${OBJECTDIR}/Periphery/USBCDCDevice.o ${OBJECTDIR}/UI/Painter.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/GlobalSettings.o

# Source Files
SOURCEFILES=Periphery/ILI9341Device.cpp Periphery/USBCDCDevice.cpp UI/Painter.cpp Main.cpp GlobalSettings.cpp



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048ECG100
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Periphery/ILI9341Device.o: Periphery/ILI9341Device.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Periphery" 
	@${RM} ${OBJECTDIR}/Periphery/ILI9341Device.o.d 
	@${RM} ${OBJECTDIR}/Periphery/ILI9341Device.o 
	@${FIXDEPS} "${OBJECTDIR}/Periphery/ILI9341Device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/Periphery/ILI9341Device.o.d" -o ${OBJECTDIR}/Periphery/ILI9341Device.o Periphery/ILI9341Device.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/Periphery/USBCDCDevice.o: Periphery/USBCDCDevice.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Periphery" 
	@${RM} ${OBJECTDIR}/Periphery/USBCDCDevice.o.d 
	@${RM} ${OBJECTDIR}/Periphery/USBCDCDevice.o 
	@${FIXDEPS} "${OBJECTDIR}/Periphery/USBCDCDevice.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/Periphery/USBCDCDevice.o.d" -o ${OBJECTDIR}/Periphery/USBCDCDevice.o Periphery/USBCDCDevice.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/UI/Painter.o: UI/Painter.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/UI" 
	@${RM} ${OBJECTDIR}/UI/Painter.o.d 
	@${RM} ${OBJECTDIR}/UI/Painter.o 
	@${FIXDEPS} "${OBJECTDIR}/UI/Painter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/UI/Painter.o.d" -o ${OBJECTDIR}/UI/Painter.o UI/Painter.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/Main.o: Main.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/GlobalSettings.o: GlobalSettings.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/GlobalSettings.o.d 
	@${RM} ${OBJECTDIR}/GlobalSettings.o 
	@${FIXDEPS} "${OBJECTDIR}/GlobalSettings.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/GlobalSettings.o.d" -o ${OBJECTDIR}/GlobalSettings.o GlobalSettings.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
else
${OBJECTDIR}/Periphery/ILI9341Device.o: Periphery/ILI9341Device.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Periphery" 
	@${RM} ${OBJECTDIR}/Periphery/ILI9341Device.o.d 
	@${RM} ${OBJECTDIR}/Periphery/ILI9341Device.o 
	@${FIXDEPS} "${OBJECTDIR}/Periphery/ILI9341Device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/Periphery/ILI9341Device.o.d" -o ${OBJECTDIR}/Periphery/ILI9341Device.o Periphery/ILI9341Device.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/Periphery/USBCDCDevice.o: Periphery/USBCDCDevice.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Periphery" 
	@${RM} ${OBJECTDIR}/Periphery/USBCDCDevice.o.d 
	@${RM} ${OBJECTDIR}/Periphery/USBCDCDevice.o 
	@${FIXDEPS} "${OBJECTDIR}/Periphery/USBCDCDevice.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/Periphery/USBCDCDevice.o.d" -o ${OBJECTDIR}/Periphery/USBCDCDevice.o Periphery/USBCDCDevice.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/UI/Painter.o: UI/Painter.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/UI" 
	@${RM} ${OBJECTDIR}/UI/Painter.o.d 
	@${RM} ${OBJECTDIR}/UI/Painter.o 
	@${FIXDEPS} "${OBJECTDIR}/UI/Painter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/UI/Painter.o.d" -o ${OBJECTDIR}/UI/Painter.o UI/Painter.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/Main.o: Main.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/Main.o.d" -o ${OBJECTDIR}/Main.o Main.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
${OBJECTDIR}/GlobalSettings.o: GlobalSettings.cpp  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/GlobalSettings.o.d 
	@${RM} ${OBJECTDIR}/GlobalSettings.o 
	@${FIXDEPS} "${OBJECTDIR}/GlobalSettings.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-rtti -fno-exceptions -fcheck-new -fno-enforce-eh-specs -Wall -MMD -MF "${OBJECTDIR}/GlobalSettings.o.d" -o ${OBJECTDIR}/GlobalSettings.o GlobalSettings.cpp   -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -lstdc++
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x27F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=4096,--defsym=_min_stack_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--warn-section-align,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=4096,--defsym=_min_stack_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--warn-section-align,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_CPPTest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
