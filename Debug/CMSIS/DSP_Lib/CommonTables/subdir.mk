################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS/DSP_Lib/CommonTables/arm_common_tables.c \
../CMSIS/DSP_Lib/CommonTables/arm_const_structs.c 

OBJS += \
./CMSIS/DSP_Lib/CommonTables/arm_common_tables.o \
./CMSIS/DSP_Lib/CommonTables/arm_const_structs.o 

C_DEPS += \
./CMSIS/DSP_Lib/CommonTables/arm_common_tables.d \
./CMSIS/DSP_Lib/CommonTables/arm_const_structs.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS/DSP_Lib/CommonTables/%.o: ../CMSIS/DSP_Lib/CommonTables/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F407VGTx -DSTM32F4 -DSTM32F407G_DISC1 -DSTM32 -DDEBUG -DUSE_STDPERIPH_DRIVER -DSTM32F40XX -DSTM32F40_41xxx '-DHSE_VALUE=8000000' -DARM_MATH_CM4 -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/core" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/device" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/StdPeriph_Driver/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/Utilities" -O2 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


