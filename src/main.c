/**
  ******************************************************************************
  * @file    main.c
  * @authors  Balandi L., Cenerini S., Nanni L., Soffritti F.
  * @version V 666
  * @date    8-Jun-2020
  * @brief   Final Assignment
  ******************************************************************************
*/

					/*______________________________________________*/
					/*					Includes					*/
					/*______________________________________________*/
#include "stm32f4xx.h"
#include "stm32f4_discovery.h"
#include "stm32f4_discovery_lis3dsh.h"

#include <stdio.h>
//#include <math.h>	//Già inclusa nella librearia arm_math.h

#include "arm_math.h"
#include "math_helper.h"
#include "noarm_cmsis.h"

#include "Library_LabArch.h"


					/*______________________________________________*/
					/*				Declarations					*/
					/*______________________________________________*/
/*------ Global variables  -----------*/
volatile uint16_t CCR1_Val = Counter_for_ReadyToRead;		//100 Hz
volatile uint16_t CCR2_Val = Counter_for_DataStreaming;		//5 Hz
volatile uint16_t CCR3_Val = Counter_for_ResultStreaming;	//20 Hz
u8 streamActive = 0;	// Se 1 Strem Attivo
u8 streamData = 0;		// 0-> Result Streaming	; 1-> Data Streaming
u8 dataReady = 0;		// Scandito dai Timer comandati dagli dallo StremData
u8 readyToread=0;		// Scandisce il campionamento dell'accelerometro
u8 dataReceived = 0;	// 1 se ha ricevuto un dato dalla UART
u8 chRX = 0;			// Char ricevuto dall UART


/*------ FIR - Global variables  -----------*/
//Declare State buffer of size (numTaps + blockSize - 1)
static float32_t firStateF32_X[BLOCK_SIZE + NUM_TAPS - 1];
static float32_t firStateF32_Y[BLOCK_SIZE + NUM_TAPS - 1];
static float32_t firStateF32_Z[BLOCK_SIZE + NUM_TAPS - 1];

// Coefficienti del filtro FIR calcolati con MATLAB
const float32_t firCoeffs32[NUM_TAPS] =
{   0.0120f,    0.0326f,    0.0888f,    0.1590f,    0.2076f,
    0.2076f,    0.1590f,    0.0888f,    0.0326f,    0.0120f };





					/*______________________________________________*/
					/*						MAIN					*/
					/*______________________________________________*/
int main(void)
{
	/*------ Local variables -----------*/
	int16_t accData[3] = {0, 0, 0};						// Data acquisiti dall'accelerometro assi {X, Y, Z}
	float32_t accData_filtered[3] = {0.0, 0.0, 0.0};	// Dati in uscita dal filtro FIR assi {X, Y, Z}
	float roll = 0.0, pitch = 0.0;						// Angoli calcolati dai dati filtrati

	float Mean_roll = 0.0, Mean_pitch = 0.0;			// Media su una finestra di 5 angoli
	float Buffer_roll[5] = {0.0, 0.0, 0.0, 0.0, 0.0};	// Buffer per calcolare la media
	float Buffer_pitch[5] = {0.0, 0.0, 0.0, 0.0, 0.0};
	uint8_t Pointer_mean = 0;				// Indice per aggiornare i buffer della media

	/*------ Local variables for FIR  -----------*/
	arm_fir_instance_f32 S_X;	// Variabile di iniziallizzazione del filtro sull'asse X
	arm_fir_instance_f32 S_Y;	// Variabile di iniziallizzazione del filtro sull'asse Y
	arm_fir_instance_f32 S_Z;	// Variabile di iniziallizzazione del filtro sull'asse Z

	// Buffer d'igresso al filtro FIR
	float32_t accData_X_InPut [NUM_TAPS];
	float32_t accData_Y_InPut [NUM_TAPS];
	float32_t accData_Z_InPut [NUM_TAPS];
	// Initialize buffers to zero
	memset(accData_X_InPut, 0, NUM_TAPS * sizeof(float32_t));
	memset(accData_Y_InPut, 0, NUM_TAPS * sizeof(float32_t));
	memset(accData_Z_InPut, 0, NUM_TAPS * sizeof(float32_t));


	/* LED initialization */
    STM_EVAL_LEDInit(LED3);		// Orange
    STM_EVAL_LEDInit(LED4);		// Green
    STM_EVAL_LEDInit(LED5);		// Red
    STM_EVAL_LEDInit(LED6);		// Blue

    STM_EVAL_LEDOff(LED3);	// Orange
	STM_EVAL_LEDOff(LED5);	// Red
	STM_EVAL_LEDOff(LED6);	// Blue
    STM_EVAL_LEDOn(LED4);	// Green: initialization


    /* USART configuration */
	USART_Config();

	/* Initialize LIS3DSH MEMS Accelerometer */
	Acc_Config();

	/* TIM3 Configuration */
	TimerConfiguration();

	/* Call FIR init function to initialize the instance structure. */
	arm_fir_init_f32(&S_X, NUM_TAPS, (float32_t *)&firCoeffs32[0], &firStateF32_X[0], BLOCK_SIZE);
	arm_fir_init_f32(&S_Y, NUM_TAPS, (float32_t *)&firCoeffs32[0], &firStateF32_Y[0], BLOCK_SIZE);
	arm_fir_init_f32(&S_Z, NUM_TAPS, (float32_t *)&firCoeffs32[0], &firStateF32_Z[0], BLOCK_SIZE);

	/* Hello world Program */
	printf(" ------------------------------------------------------\r\n");
	printf(" Welcome in Group 15 program\r\n");
	printf(" Type s to start/stop streaming\r\n");
	printf(" Type d to toggle streaming\r\n");
	printf(" Type i for info about the program\r\n");


					/*______________________________________________*/
					/*						While(1)				*/
					/*______________________________________________*/
	while (1)
	{

		/*======== Ricezione Carattere da UART ========*/
		if (dataReceived == 1)	// Attivato dall'interrupt del UART
		{
			switch(chRX) {

			case 's':
				//Abilita/disabilita stream
				streamActive = 1 - streamActive;
				if (streamActive==1)
				printf("\nStream ON\r\n");
				else printf("\nStream OFF\r\n");
	       		// se lo stream è disattivato tutti i led sono OFF
	    		STM_EVAL_LEDOff(LED3);	// Orange
	    		STM_EVAL_LEDOff(LED5);	// Red
	    		STM_EVAL_LEDOff(LED6);	// Blue
	    		STM_EVAL_LEDOff(LED4);  // Green
			break;

			case'd':
				//toggle stream data / result data
				streamData=1-streamData;
				if (streamData==1)
				printf("\nData Streaming at 5Hz:\r\n");
				else printf("\nResult Streaming at 20Hz:\r\n");
			break;

			case'i':
				printf("\n@authors  Balandi L., Cenerini S., Nanni L., Soffritti F.\r\n");
				printf("@version  V 666\r\n");
				printf("@date     8-Jun-2020\r\n");
				printf("@brief    Final Assignment\r\n");
				break;

			default:
				//Se ricevo un comando errato invio un avviso
				printf(" %c <-- Wrong command\r\n", chRX);
			break;

			}
			dataReceived = 0;	// Clear flag
		}



					/*======== Acquisizione ed elaborazione dati ========*/
		//Leggo i valori dell'accelerometro a 100Hz, anche quando lo stream è disabilitato
		if(readyToread)
		{

				/*--- Lettura dati accelerometro ---*/	/* cyc[1] = 5066	--> Time = 30 microS */	/*Optimization O-2	==> cyc[1] = 2802	--> Time = 17 microS */
			LIS3DSH_ReadACC(accData);


				/*--- Buffer - Filtro FIR ---*/         /* cyc[1] = 579	--> Time = 3.4 microS */	/*Optimization O-2	==> cyc[1] = 212	--> Time = 1.3 microS */
			TripleBufferShifter (accData_X_InPut, accData_Y_InPut, accData_Z_InPut, NUM_TAPS);

			/*--- Salvataggio nuovi dati con calibrazione accelerometro ---*/
			accData_X_InPut[0] = ((float)(accData[0]-Acc_Offset_int)/Acc_Gain_f);
			accData_Y_InPut[0] = ((float)(accData[1]-Acc_Offset_int)/Acc_Gain_f);
			accData_Z_InPut[0] = ((float)(accData[2]-Acc_Offset_int)/Acc_Gain_f);

			/* N.B.
			 * Ossarvando la funzione "arm_fir_f32", se il parametro di ingresso Block_Size ha dimensione 1
			 * non viene eseguito il primo While ma direttamente l'ultimo in quanto la dimensione < 8.
			 * Si evidenzia che il *pSrc verrà utilizzato solo per campionare il primo dato dell'array di ingresso.
			 * Pertanto se la chiamata a funzione fosse modificata nel seguente modo non si otterrebero differenze
			 * nel risultato d'uscita.

			//			float32_t accData_prova[3] = {0.0, 0.0, 0.0};

			//				accData_prova[0] = (float)accData[0];
			//				accData_prova[1] = (float)accData[1];
			//				accData_prova[2] = (float)accData[2];
			//				arm_fir_f32(&S_X, &accData_prova[0], &accData_filtered[0], BLOCK_SIZE);
			//				arm_fir_f32(&S_Y, &accData_prova[1], &accData_filtered[1], BLOCK_SIZE);
			//				arm_fir_f32(&S_Z, &accData_prova[2], &accData_filtered[2], BLOCK_SIZE);

			 * E' stato scelto di non implementare questa modifica poichè:
			 * Durante la lezione di teoria del filtro FIR è stato specificato che il numero dei parametri di ingresso (n)
			 * Deve essere uguale al numero dei coefficenti (n)
			 */


				/*--- Filtro FIR ---*/				/* cyc[1] = 5065	--> Time = 30 microS */	/*Optimization O-2	==> cyc[1] = 872	--> Time = 5 microS */
			arm_fir_f32(&S_X, &accData_X_InPut[0], &accData_filtered[0], BLOCK_SIZE);
			arm_fir_f32(&S_Y, &accData_Y_InPut[0], &accData_filtered[1], BLOCK_SIZE);
			arm_fir_f32(&S_Z, &accData_Z_InPut[0], &accData_filtered[2], BLOCK_SIZE);


				/*--- Calcolo dagli angoli ---*/	/* cyc[1] = 7774	--> Time = 46 microS */	/*Optimization O-2	==> cyc[1] = 7703	--> Time = 46 microS */
			roll_pitch_calc(accData_filtered, &roll, &pitch);


				/*--- Calcolo della media ---*/		/* cyc[1] = 8610	--> Time = 51 microS */	/*Optimization O-2	==> cyc[1] = 888	--> Time = 5 microS */
			Buffer_pitch[Pointer_mean] = pitch;						//Riempo il Buffer per il calcolo della media
			Buffer_roll[Pointer_mean]  = roll;
			Mean_pitch = compute_mean_5_value_float(Buffer_pitch);	//Calcolo la media dei 5 valori presenti nel buffer
			Mean_roll  = compute_mean_5_value_float(Buffer_roll);
			Pointer_mean = (Pointer_mean+1)%5;						//Quando il Pointer_mean arriva a 5 torna a 0

			readyToread=0;	// Clear flag

		}


			/*========  Controllo dello Stream Dati attraverso UART ========*/
		if (streamActive == 1)
		{
			/*--- Accensione LED in funzione degli angoli---*/
			RollPitchLEDs (Mean_roll, Mean_pitch);

			if ((dataReady))
			{
				if (streamData==1)	// Data Streaming a 5Hz
					printf("X: %7.1f\t Y: %7.1f\t Z: %7.1f\r\n", accData_filtered[0], accData_filtered[1], accData_filtered[2]);
				else if (streamData==0) // Result Streaming	a 20Hz
					printf("roll: %6.1f\t pitch: %6.1f\r\n", Mean_roll, Mean_pitch);
				    // abbiamo usato questa formattazione per le printf per evitare problemi di tabulazione nel terminale
				    // %7.1f --> vengono stampati almeno 7 caratteri con una cifra decimale di un dato float
				dataReady = 0;	// Clear flag
			}
		 }
   } // fine while(1)
} // fine main


			/*********** Tempi di esecuzione  ****************/
/* Inizialitaition:	Optimization O-2	==> cyc[1] = 2283000	--> Time = 13.5 milliS */
/* Ready to read: 	Optimization O-2	==> cyc[1] = 13000	    --> Time = 77 microS */



						/*______________________________________*/
						/*				 Functions				*/
						/*______________________________________*/

/*********** Configuration  ****************/
void USART_Config(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	USART_InitTypeDef USART_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;

	/* Enable GPIO clock */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	/* Enable UART clock */
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

	/* Connect PXx to USARTx_Tx*/
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_USART2);

	/* Connect PXx to USARTx_Rx*/
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_USART2);

	/* Configure USART Tx as alternate function  */
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	/* Configure USART Rx as alternate function  */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	/* Configure the USART2 Interrupt */
	NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x01;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x01;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	/* Enable the RX Interrupt */
	USART_ITConfig(USART2, USART_IT_RXNE, ENABLE);

	/* USARTx configured as follows: Code: 115200-8-N-1
		- BaudRate = 115200 baud
		- Word Length = 8 Bits
		- One Stop Bit
		- No parity
		- Hardware flow control disabled (RTS and CTS signals)
		- Receive and transmit enabled
	*/
	USART_InitStructure.USART_BaudRate = 115200;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

	/* USART initialization */
	USART_Init(USART2, &USART_InitStructure);

	/* Enable USART */
	USART_Cmd(USART2, ENABLE);

}

/**
  * @brief  This function initializes the SPI and the LIS3DSH Accelerometer.
  * @param  None
  * @retval None
  */
void Acc_Config(void)
{
	LIS3DSH_InitTypeDef AccInitStruct;

	AccInitStruct.Output_DataRate = LIS3DSH_DATARATE_100;
	AccInitStruct.Axes_Enable = LIS3DSH_XYZ_ENABLE;
	AccInitStruct.SPI_Wire = LIS3DSH_SERIALINTERFACE_4WIRE;
	AccInitStruct.Self_Test = LIS3DSH_SELFTEST_NORMAL;
	AccInitStruct.Full_Scale = LIS3DSH_FULLSCALE_2;
//	AccInitStruct.Filter_BW = LIS3DSH_FILTER_BW_800;
	AccInitStruct.Filter_BW = LIS3DSH_FILTER_BW_40;	//Non incide molto perchè tanto abbiamo il FIR a 5Hz

	LIS3DSH_Init(&AccInitStruct);

}

/**
  * @brief  Configure the TIM3 TIMER.
  * @param  None
  * @retval None
  */
void TimerConfiguration(void)
{
	uint16_t PrescalerValue = 0;
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	TIM_OCInitTypeDef  TIM_OCInitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;

	/* TIM3 clock enable */
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);

	/* Time base configuration */
	TIM_TimeBaseStructure.TIM_Period = 65535;
	TIM_TimeBaseStructure.TIM_Prescaler = 0;
	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);

	/* Prescaler configuration */
	PrescalerValue = (uint16_t) ((SystemCoreClock / 2) / TIM3_CK_CNT) - 1;
	TIM_PrescalerConfig(TIM3, PrescalerValue, TIM_PSCReloadMode_Immediate);

	/* Output Compare Timing Mode configuration: Channel1 */
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR1_Val;
	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
	TIM_OC1Init(TIM3, &TIM_OCInitStructure);
	TIM_OC1PreloadConfig(TIM3, TIM_OCPreload_Disable);

	/* Output Compare Timing Mode configuration: Channel2 */
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR2_Val;
	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
	TIM_OC2Init(TIM3, &TIM_OCInitStructure);
	TIM_OC2PreloadConfig(TIM3, TIM_OCPreload_Disable);

	/* Output Compare Timing Mode configuration: Channel3 */
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Timing;
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_Pulse = CCR3_Val;
	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
	TIM_OC3Init(TIM3, &TIM_OCInitStructure);
	TIM_OC3PreloadConfig(TIM3, TIM_OCPreload_Disable);

	/* Configure the TIM3 gloabal Interrupt */
	NVIC_InitStructure.NVIC_IRQChannel = TIM3_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	/* TIM Interrupts enable */
	TIM_ITConfig(TIM3, TIM_IT_CC1, ENABLE);
	TIM_ITConfig(TIM3, TIM_IT_CC2, ENABLE);
	TIM_ITConfig(TIM3, TIM_IT_CC3, ENABLE);

	/* TIM3 counter enable */
	TIM_Cmd(TIM3, ENABLE);
}


/*********** IRQ Handlers   ****************/
/**
  * @brief  This function handles TIM3 global interrupt request.
  * @param  None
  * @retval None
  */
void TIM3_IRQHandler(void)
{
	uint16_t capture = 0;

	if (TIM_GetITStatus(TIM3, TIM_IT_CC1) != RESET)
	{
		TIM_ClearITPendingBit(TIM3, TIM_IT_CC1);

		readyToread=1;

		/* Update CH1 OCR */
		capture = TIM_GetCapture1(TIM3);
		TIM_SetCompare1(TIM3, capture + CCR1_Val);
	}


	if (TIM_GetITStatus(TIM3, TIM_IT_CC2) != RESET)
	{
		TIM_ClearITPendingBit(TIM3, TIM_IT_CC2);

		if(streamData) dataReady=1;

		/* Update CH1 OCR */
		capture = TIM_GetCapture2(TIM3);
		TIM_SetCompare2(TIM3, capture + CCR2_Val);
	}


	if (TIM_GetITStatus(TIM3, TIM_IT_CC3) != RESET)
	{
		TIM_ClearITPendingBit(TIM3, TIM_IT_CC3);

		if(streamData==0) dataReady=1;

		/* Update CH1 OCR */
		capture = TIM_GetCapture3(TIM3);
		TIM_SetCompare3(TIM3, capture + CCR3_Val);
	}
}


/*********** UART Handlers   ****************/
void USART2_IRQHandler(void)
{
	/* RX interrupt */
	if(USART_GetITStatus(USART2, USART_IT_RXNE) != RESET)
	{
		chRX = USART_ReceiveData(USART2);
		dataReceived = 1;
	}
}


/*********** printf define   ****************/
/**
  * @brief  Retargets the C library printf function to the USART.
  * @param  None
  * @retval None
  */
int __io_putchar(int ch)
{
  /* Place your implementation of fputc here */
  /* e.g. write a character to the USART */
  USART_SendData(USART2, (uint8_t)ch);

  /* Loop until the end of transmission */
  while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET)
  {}

  return ch;
}





