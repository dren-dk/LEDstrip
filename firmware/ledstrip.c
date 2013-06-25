#include <ctype.h>
#include <inttypes.h>

#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include <avr/io.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>

#include <avr/wdt.h> 
#include <avr/interrupt.h>
#include <avr/eeprom.h> 
#include <avr/pgmspace.h>
#include <avr/eeprom.h> 

#include "mstdio.h"
#include "i2cmaster.h"
#include "pca9685.h"

/*  
 OC2B: PWM ~OE

 OC1A: G
 OC1B: R
 OC0A: B
 OC0B: W 

 PB0: nRF24L01+ CSN
 PD7: nRF24L01+ CE
 
 PD4: ~LED 
*/


// We don't really care about unhandled interrupts.
EMPTY_INTERRUPT(__vector_default)

void led(char on) {
  if (on) {
    PORTD &=~ _BV(PD4);   
  } else {
    PORTD |= _BV(PD4);   
  }
}

#define ON_BOARD 0x1000

void setledpwm(unsigned int channel, unsigned char value) {
 
  unsigned char ch = channel & 0xf;
  if ((channel & ON_BOARD) == ON_BOARD) {

    if (ch == 0) {

      if (value == 0) {
	TCCR1A &=~ _BV(COM1A1);      
      } else {
	OCR1A = ciel10bit(value); // Green
	TCCR1A |= _BV(COM1A1);
      }

    } else if (ch == 1) {

      if (value == 0) {
	TCCR1A &=~ _BV(COM1B1);      
      } else {
	OCR1B = ciel10bit(value); // Red
	TCCR1A |= _BV(COM1B1);
      }      

    } else if (ch == 2) {

      if (value == 0) {
	TCCR0A &=~ _BV(COM0A1);
      } else {
	OCR0A = ciel8bit(value); // Blue
	TCCR0A |= _BV(COM0A1); // OC0A clear on match
      }

    } else if (ch == 3) {

      if (value == 0) {
	TCCR0A &=~ _BV(COM0B1);
      } else {
	OCR0B = ciel8bit(value); // White
	TCCR0A |= _BV(COM0B1); // OC0B clear on match
      }

    } else if (ch == 4) {

      if (value == 0) {
	TCCR2B &=~ _BV(COM2B1);
      } else {
	OCR2B = ciel8bit(value); // Common enable
	TCCR2B |= _BV(COM2B1); // OC0B clear on match
      }
    }

  } else {
    
    unsigned char i2c = 0x80 + ((channel >> 4) << 1);

    pca9685_led_pwm(i2c, channel & 0xf, value);
  }
}

int main(void) {
  wdt_enable(WDTO_4S);
  DDRD  |= _BV(PD4);  // LED output
  led(1);

  DDRD |= _BV(PD5);
  DDRD |= _BV(PD6);
  DDRB |= _BV(PB1);
  DDRB |= _BV(PB2);

  //  initADC();
  muartInit();

  mprintf(PSTR("Power up\n"));


  // Set up timer 0 for fast PWM mode & the highest frequency available
  TCCR0A =  _BV(WGM00) |  _BV(WGM01); // Fast PWM
  TCCR0B = _BV(CS00); // Fastest clock source

  TCCR0A |= _BV(COM0A1); // OC0A clear on match
  TCCR0A |= _BV(COM0B1); // OC0B clear on match

  DDRD  |= _BV(PD6);  // OC0A
  DDRD  |= _BV(PD5);  // OC0B



  // Set up timer 1 for fast PWM mode & the highest frequency available
  TCCR1A = _BV(WGM12) | _BV(WGM11) | _BV(WGM10); // 10 bit fast pwm

  TCCR1A |= _BV(COM1A1); // OC1A clear on match
  TCCR1A |= _BV(COM1B1); // OC1B clear on match

  TCCR1B = _BV(CS10); // Fastest clock

  DDRB  |= _BV(PB1);  // OC1A
  DDRB  |= _BV(PB2);  // OC1B


  // Set up timer 2 for fast PWM mode & the highest frequency available
  TCCR2A =  _BV(WGM20) |  _BV(WGM21); // Fast PWM
  TCCR2B = _BV(CS20); // Fastest clock source

  TCCR2A |= _BV(COM2B1) | _BV(COM2B0); // OC0B clear on match

  DDRD  |= _BV(PD3);  // OC2B

  OCR0A = 0; // Blue
  OCR0B = 0; // White
  OCR1A = 0; // Green
  OCR1B = 0; // Red
  OCR2B = 255; // Common output enable

  i2c_init();
  pca9685_init(0x80, PCA9685_FREQUENCY(1200UL)); 

  setledpwm(ON_BOARD|0, 0);
  setledpwm(ON_BOARD|1, 0);
  setledpwm(ON_BOARD|2, 0);
  pca9685_led_pwm(0x80, 0, 0);
  pca9685_led_pwm(0x80, 1, 0);
  pca9685_led_pwm(0x80, 2, 0);
  
  unsigned char frame = 0;
  //unsigned char inten = 0;
  while (1) {
    //mprintf(PSTR("F\n"));
    led(frame++ & 15);
    _delay_ms(10);
    wdt_reset();
    /*
    pca9685_led_pwm(0x80, 0, frame);
    pca9685_led_pwm(0x80, 1, 128-frame);
    pca9685_led_pwm(0x80, 2, 255-frame);
    */
    setledpwm(0, 255-frame);
    setledpwm(1, frame);
    setledpwm(2, frame >> 4);

    setledpwm(ON_BOARD|0, frame);
    setledpwm(ON_BOARD|1, 255-frame);
    setledpwm(ON_BOARD|2, frame>>4);
    if (frame & 15) {
      setledpwm(ON_BOARD|3, 0);
    } else {
      setledpwm(ON_BOARD|3, 255);
    }
    //setledpwm(ON_BOARD|4, frame);
  }
}
