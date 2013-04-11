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
#include "adchelper.h"


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

  //  initADC();
  muartInit();

  mprintf(PSTR("Power up\n"));

  DDRB  |= _BV(PB1);  // OC1A
  //DDRB  |= _BV(PB3);  // OC2A

  // Set up timer 1 for fast PWM mode & the highest frequency available
  TCCR1A = _BV(WGM10);
  TCCR1B = _BV(WGM12) | _BV(CS10);

  unsigned char frame = 0;
  while (1) {
    mprintf(PSTR("F\n"));
    led(frame++ & 1);
    _delay_ms(200);
    wdt_reset();
  }
}
