################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Library_LabArch.c \
../src/arm_fir_data.c \
../src/main.c \
../src/math_helper.c \
../src/noarm_cmsis.c \
../src/syscalls.c \
../src/system_stm32f4xx.c 

OBJS += \
./src/Library_LabArch.o \
./src/arm_fir_data.o \
./src/main.o \
./src/math_helper.o \
./src/noarm_cmsis.o \
./src/syscalls.o \
./src/system_stm32f4xx.o 

C_DEPS += \
./src/Library_LabArch.d \
./src/arm_fir_data.d \
./src/main.d \
./src/math_helper.d \
./src/noarm_cmsis.d \
./src/syscalls.d \
./src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F407VGTx -DSTM32F4 -DSTM32F407G_DISC1 -DSTM32 -DDEBUG -DUSE_STDPERIPH_DRIVER -DSTM32F40XX -DSTM32F40_41xxx '-DHSE_VALUE=8000000' -DARM_MATH_CM4 -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/core" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/device" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/StdPeriph_Driver/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/Utilities" -O2 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


