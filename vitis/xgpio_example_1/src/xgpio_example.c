/******************************************************************************
* Copyright (C) 2002 - 2020 Xilinx, Inc.  All rights reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
* @file xgpio_example.c
*
* This file contains a design example using the AXI GPIO driver (XGpio) and
* hardware device.  It only uses channel 1 of a GPIO device and assumes that
* the bit 0 of the GPIO is connected to the LED on the HW board.
*
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.00a rmm  03/13/02 First release
* 1.00a rpm  08/04/03 Removed second example and invalid macro calls
* 2.00a jhl  12/15/03 Added support for dual channels
* 2.00a sv   04/20/05 Minor changes to comply to Doxygen and coding guidelines
* 3.00a ktn  11/20/09 Minor changes as per coding guidelines.
* 4.1   lks  11/18/15 Updated to use canonical xparameters and
*		      clean up of the comments and code for CR 900381
* 4.3   sk   09/29/16 Modified the example to make it work when LED_bits are
*                     configured as an output. CR# 958644
*       ms   01/23/17 Added xil_printf statement in main function to
*                     ensure that "Successfully ran" and "Failed" strings
*                     are available in all examples. This is a fix for
*                     CR-965028.
* 4.5  sne   06/12/19 Fixed IAR compiler warning.
*
* </pre>
******************************************************************************/

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"


/************************** Constant Definitions *****************************/

#define LED 0x01   /* Assumes bit 0 of GPIO is connected to an LED  */

#define LED1 LED
#define LED2 0x02
#define LED3 0x03
#define LED4 0x04
/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define GPIO_EXAMPLE_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID

#define INPUT GPIO_EXAMPLE_DEVICE_ID
#define OUTPUT 1

/*
 * The following constant is used to wait after an LED is turned on to make
 * sure that it is visible to the human eye.  This constant might need to be
 * tuned for faster or slower processor speeds.
 */
#define LED_DELAY     10000000

/*
 * The following constant is used to determine which channel of the GPIO is
 * used for the LED if there are 2 channels supported.
 */
#define LED_CHANNEL 1

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/

#ifdef PRE_2_00A_APPLICATION

/*
 * The following macros are provided to allow an application to compile that
 * uses an older version of the driver (pre 2.00a) which did not have a channel
 * parameter. Note that the channel parameter is fixed as channel 1.
 */
#define XGpio_SetDataDirection(InstancePtr, DirectionMask) \
        XGpio_SetDataDirection(InstancePtr, LED_CHANNEL, DirectionMask)

#define XGpio_DiscreteRead(InstancePtr) \
        XGpio_DiscreteRead(InstancePtr, LED_CHANNEL)

#define XGpio_DiscreteWrite(InstancePtr, Mask) \
        XGpio_DiscreteWrite(InstancePtr, LED_CHANNEL, Mask)

#define XGpio_DiscreteSet(InstancePtr, Mask) \
        XGpio_DiscreteSet(InstancePtr, LED_CHANNEL, Mask)

#endif

/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/

/*
 * The following are declared globally so they are zeroed and so they are
 * easily accessible from a debugger
 */

XGpio Gpio; /* The Instance of the GPIO Driver */
XGpio Gpio2;
/*****************************************************************************/
/**
*
* The purpose of this function is to illustrate how to use the GPIO
* driver to turn on and off an LED.
*
* @param	None
*
* @return	XST_FAILURE to indicate that the GPIO Initialization had
*		failed.
*
* @note		This function will not return if the test is running.
*
******************************************************************************/

int main(void)
{

	volatile int Delay;
	xil_printf("inicio!!!");
	/* Initialize the GPIO driver */
	int Status = XGpio_Initialize(&Gpio, INPUT);
	XGpio_Initialize(&Gpio2, OUTPUT);
	if (Status != XST_SUCCESS) {
		xil_printf("Gpio Initialization Failed\r\n");
		return XST_FAILURE;
	}

	/* Set the direction for all signals as inputs except the LED output */
	XGpio_SetDataDirection(&Gpio, LED_CHANNEL, ~0x00);

	/* Loop forever blinking the LED */

	while (1) {
		/* **************************************
		 * INPUT EXTERNO
		 * ************************************** */
		u32 a1 = 1;//00001
		u32 a2 = 2;//00010
		u32 a4 = 4;//00100
		u32 a8 = 8;//01000
		u32 button_1 = a1 & XGpio_DiscreteRead(&Gpio2, 1);
		u32 button_2 = a2 & XGpio_DiscreteRead(&Gpio2, 1);
		u32 button_3 = a4 & XGpio_DiscreteRead(&Gpio2, 1);
		u32 button_4 = a8 & XGpio_DiscreteRead(&Gpio2, 1);
		/* **************************************
		 * CARGA DE DATOS EN MEMORIA
		 * ************************************** */
		u32 memoria[4];
		if(button_1==a1)memoria[0]=123; else memoria[0]=1;
		if(button_2==a2)memoria[1]=6;  else  memoria[1]=1;
		if(button_3==a4)memoria[2]=10; else  memoria[2]=1;
		if(button_4==a8)memoria[3]=55; else  memoria[3]=1;
		for(int i = 0; i<4; i++){
			xil_printf("%d) %d\t",i,(int)memoria[i]);
		}

		/* **************************************
		 * ALIMENTANDO RED NEURONAL. PRIMERO DIRECCION Y LUEGO DATO.
		 * ************************************** */
		Xil_Out32(0x43C00004, (u32)1);
		Xil_Out32(0x43C00000, memoria[0]);

		Xil_Out32(0x43C00004, (u32)2);
		Xil_Out32(0x43C00000, memoria[1]);

		Xil_Out32(0x43C00004, (u32)3);
		Xil_Out32(0x43C00000, memoria[2]);

		Xil_Out32(0x43C00004, (u32)4);
		Xil_Out32(0x43C00000, memoria[3]);

		xil_printf("resultado %d\r\n", (int)Xil_In32(0x43C0000C));

		for (Delay = 0; Delay < LED_DELAY; Delay++);
		//u32 botton1 = XGpio_DiscreteRead(&Gpio2, 1);
		//xil_printf("botton %x\r\n",botton1);

		/*
		if(botton1==1){
			XGpio_DiscreteWrite(&Gpio, LED_CHANNEL, LED1);
		}
		else{
			XGpio_DiscreteClear(&Gpio, LED_CHANNEL, LED1);
		}
		*/
	}

}
