/*
 * Library_LabArch.c
 *
 *  Created on: 08 giu 2020
 *      Author: Group 15
 */

#include "stm32f4xx.h"
#include "stm32f4_discovery.h"
#include "stm32f4_discovery_lis3dsh.h"

#include <stdio.h>

#include "arm_math.h"
#include "math_helper.h"
#include "noarm_cmsis.h"

#include "Library_LabArch.h"


						/*______________________________________*/
						/*				 Functions				*/
						/*______________________________________*/

/** CALCOLO PITCH E ROLL:
  * @brief  This function computes roll and pitch angles (in degrees) from filtered accelerometer data
  * @param  filtered acc data (3 elements array)
  * @retval pitch and roll angles
  */
void roll_pitch_calc(float filtered_acc_data[], float *roll, float *pitch)
{
	/*
	filtered_acc_data[0] = ax
	filtered_acc_data[1] = ay
	filtered_acc_data[2] = az
	*/
	*roll = (float) atan2((double)filtered_acc_data[1],(double)filtered_acc_data[2]); // atan2(ay,az)
	*pitch = (float) atan2((double)-filtered_acc_data[0], (double)(sqrt((filtered_acc_data[1]*filtered_acc_data[1]) + (filtered_acc_data[2]*filtered_acc_data[2]))));
	// non utilizzando variabili temporanee per calcolare i quadrati si risparmiano circa 100 cicli,
	// non utilizzando la funzione pow si risparmiano circa 1000 cicli

	// conversione in gradi
	*roll = (360.0f*(*roll))/due_pi;
	*pitch = (360.0f*(*pitch))/due_pi; // definendo una costante 180/pi non cambia il numero di cicli rispetto a questo caso

	// NOTA:
	// il pitch varia da -90 a 90, il roll da -180 a 180

}


/**
  * @brief  This function turns on leds using Schmitt trigger to obtain a better stability
  * @param  roll and pitch angles in degrees
  * @retval none
  */
void RollPitchLEDs (float roll, float pitch) {

		// Orange	ROLL > 0
		// Green	PITCH  < 0
		// Red		PITCH  > 0
		// Blue		ROLL < 0

	if ((roll - (ROLL_TRIGGER_VALUE + ROLL_TRIGGER_DELTA)) > 0)
		STM_EVAL_LEDOn(LED3);
	else if (((ROLL_TRIGGER_VALUE - ROLL_TRIGGER_DELTA) - roll) > 0)
		STM_EVAL_LEDOff(LED3);

	if ((roll + (ROLL_TRIGGER_VALUE + ROLL_TRIGGER_DELTA)) < 0)
		STM_EVAL_LEDOn(LED6);
	else if ((- (ROLL_TRIGGER_VALUE - ROLL_TRIGGER_DELTA) - roll) < 0)
		STM_EVAL_LEDOff(LED6);


	if ((pitch - (PITCH_TRIGGER_VALUE + PITCH_TRIGGER_DELTA)) > 0)
		STM_EVAL_LEDOn(LED4);
	else if (((PITCH_TRIGGER_VALUE - PITCH_TRIGGER_DELTA) - pitch) > 0)
		STM_EVAL_LEDOff(LED4);


	if ((pitch + (PITCH_TRIGGER_VALUE + PITCH_TRIGGER_DELTA)) < 0)
		STM_EVAL_LEDOn(LED5);
	else if ((- (PITCH_TRIGGER_VALUE - PITCH_TRIGGER_DELTA) - pitch) < 0)
		STM_EVAL_LEDOff(LED5);

}


/*
 * This function finds computes the mean of 5 value in the provided array
 * @param 	data[]		data array in FLOAT
 * @return 	mean		the mean value of the 5 value
 * NOTE					Funzione piu possibile ottimizata per il progetto
 */
float compute_mean_5_value_float(float data[])
{
	float mean = 0;

	for (register int8_t i = 0; i < 5; i++) {
	  mean = mean + data[i];
    }

	mean = mean / 5;

	return mean;
}

/*
 * This function shifts the elements of three given arrays of equal length
 * @param 	* Buffer1	Puntatore ad array
 * @param 	* Buffer2	Puntatore ad array
 * @param 	* Buffer3	Puntatore ad array
 * @param 	dim			Dimensione degli array
 */
void TripleBufferShifter (float* Buffer1, float* Buffer2, float* Buffer3, uint8_t dim){

	for (register int8_t i = dim-2; i >= 0; i--) {
		*(Buffer1 + i +1) = *(Buffer1 +i);
		*(Buffer2 + i +1) = *(Buffer2 +i);
		*(Buffer3 + i +1) = *(Buffer3 +i);
	}
}

