################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_f64.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_opt_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_opt_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_opt_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_opt_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_opt_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_opt_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_opt_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_opt_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_opt_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_fast_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_fast_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_fast_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_fast_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q7.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_f32.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_q31.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_q15.c \
../CMSIS/DSP_Lib/FilteringFunctions/arm_lms_q31.c 

OBJS += \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_f64.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_opt_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_opt_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_opt_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_opt_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_opt_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_opt_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_opt_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_opt_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_opt_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_fast_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_fast_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_fast_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_fast_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q7.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_f32.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_q31.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_q15.o \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_q31.o 

C_DEPS += \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df1_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_f64.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_opt_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_fast_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_opt_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_opt_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_opt_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_fast_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_opt_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_opt_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_partial_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_conv_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_opt_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_fast_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_opt_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_opt_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_correlate_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_fast_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_fast_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_decimate_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_fast_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_fast_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_init_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_interpolate_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_lattice_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_init_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_fir_sparse_q7.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_iir_lattice_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_f32.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_init_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_norm_q31.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_q15.d \
./CMSIS/DSP_Lib/FilteringFunctions/arm_lms_q31.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS/DSP_Lib/FilteringFunctions/%.o: ../CMSIS/DSP_Lib/FilteringFunctions/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32F407VGTx -DSTM32F4 -DSTM32F407G_DISC1 -DSTM32 -DDEBUG -DUSE_STDPERIPH_DRIVER -DSTM32F40XX -DSTM32F40_41xxx '-DHSE_VALUE=8000000' -DARM_MATH_CM4 -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/core" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/CMSIS/device" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/StdPeriph_Driver/inc" -I"C:/Users/Lorenzo/Desktop/Final_Assignment_2.0/Template_DSP_FIR_USART/Utilities" -O2 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


