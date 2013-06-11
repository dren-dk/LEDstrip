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




int main(void) {
  wdt_enable(WDTO_4S);
  DDRD  |= _BV(PD4);  // LED output
  led(1);

  DDRD |= _BV(PD3);
  DDRD |= _BV(PD5);
  DDRD |= _BV(PD6);
  DDRB |= _BV(PB1);
  DDRB |= _BV(PB2);

  //  initADC();
  muartInit();

  mprintf(PSTR("Power up\n"));

  DDRD  |= _BV(PD3);  // OC2B

  // Set up timer 0 for fast PWM mode & the highest frequency available
  TCCR0A = _BV(COM0A1) | _BV(COM0B1) | _BV(COM0B0) |  _BV(WGM00) |  _BV(WGM01);
  TCCR0B = _BV(CS00);
  DDRD  |= _BV(PD6);  // OC0A
  DDRD  |= _BV(PD5);  // OC0A

  // Set up timer 1 for fast PWM mode & the highest frequency available
  TCCR1A = _BV(COM1A1) | _BV(COM1B1) | _BV(COM1B0) | _BV(WGM10);
  TCCR1B = _BV(WGM12) | _BV(CS10);
  DDRB  |= _BV(PB1);  // OC1A
  DDRB  |= _BV(PB2);  // OC1A

  OCR0A = 50;
  OCR0B = 254; // White
  OCR1A = 0;
  OCR1B = 0;


  i2c_init();
  pca9685_init(0x80, PCA9685_FREQUENCY(1200UL));
  

  unsigned char frame = 0;
  while (1) {
    //mprintf(PSTR("F\n"));
    led(frame++ & 15);
    _delay_ms(10);
    wdt_reset();

    pca9685_led_pwm(0x80, 0, frame);
    pca9685_led_pwm(0x80, 1, 128-frame);
    pca9685_led_pwm(0x80, 2, 255-frame);
  }
}
