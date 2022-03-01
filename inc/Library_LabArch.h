/*
 * Library_LabArch.h
 *
 *  Created on: 08 giu 2020
 *      Author: Group 15
 */

#ifndef LIBRARY_LABARCH_H_
#define LIBRARY_LABARCH_H_


					/*______________________________________________*/
					/*					DEFINE						*/
					/*______________________________________________*/

/************  TIMER Defines  ************/
/* Forumla ==> (CK_CNT/Frq_Cnl) = CCR_Val  {(Cnt/s)/(1/s) = Cnt} */
/* Forumla ==> (CK_CNT*Tmp_Cnl) = CCR_Val  {(Cnt/s)*s = Cnt} */

#define TIM3_CK_CNT 1300		// Esegue 1300 conteggi in 1s	//Il prescaler è a 16bit ==> CK_CNT[1282 , 84000000]Cnt

// Con il CK_CNT a 1300 e un CCR_Val a 16 bit si possono impostare le seguenti frequenze [0.02 , 1300]Hz ==> [50 , 0.77m]s
// Calcolo dei CCR_Val Capture Copare Register
#define Counter_for_ReadyToRead (13)		// 1300(Cnt/s) / 100(1/s)	= 13  Cnt
#define Counter_for_DataStreaming (260)		// 1300(Cnt/s) / 5(1/s)		= 260 Cnt
#define Counter_for_ResultStreaming (52)	// 1300(Cnt/s) / 25(1/s)	= 52  Cnt



/*********** Angle - Defines   ****************/
#define due_pi 6.2832f  				// con la f si specifica che il dato è float e non double
#define	ROLL_TRIGGER_VALUE	10.0000f	// Valore di Trigger per l'accensione dei Led
#define	PITCH_TRIGGER_VALUE	10.0000f
#define	ROLL_TRIGGER_DELTA	2.0000f		// L'accensione è resa stabile da un Trigger di Schmitt con il seguente delta
#define	PITCH_TRIGGER_DELTA 2.0000f



/*********** FIR - Defines   ****************/
#define BLOCK_SIZE            1		// Filtriamo alla stessa f. di campionamento dell'accelerometro
#define NUM_TAPS              10	// Numero dei coefficienti


/*********** Accelerometer calibration - Defines   ****************/
#define Acc_Gain_f 0.99f  // calibrazione effettuata seguendo la procedura descritta in https://www.analog.com/media/en/technical-documentation/application-notes/AN-1057.pdf
#define Acc_Offset_int 25



					/*______________________________________________*/
					/*				Function prototypes				*/
					/*______________________________________________*/

void USART_Config(void);
void Acc_Config(void);
void TimerConfiguration(void);
void roll_pitch_calc(float[], float*, float*);
void RollPitchLEDs (float, float);
float compute_mean_5_value_float(float[]);
void TripleBufferShifter (float*, float*, float*, uint8_t);




#endif /* LIBRARY_LABARCH_H_ */
