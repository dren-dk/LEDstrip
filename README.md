LEDstrip
========

A 16 PWM channel LED driver for dimming LED strips, like these:
https://www.adafruit.com/products/346

The outputs are 8 A open drain FETs so common anode LED strips are easy to drive,
but anything that uses 10-24 V up to 8 A per channel can be controlled.

The FETs I'm looking at are: IRLTS6342TRPBF

The 16 channels are brought out to 5 4-pin molex connectors each with 3 channels and +12 V,
so it's easy to hook up 5 RGB LED strips.

The last channel is brought out to a 2 pin connector with just +12V and the output.

To allow cheap and easy expansion the i2c bus, +3v3 and ground will be brought out to a
4 pin header and the pwm generator and power electronics will be located at one end of the
board to allow the controller, power supply and radio part to be cut off for the slave boards.

The input is a nRF24L01 radio module based on this chip:
http://www.nordicsemi.com/eng/Products/2.4GHz-RF/nRF24L01

Many cheap radio modules with various antennae are avilable on ebay:
http://www.ebay.com/sch/i.html?_trksid=p5197.m570.l1313&_nkw=nRF24L01&_sacat=0&_from=R40

PWM is farmed out to a pca9685pw IC:
http://octopart.com/partsearch#search/requestData&q=pca9685pw

The controller is an AVR of some sort, atmega88 would probably be plenty,
though I'll most likely use an ATMega168 as I have a bunch of those.
