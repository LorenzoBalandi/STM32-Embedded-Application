################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../startup/startup_stm32f40_41xxx.s 

OBJS += \
./startup/startup_stm32f40_41xxx.o 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/core" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/device" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/StdPeriph_Driver/inc" -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


