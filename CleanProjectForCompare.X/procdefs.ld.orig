/*--------------------------------------------------------------------------
 * MPLAB XC Compiler -  PIC32MZ2048ECG100 linker script
 * Build date : Jul 16 2019
 * 
 * Copyright (c) 2019, Microchip Technology Inc. and its subsidiaries ("Microchip")
 * All rights reserved.
 * 
 * This software is developed by Microchip Technology Inc. and its
 * subsidiaries ("Microchip").
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are 
 * met:
 * 
 * 1.      Redistributions of source code must retain the above copyright
 *         notice, this list of conditions and the following disclaimer.
 * 2.      Redistributions in binary form must reproduce the above 
 *         copyright notice, this list of conditions and the following 
 *         disclaimer in the documentation and/or other materials provided 
 *         with the distribution.
 * 3.      Microchip's name may not be used to endorse or promote products
 *         derived from this software without specific prior written 
 *         permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL MICROCHIP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWSOEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */

/* Default linker script, for normal executables */

/*  NOTE: This single-file linker script replaces the two-file system used
 *  for older PIC32 devices. 
 */

OUTPUT_FORMAT("elf32-tradlittlemips")
OUTPUT_ARCH(pic32mx)
ENTRY(_reset)
/*
 * Provide for a minimum stack and heap size
 * - _min_stack_size - represents the minimum space that must be made
 *                     available for the stack.  Can be overridden from
 *                     the command line using the linker's --defsym option.
 * - _min_heap_size  - represents the minimum space that must be made
 *                     available for the heap.  Must be specified on
 *                     the command line using the linker's --defsym option.
 */
EXTERN (_min_stack_size _min_heap_size)
PROVIDE(_min_stack_size = 0x400) ;

/*************************************************************************
 * Legacy processor-specific object file.  Contains SFR definitions.
 * The SFR definitions are now provided in a processor-specific *.S
 * assembly source file rather than the processor.o file. Use the new
 * .S file rather than this processor.o file for new projects. MPLAB XC32
 * v2.10 and later will automatically link the new .S file. When using * this linker script with an older MPLAB XC32 version, remove the
 * OPTIONAL() line below and add the pic32mx/lib/proc/<device>.S file
 * to your project.
 *************************************************************************/
OPTIONAL("processor.o")


/*************************************************************************
 * Vector-offset initialization
 *************************************************************************/
OPTIONAL("vector_offset_init.o")

/*************************************************************************
 * Symbols used for interrupt-vector table generation
 * To override the defaults, define the _ebase_address symbol using
 * the --defsym linker opt as shown in this example:
 *   xc32-gcc src.c -Wl,--defsym=_ebase_address=0x9D001000
 *************************************************************************/
PROVIDE(_vector_spacing = 0x0001);
PROVIDE(_ebase_address = 0x9D000000);

/*************************************************************************
 * Memory Address Equates
 * _RESET_ADDR                    -- Reset Vector or entry point
 * _BEV_EXCPT_ADDR                -- Boot exception Vector
 * _DBG_EXCPT_ADDR                -- In-circuit Debugging Exception Vector
 * _SIMPLE_TLB_REFILL_EXCPT_ADDR  -- Simple TLB-Refill Exception Vector
 * _CACHE_ERR_EXCPT_ADDR          -- Cache-error Exception Vector
 * _GEN_EXCPT_ADDR                -- General Exception Vector
 *************************************************************************/
_RESET_ADDR                    = 0xBFC00000;
_BEV_EXCPT_ADDR                = 0xBFC00380;
_DBG_EXCPT_ADDR                = 0xBFC00480;
_SIMPLE_TLB_REFILL_EXCPT_ADDR  = _ebase_address + 0;
_CACHE_ERR_EXCPT_ADDR          = _ebase_address + 0x100;
_GEN_EXCPT_ADDR                = _ebase_address + 0x180;

/*************************************************************************
 * Memory Regions
 *
 * Memory regions without attributes cannot be used for orphaned sections.
 * Only sections specifically assigned to these regions can be allocated
 * into these regions.
 *
 * The Debug exception vector is located at 0x9FC00480.
 *
 * The config_<address> sections are used to locate the config words at
 * their absolute addresses.
 *************************************************************************/


MEMORY
{
  kseg0_program_mem     (rx)  : ORIGIN = 0x9D000000, LENGTH = 0x200000
  kseg0_boot_mem              : ORIGIN = 0x9FC004B0, LENGTH = 0x0
  kseg1_boot_mem              : ORIGIN = 0xBFC00000, LENGTH = 0x480
  kseg1_boot_mem_4B0          : ORIGIN = 0xBFC004B0, LENGTH = 0xFA50
  config_BFC0FF40             : ORIGIN = 0xBFC0FF40, LENGTH = 0x4
  config_BFC0FF44             : ORIGIN = 0xBFC0FF44, LENGTH = 0x4
  config_BFC0FF48             : ORIGIN = 0xBFC0FF48, LENGTH = 0x4
  config_BFC0FF4C             : ORIGIN = 0xBFC0FF4C, LENGTH = 0x4
  config_BFC0FF50             : ORIGIN = 0xBFC0FF50, LENGTH = 0x4
  config_BFC0FF54             : ORIGIN = 0xBFC0FF54, LENGTH = 0x4
  config_BFC0FF58             : ORIGIN = 0xBFC0FF58, LENGTH = 0x4
  config_BFC0FF5C             : ORIGIN = 0xBFC0FF5C, LENGTH = 0x4
  config_BFC0FF60             : ORIGIN = 0xBFC0FF60, LENGTH = 0x4
  config_BFC0FF64             : ORIGIN = 0xBFC0FF64, LENGTH = 0x4
  config_BFC0FF68             : ORIGIN = 0xBFC0FF68, LENGTH = 0x4
  config_BFC0FF6C             : ORIGIN = 0xBFC0FF6C, LENGTH = 0x4
  config_BFC0FF70             : ORIGIN = 0xBFC0FF70, LENGTH = 0x4
  config_BFC0FF74             : ORIGIN = 0xBFC0FF74, LENGTH = 0x4
  config_BFC0FF78             : ORIGIN = 0xBFC0FF78, LENGTH = 0x4
  config_BFC0FF7C             : ORIGIN = 0xBFC0FF7C, LENGTH = 0x4
  config_BFC0FFC0             : ORIGIN = 0xBFC0FFC0, LENGTH = 0x4
  config_BFC0FFC4             : ORIGIN = 0xBFC0FFC4, LENGTH = 0x4
  config_BFC0FFC8             : ORIGIN = 0xBFC0FFC8, LENGTH = 0x4
  config_BFC0FFCC             : ORIGIN = 0xBFC0FFCC, LENGTH = 0x4
  config_BFC0FFD0             : ORIGIN = 0xBFC0FFD0, LENGTH = 0x4
  config_BFC0FFD4             : ORIGIN = 0xBFC0FFD4, LENGTH = 0x4
  config_BFC0FFD8             : ORIGIN = 0xBFC0FFD8, LENGTH = 0x4
  config_BFC0FFDC             : ORIGIN = 0xBFC0FFDC, LENGTH = 0x4
  config_BFC0FFE0             : ORIGIN = 0xBFC0FFE0, LENGTH = 0x4
  config_BFC0FFE4             : ORIGIN = 0xBFC0FFE4, LENGTH = 0x4
  config_BFC0FFE8             : ORIGIN = 0xBFC0FFE8, LENGTH = 0x4
  config_BFC0FFEC             : ORIGIN = 0xBFC0FFEC, LENGTH = 0x4
  config_BFC0FFF0             : ORIGIN = 0xBFC0FFF0, LENGTH = 0x4
  config_BFC0FFF4             : ORIGIN = 0xBFC0FFF4, LENGTH = 0x4
  config_BFC0FFF8             : ORIGIN = 0xBFC0FFF8, LENGTH = 0x4
  config_BFC0FFFC             : ORIGIN = 0xBFC0FFFC, LENGTH = 0x4
  lowerbootaliaslastpage      : ORIGIN = 0xBFC10000, LENGTH = 0x4000
  upperbootalias              : ORIGIN = 0xBFC20000, LENGTH = 0xFF00
  config_BFC2FF40             : ORIGIN = 0xBFC2FF40, LENGTH = 0x4
  config_BFC2FF44             : ORIGIN = 0xBFC2FF44, LENGTH = 0x4
  config_BFC2FF48             : ORIGIN = 0xBFC2FF48, LENGTH = 0x4
  config_BFC2FF4C             : ORIGIN = 0xBFC2FF4C, LENGTH = 0x4
  config_BFC2FF50             : ORIGIN = 0xBFC2FF50, LENGTH = 0x4
  config_BFC2FF54             : ORIGIN = 0xBFC2FF54, LENGTH = 0x4
  config_BFC2FF58             : ORIGIN = 0xBFC2FF58, LENGTH = 0x4
  config_BFC2FF5C             : ORIGIN = 0xBFC2FF5C, LENGTH = 0x4
  config_BFC2FF60             : ORIGIN = 0xBFC2FF60, LENGTH = 0x4
  config_BFC2FF64             : ORIGIN = 0xBFC2FF64, LENGTH = 0x4
  config_BFC2FF68             : ORIGIN = 0xBFC2FF68, LENGTH = 0x4
  config_BFC2FF6C             : ORIGIN = 0xBFC2FF6C, LENGTH = 0x4
  config_BFC2FF70             : ORIGIN = 0xBFC2FF70, LENGTH = 0x4
  config_BFC2FF74             : ORIGIN = 0xBFC2FF74, LENGTH = 0x4
  config_BFC2FF78             : ORIGIN = 0xBFC2FF78, LENGTH = 0x4
  config_BFC2FF7C             : ORIGIN = 0xBFC2FF7C, LENGTH = 0x4
  config_BFC2FFC0             : ORIGIN = 0xBFC2FFC0, LENGTH = 0x4
  config_BFC2FFC4             : ORIGIN = 0xBFC2FFC4, LENGTH = 0x4
  config_BFC2FFC8             : ORIGIN = 0xBFC2FFC8, LENGTH = 0x4
  config_BFC2FFCC             : ORIGIN = 0xBFC2FFCC, LENGTH = 0x4
  config_BFC2FFD0             : ORIGIN = 0xBFC2FFD0, LENGTH = 0x4
  config_BFC2FFD4             : ORIGIN = 0xBFC2FFD4, LENGTH = 0x4
  config_BFC2FFD8             : ORIGIN = 0xBFC2FFD8, LENGTH = 0x4
  config_BFC2FFDC             : ORIGIN = 0xBFC2FFDC, LENGTH = 0x4
  config_BFC2FFE0             : ORIGIN = 0xBFC2FFE0, LENGTH = 0x4
  config_BFC2FFE4             : ORIGIN = 0xBFC2FFE4, LENGTH = 0x4
  config_BFC2FFE8             : ORIGIN = 0xBFC2FFE8, LENGTH = 0x4
  config_BFC2FFEC             : ORIGIN = 0xBFC2FFEC, LENGTH = 0x4
  config_BFC2FFF0             : ORIGIN = 0xBFC2FFF0, LENGTH = 0x4
  config_BFC2FFF4             : ORIGIN = 0xBFC2FFF4, LENGTH = 0x4
  config_BFC2FFF8             : ORIGIN = 0xBFC2FFF8, LENGTH = 0x4
  config_BFC2FFFC             : ORIGIN = 0xBFC2FFFC, LENGTH = 0x4
  upperbootaliaslastpage      : ORIGIN = 0xBFC30000, LENGTH = 0x4000
  boot1                       : ORIGIN = 0xBFC40000, LENGTH = 0xFF00
  config_BFC4FF40             : ORIGIN = 0xBFC4FF40, LENGTH = 0x4
  config_BFC4FF44             : ORIGIN = 0xBFC4FF44, LENGTH = 0x4
  config_BFC4FF48             : ORIGIN = 0xBFC4FF48, LENGTH = 0x4
  config_BFC4FF4C             : ORIGIN = 0xBFC4FF4C, LENGTH = 0x4
  config_BFC4FF50             : ORIGIN = 0xBFC4FF50, LENGTH = 0x4
  config_BFC4FF54             : ORIGIN = 0xBFC4FF54, LENGTH = 0x4
  config_BFC4FF58             : ORIGIN = 0xBFC4FF58, LENGTH = 0x4
  config_BFC4FF5C             : ORIGIN = 0xBFC4FF5C, LENGTH = 0x4
  config_BFC4FF60             : ORIGIN = 0xBFC4FF60, LENGTH = 0x4
  config_BFC4FF64             : ORIGIN = 0xBFC4FF64, LENGTH = 0x4
  config_BFC4FF68             : ORIGIN = 0xBFC4FF68, LENGTH = 0x4
  config_BFC4FF6C             : ORIGIN = 0xBFC4FF6C, LENGTH = 0x4
  config_BFC4FF70             : ORIGIN = 0xBFC4FF70, LENGTH = 0x4
  config_BFC4FF74             : ORIGIN = 0xBFC4FF74, LENGTH = 0x4
  config_BFC4FF78             : ORIGIN = 0xBFC4FF78, LENGTH = 0x4
  config_BFC4FF7C             : ORIGIN = 0xBFC4FF7C, LENGTH = 0x4
  config_BFC4FFC0             : ORIGIN = 0xBFC4FFC0, LENGTH = 0x4
  config_BFC4FFC4             : ORIGIN = 0xBFC4FFC4, LENGTH = 0x4
  config_BFC4FFC8             : ORIGIN = 0xBFC4FFC8, LENGTH = 0x4
  config_BFC4FFCC             : ORIGIN = 0xBFC4FFCC, LENGTH = 0x4
  config_BFC4FFD0             : ORIGIN = 0xBFC4FFD0, LENGTH = 0x4
  config_BFC4FFD4             : ORIGIN = 0xBFC4FFD4, LENGTH = 0x4
  config_BFC4FFD8             : ORIGIN = 0xBFC4FFD8, LENGTH = 0x4
  config_BFC4FFDC             : ORIGIN = 0xBFC4FFDC, LENGTH = 0x4
  config_BFC4FFE0             : ORIGIN = 0xBFC4FFE0, LENGTH = 0x4
  config_BFC4FFE4             : ORIGIN = 0xBFC4FFE4, LENGTH = 0x4
  config_BFC4FFE8             : ORIGIN = 0xBFC4FFE8, LENGTH = 0x4
  config_BFC4FFEC             : ORIGIN = 0xBFC4FFEC, LENGTH = 0x4
  config_BFC4FFF0             : ORIGIN = 0xBFC4FFF0, LENGTH = 0x4
  config_BFC4FFF4             : ORIGIN = 0xBFC4FFF4, LENGTH = 0x4
  config_BFC4FFF8             : ORIGIN = 0xBFC4FFF8, LENGTH = 0x4
  config_BFC4FFFC             : ORIGIN = 0xBFC4FFFC, LENGTH = 0x4
  boot1lastpage               : ORIGIN = 0xBFC50000, LENGTH = 0x4000
  config_BFC54000             : ORIGIN = 0xBFC54000, LENGTH = 0x4
  config_BFC54004             : ORIGIN = 0xBFC54004, LENGTH = 0x4
  config_BFC54008             : ORIGIN = 0xBFC54008, LENGTH = 0x4
  config_BFC5400C             : ORIGIN = 0xBFC5400C, LENGTH = 0x4
  config_BFC54010             : ORIGIN = 0xBFC54010, LENGTH = 0x4
  config_BFC54020             : ORIGIN = 0xBFC54020, LENGTH = 0x4
  config_BFC54024             : ORIGIN = 0xBFC54024, LENGTH = 0x4
  boot2                       : ORIGIN = 0xBFC60000, LENGTH = 0xFF00
  config_BFC6FF40             : ORIGIN = 0xBFC6FF40, LENGTH = 0x4
  config_BFC6FF44             : ORIGIN = 0xBFC6FF44, LENGTH = 0x4
  config_BFC6FF48             : ORIGIN = 0xBFC6FF48, LENGTH = 0x4
  config_BFC6FF4C             : ORIGIN = 0xBFC6FF4C, LENGTH = 0x4
  config_BFC6FF50             : ORIGIN = 0xBFC6FF50, LENGTH = 0x4
  config_BFC6FF54             : ORIGIN = 0xBFC6FF54, LENGTH = 0x4
  config_BFC6FF58             : ORIGIN = 0xBFC6FF58, LENGTH = 0x4
  config_BFC6FF5C             : ORIGIN = 0xBFC6FF5C, LENGTH = 0x4
  config_BFC6FF60             : ORIGIN = 0xBFC6FF60, LENGTH = 0x4
  config_BFC6FF64             : ORIGIN = 0xBFC6FF64, LENGTH = 0x4
  config_BFC6FF68             : ORIGIN = 0xBFC6FF68, LENGTH = 0x4
  config_BFC6FF6C             : ORIGIN = 0xBFC6FF6C, LENGTH = 0x4
  config_BFC6FF70             : ORIGIN = 0xBFC6FF70, LENGTH = 0x4
  config_BFC6FF74             : ORIGIN = 0xBFC6FF74, LENGTH = 0x4
  config_BFC6FF78             : ORIGIN = 0xBFC6FF78, LENGTH = 0x4
  config_BFC6FF7C             : ORIGIN = 0xBFC6FF7C, LENGTH = 0x4
  config_BFC6FFC0             : ORIGIN = 0xBFC6FFC0, LENGTH = 0x4
  config_BFC6FFC4             : ORIGIN = 0xBFC6FFC4, LENGTH = 0x4
  config_BFC6FFC8             : ORIGIN = 0xBFC6FFC8, LENGTH = 0x4
  config_BFC6FFCC             : ORIGIN = 0xBFC6FFCC, LENGTH = 0x4
  config_BFC6FFD0             : ORIGIN = 0xBFC6FFD0, LENGTH = 0x4
  config_BFC6FFD4             : ORIGIN = 0xBFC6FFD4, LENGTH = 0x4
  config_BFC6FFD8             : ORIGIN = 0xBFC6FFD8, LENGTH = 0x4
  config_BFC6FFDC             : ORIGIN = 0xBFC6FFDC, LENGTH = 0x4
  config_BFC6FFE0             : ORIGIN = 0xBFC6FFE0, LENGTH = 0x4
  config_BFC6FFE4             : ORIGIN = 0xBFC6FFE4, LENGTH = 0x4
  config_BFC6FFE8             : ORIGIN = 0xBFC6FFE8, LENGTH = 0x4
  config_BFC6FFEC             : ORIGIN = 0xBFC6FFEC, LENGTH = 0x4
  config_BFC6FFF0             : ORIGIN = 0xBFC6FFF0, LENGTH = 0x4
  config_BFC6FFF4             : ORIGIN = 0xBFC6FFF4, LENGTH = 0x4
  config_BFC6FFF8             : ORIGIN = 0xBFC6FFF8, LENGTH = 0x4
  config_BFC6FFFC             : ORIGIN = 0xBFC6FFFC, LENGTH = 0x4
  boot2lastpage               : ORIGIN = 0xBFC70000, LENGTH = 0x4000
  kseg0_data_mem       (w!x)  : ORIGIN = 0x80000000, LENGTH = 0x80000
  sfrs                        : ORIGIN = 0xBF800000, LENGTH = 0x100000
  configsfrs_BFC0FF40         : ORIGIN = 0xBFC0FF40, LENGTH = 0x40
  configsfrs_BFC0FFC0         : ORIGIN = 0xBFC0FFC0, LENGTH = 0x40
  configsfrs_BFC2FF40         : ORIGIN = 0xBFC2FF40, LENGTH = 0x40
  configsfrs_BFC2FFC0         : ORIGIN = 0xBFC2FFC0, LENGTH = 0x40
  configsfrs_BFC4FF40         : ORIGIN = 0xBFC4FF40, LENGTH = 0x40
  configsfrs_BFC4FFC0         : ORIGIN = 0xBFC4FFC0, LENGTH = 0x40
  configsfrs_BFC54000         : ORIGIN = 0xBFC54000, LENGTH = 0x14
  configsfrs_BFC54020         : ORIGIN = 0xBFC54020, LENGTH = 0x8
  configsfrs_BFC6FF40         : ORIGIN = 0xBFC6FF40, LENGTH = 0x40
  configsfrs_BFC6FFC0         : ORIGIN = 0xBFC6FFC0, LENGTH = 0x40
  kseg2_ebi_data_mem          : ORIGIN = 0xC0000000, LENGTH = 0x4000000
  kseg2_sqi_data_mem          : ORIGIN = 0xD0000000, LENGTH = 0x4000000
  kseg3_ebi_data_mem          : ORIGIN = 0xE0000000, LENGTH = 0x4000000
  kseg3_sqi_data_mem          : ORIGIN = 0xF0000000, LENGTH = 0x4000000
}

INCLUDE "procdefs_common.ld"