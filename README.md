# MATLAB-WaterLevelSensor-ThingSpeak

# MATLAB-temp-sensor
A student project for ENGR114 at Portland Community College. Uses MATLAB to read a water level sensor connected to an Arudino over serial.
The water level is then published to ThingSpeak.com.

## Problem Statement
Our group is going to build a MATLAB code to transfer a user defined operation to a corresponding Arduino code that is going to collect the data from the water level sensor, and the data is going to be transferred back to the MATLAB. The result will be uploaded to ThingSpeak for further usage.

## Hardware Setup

### Bill of Materials
|component|vendor|
|---|---|
|Arduino|[SparkFun RedBoard - Programmed with Arduino](https://www.sparkfun.com/products/13975)|
|Water Level Sensor Sensor|[12” eTape Liquid Level Sensor](https://www.adafruit.com/product/464)|
|560 kΩ resistor|[Resistor 560k Ohm 1/6th Watt PTH comes with water level sensor](https://www.adafruit.com/product/464)|
|Breadboard|[Breadboard - Self-Adhesive (White)](https://www.sparkfun.com/products/12002)|
|Jumper wires|[Jumper Wires Premium 6" M/M Pack of 10](https://www.sparkfun.com/products/8431 )|
|Mini-B USB cable|[SparkFun USB Mini-B Cable - 6 Foot](https://www.sparkfun.com/products/11301)|

### Component Connections
As shown in the pictures below, the circuit that connects the breadboard, the Arduino Red Board, and the water level sensor is a direct current. The usb cable is connected to a computer which will provide power to the circuit.
![Alt-text](/doc/connected_hardware1.jpg "Alt-title")
![Alt-text](/doc/connected_hardware2.jpg "Alt-title")

## Arduino Code

The [temp_sensor.ino](temp_sensor.ino) sketch was uploaded on the Arduino using the Arduino IDE.

## MATLAB Code

The [temp_sensor.m](temp_sensor.m) script was run in MATLAB.

## Results

![Alt-text](/doc/results.png "Alt-title")

The plot above is a sample output of our code using the temperature sensor and Arduino
board. Time is on the x-axis while temperature in degrees Fahrenheit is on the y-axis.

## Future Work
This is a great starting point for future work with the hydroponic fish-garden. This
program could be used to get baseline values for the temperature and use those values for
further changes to the conditions. If the temperature is too low a program could be written to
turn on a heater until the water reaches a certain temperature. If the temperature is too high the
same program could be used to turn off said heater. Long term monitoring could be used to find
trends that correlated to any number of factors, plant cycle, fish health, plant health, etc. Inconjunction with software from other groups this garden could be almost fully automated and
controlled remotely via a wi-fi connection.

## License
GNU General Public License v3.0
