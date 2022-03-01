################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Utilities/stm32f4_discovery.c \
../Utilities/stm32f4_discovery_lis302dl.c \
../Utilities/stm32f4_discovery_lis3dsh.c 

OBJS += \
./Utilities/stm32f4_discovery.o \
./Utilities/stm32f4_discovery_lis302dl.o \
./Utilities/stm32f4_discovery_lis3dsh.o 

C_DEPS += \
./Utilities/stm32f4_discovery.d \
./Utilities/stm32f4_discovery_lis302dl.d \
./Utilities/stm32f4_discovery_lis3dsh.d 


# Each subdirectory must supply rules for building sources it contributes
Utilities/%.o: ../Utilities/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F407VGTx -DSTM32F4 -DSTM32F407G_DISC1 -DSTM32 -DDEBUG -DUSE_STDPERIPH_DRIVER -DSTM32F40XX -DSTM32F40_41xxx '-DHSE_VALUE=8000000' -DARM_MATH_CM4 -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/core" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/device" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/StdPeriph_Driver/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/Utilities" -O2 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


