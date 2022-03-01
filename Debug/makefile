################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include startup/subdir.mk
-include src/subdir.mk
-include Utilities/subdir.mk
-include StdPeriph_Driver/src/subdir.mk
-include CMSIS/DSP_Lib/TransformFunctions/subdir.mk
-include CMSIS/DSP_Lib/SupportFunctions/subdir.mk
-include CMSIS/DSP_Lib/StatisticsFunctions/subdir.mk
-include CMSIS/DSP_Lib/MatrixFunctions/subdir.mk
-include CMSIS/DSP_Lib/FilteringFunctions/subdir.mk
-include CMSIS/DSP_Lib/FastMathFunctions/subdir.mk
-include CMSIS/DSP_Lib/ControllerFunctions/subdir.mk
-include CMSIS/DSP_Lib/ComplexMathFunctions/subdir.mk
-include CMSIS/DSP_Lib/CommonTables/subdir.mk
-include CMSIS/DSP_Lib/BasicMathFunctions/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: Template_DSP_FIR_USART.elf

# Tool invocations
Template_DSP_FIR_USART.elf: $(OBJS) $(USER_OBJS) C:\Users\Lorenzo\Desktop\Final_Assignment_2.0\Template_DSP_FIR_USART/LinkerScript.ld
	@echo 'Building target: $@'
	@echo 'Invoking: MCU GCC Linker'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -u_printf_float -T"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/LinkerScript.ld" -Wl,-Map=output.map -Wl,--gc-sections -o "Template_DSP_FIR_USART.elf" @"objects.list" $(USER_OBJS) $(LIBS) -lm
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

post-build:
	-@echo 'Generating binary and Printing size information:'
	arm-none-eabi-objcopy -O binary "Template_DSP_FIR_USART.elf" "Template_DSP_FIR_USART.bin"
	arm-none-eabi-size "Template_DSP_FIR_USART.elf"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
