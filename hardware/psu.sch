EESchema Schematic File Version 2  date Sun 24 Feb 2013 10:43:36 PM CET
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:contrib
LIBS:valves
LIBS:pca9685
LIBS:irlts6242
LIBS:atmega328p-a
LIBS:atmel
LIBS:ledctrl-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 2 2
Title ""
Date "24 feb 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6100 2500 0    20   ~ 0
Distributed decoupling caps
Connection ~ 6300 3000
Wire Wire Line
	6700 3000 4250 3000
Connection ~ 6300 2600
Wire Wire Line
	2200 3300 2200 3450
Connection ~ 2200 3450
Wire Wire Line
	1250 1450 1250 1700
Wire Wire Line
	1250 2150 1550 2150
Wire Wire Line
	3050 2050 3050 1650
Connection ~ 1250 1650
Connection ~ 1550 2150
Wire Wire Line
	1550 2150 1550 2100
Connection ~ 5050 2600
Connection ~ 4250 2600
Wire Wire Line
	3900 2600 4350 2600
Connection ~ 3900 2750
Wire Wire Line
	3900 2850 3900 2750
Wire Wire Line
	3900 3450 3900 3350
Connection ~ 3050 2000
Wire Wire Line
	2900 2000 3050 2000
Connection ~ 3900 2350
Wire Wire Line
	3900 2450 3900 1750
Wire Wire Line
	2200 2400 2200 1750
Wire Wire Line
	2200 1750 3900 1750
Wire Wire Line
	2400 2000 2200 2000
Connection ~ 2200 2000
Wire Wire Line
	2200 2900 2200 2700
Wire Wire Line
	3900 2750 4100 2750
Wire Wire Line
	4100 2750 4100 2300
Connection ~ 5350 2600
Connection ~ 5050 3000
Connection ~ 5350 3000
Connection ~ 1250 2150
Wire Wire Line
	1550 1650 1550 1700
Connection ~ 1550 1650
Wire Wire Line
	3050 1650 1250 1650
Wire Wire Line
	3050 3550 3050 3050
Connection ~ 3050 3450
Wire Wire Line
	4250 3000 4250 3450
Connection ~ 3900 3450
Wire Wire Line
	4600 2300 5050 2300
Wire Wire Line
	5050 2300 5050 2600
Connection ~ 2200 1650
Wire Wire Line
	1250 2100 1250 3450
Wire Wire Line
	1250 3450 4250 3450
Connection ~ 2200 1650
Wire Wire Line
	4950 2600 6700 2600
Connection ~ 5900 2600
Connection ~ 5900 3000
$Comp
L C C3
U 1 1 51290E89
P 6700 2800
F 0 "C3" H 6750 2900 50  0000 L CNN
F 1 "100nF" H 6750 2700 50  0000 L CNN
	1    6700 2800
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 51290E84
P 6300 2800
F 0 "C2" H 6350 2900 50  0000 L CNN
F 1 "100nF" H 6350 2700 50  0000 L CNN
	1    6300 2800
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 51290E7C
P 5900 2800
F 0 "C1" H 5950 2900 50  0000 L CNN
F 1 "100nF" H 5950 2700 50  0000 L CNN
	1    5900 2800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR063
U 1 1 51290E72
P 5350 2600
F 0 "#PWR063" H 5350 2560 30  0001 C CNN
F 1 "+3.3V" H 5350 2710 30  0000 C CNN
	1    5350 2600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR064
U 1 1 51290E68
P 1250 1450
F 0 "#PWR064" H 1250 1400 20  0001 C CNN
F 1 "+12V" H 1250 1550 30  0000 C CNN
	1    1250 1450
	1    0    0    -1  
$EndComp
Text Label 3200 1750 0    60   ~ 0
in
Text Label 4150 2600 0    60   ~ 0
sw
$Comp
L GND #PWR010
U 1 1 4FDA284E
P 3050 3550
AR Path="/4FDA26EB/4FDA284E" Ref="#PWR010"  Part="1" 
AR Path="/4FDA311D/4FDA284E" Ref="#PWR02"  Part="1" 
AR Path="/4FDA310B/4FDA284E" Ref="#PWR04"  Part="1" 
AR Path="/4FDA30F5/4FDA284E" Ref="#PWR06"  Part="1" 
AR Path="/4FDA30E3/4FDA284E" Ref="#PWR08"  Part="1" 
AR Path="/51290DEE/4FDA284E" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 3050 3550 30  0001 C CNN
F 1 "GND" H 3050 3480 30  0001 C CNN
	1    3050 3550
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C22
U 1 1 4EB549F2
P 1550 1900
AR Path="/4FDA26EB/4EB549F2" Ref="C22"  Part="1" 
AR Path="/4FDA311D/4EB549F2" Ref="C2"  Part="1" 
AR Path="/4FDA310B/4EB549F2" Ref="C7"  Part="1" 
AR Path="/4FDA30F5/4EB549F2" Ref="C12"  Part="1" 
AR Path="/4FDA30E3/4EB549F2" Ref="C17"  Part="1" 
AR Path="/51290DEE/4EB549F2" Ref="C22"  Part="1" 
F 0 "C22" H 1500 2250 50  0000 L CNN
F 1 "220uF/35V" H 1400 1550 50  0000 L CNN
	1    1550 1900
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 4EB5492E
P 1250 1900
AR Path="/4FDA26EB/4EB5492E" Ref="C21"  Part="1" 
AR Path="/4FDA311D/4EB5492E" Ref="C1"  Part="1" 
AR Path="/4FDA310B/4EB5492E" Ref="C6"  Part="1" 
AR Path="/4FDA30F5/4EB5492E" Ref="C11"  Part="1" 
AR Path="/4FDA30E3/4EB5492E" Ref="C16"  Part="1" 
AR Path="/51290DEE/4EB5492E" Ref="C21"  Part="1" 
F 0 "C21" H 1100 2000 50  0000 L CNN
F 1 "10uF/35V" H 850 1800 50  0000 L CNN
	1    1250 1900
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 4D04D22A
P 5350 2800
AR Path="/4FDA26EB/4D04D22A" Ref="C24"  Part="1" 
AR Path="/4FDA311D/4D04D22A" Ref="C4"  Part="1" 
AR Path="/4FDA310B/4D04D22A" Ref="C9"  Part="1" 
AR Path="/4FDA30F5/4D04D22A" Ref="C14"  Part="1" 
AR Path="/4FDA30E3/4D04D22A" Ref="C19"  Part="1" 
AR Path="/51290DEE/4D04D22A" Ref="C24"  Part="1" 
F 0 "C24" H 5400 2900 50  0000 L CNN
F 1 "4.7uF/16V" H 5400 2700 50  0000 L CNN
	1    5350 2800
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C23
U 1 1 4D04D0AE
P 5050 2800
AR Path="/4FDA26EB/4D04D0AE" Ref="C23"  Part="1" 
AR Path="/4FDA311D/4D04D0AE" Ref="C3"  Part="1" 
AR Path="/4FDA310B/4D04D0AE" Ref="C8"  Part="1" 
AR Path="/4FDA30F5/4D04D0AE" Ref="C13"  Part="1" 
AR Path="/4FDA30E3/4D04D0AE" Ref="C18"  Part="1" 
AR Path="/51290DEE/4D04D0AE" Ref="C23"  Part="1" 
F 0 "C23" H 5100 2900 50  0000 L CNN
F 1 "220uF/35V" H 4900 2500 50  0000 L CNN
	1    5050 2800
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L5
U 1 1 4D04CFE3
P 4650 2600
AR Path="/4FDA26EB/4D04CFE3" Ref="L5"  Part="1" 
AR Path="/4FDA311D/4D04CFE3" Ref="L1"  Part="1" 
AR Path="/4FDA310B/4D04CFE3" Ref="L2"  Part="1" 
AR Path="/4FDA30F5/4D04CFE3" Ref="L3"  Part="1" 
AR Path="/4FDA30E3/4D04CFE3" Ref="L4"  Part="1" 
AR Path="/51290DEE/4D04CFE3" Ref="L5"  Part="1" 
F 0 "L5" V 4600 2600 40  0000 C CNN
F 1 "330uH" V 4750 2600 40  0000 C CNN
	1    4650 2600
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D5
U 1 1 4D04CF74
P 4250 2800
AR Path="/4FDA26EB/4D04CF74" Ref="D5"  Part="1" 
AR Path="/4FDA311D/4D04CF74" Ref="D1"  Part="1" 
AR Path="/4FDA310B/4D04CF74" Ref="D2"  Part="1" 
AR Path="/4FDA30F5/4D04CF74" Ref="D3"  Part="1" 
AR Path="/4FDA30E3/4D04CF74" Ref="D4"  Part="1" 
AR Path="/51290DEE/4D04CF74" Ref="D5"  Part="1" 
F 0 "D5" H 4250 2900 40  0000 C CNN
F 1 "SK 34" H 4250 2700 40  0000 C CNN
	1    4250 2800
	0    -1   -1   0   
$EndComp
$Comp
L C C25
U 1 1 4D04CF13
P 2200 3100
AR Path="/4FDA26EB/4D04CF13" Ref="C25"  Part="1" 
AR Path="/4FDA311D/4D04CF13" Ref="C5"  Part="1" 
AR Path="/4FDA310B/4D04CF13" Ref="C10"  Part="1" 
AR Path="/4FDA30F5/4D04CF13" Ref="C15"  Part="1" 
AR Path="/4FDA30E3/4D04CF13" Ref="C20"  Part="1" 
AR Path="/51290DEE/4D04CF13" Ref="C25"  Part="1" 
F 0 "C25" H 2250 3200 50  0000 L CNN
F 1 "82pF" H 2250 3000 50  0000 L CNN
	1    2200 3100
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 4D04CED4
P 4350 2300
AR Path="/4FDA26EB/4D04CED4" Ref="R14"  Part="1" 
AR Path="/4FDA311D/4D04CED4" Ref="R2"  Part="1" 
AR Path="/4FDA310B/4D04CED4" Ref="R5"  Part="1" 
AR Path="/4FDA30F5/4D04CED4" Ref="R8"  Part="1" 
AR Path="/4FDA30E3/4D04CED4" Ref="R11"  Part="1" 
AR Path="/51290DEE/4D04CED4" Ref="R14"  Part="1" 
F 0 "R14" V 4430 2300 50  0000 C CNN
F 1 "18k" V 4350 2300 50  0000 C CNN
	1    4350 2300
	0    1    1    0   
$EndComp
$Comp
L R R15
U 1 1 4D04CEB9
P 3900 3100
AR Path="/4FDA26EB/4D04CEB9" Ref="R15"  Part="1" 
AR Path="/4FDA311D/4D04CEB9" Ref="R3"  Part="1" 
AR Path="/4FDA310B/4D04CEB9" Ref="R6"  Part="1" 
AR Path="/4FDA30F5/4D04CEB9" Ref="R9"  Part="1" 
AR Path="/4FDA30E3/4D04CEB9" Ref="R12"  Part="1" 
AR Path="/51290DEE/4D04CEB9" Ref="R15"  Part="1" 
F 0 "R15" V 3980 3100 50  0000 C CNN
F 1 "11k" V 3900 3100 50  0000 C CNN
	1    3900 3100
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 4D04CE98
P 2650 2000
AR Path="/4FDA26EB/4D04CE98" Ref="R13"  Part="1" 
AR Path="/4FDA311D/4D04CE98" Ref="R1"  Part="1" 
AR Path="/4FDA310B/4D04CE98" Ref="R4"  Part="1" 
AR Path="/4FDA30F5/4D04CE98" Ref="R7"  Part="1" 
AR Path="/4FDA30E3/4D04CE98" Ref="R10"  Part="1" 
AR Path="/51290DEE/4D04CE98" Ref="R13"  Part="1" 
F 0 "R13" V 2730 2000 50  0000 C CNN
F 1 "0R22" V 2650 2000 50  0000 C CNN
	1    2650 2000
	0    1    1    0   
$EndComp
$Comp
L MC34063 U5
U 1 1 4D04CE01
P 3050 2550
AR Path="/4FDA26EB/4D04CE01" Ref="U5"  Part="1" 
AR Path="/4FDA311D/4D04CE01" Ref="U1"  Part="1" 
AR Path="/4FDA310B/4D04CE01" Ref="U2"  Part="1" 
AR Path="/4FDA30F5/4D04CE01" Ref="U3"  Part="1" 
AR Path="/4FDA30E3/4D04CE01" Ref="U4"  Part="1" 
AR Path="/51290DEE/4D04CE01" Ref="U5"  Part="1" 
F 0 "U5" H 3200 2900 60  0000 L CNN
F 1 "MC34063" H 3150 2200 60  0000 L CNN
	1    3050 2550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
