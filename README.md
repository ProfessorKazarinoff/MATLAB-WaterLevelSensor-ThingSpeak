# MATLAB-WaterLevelSensor-ThingSpeak

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

## MATLAB Code
The [MATLAB_code.m](MATLAB_code.m) script was run in MATLAB. Ensure the ```COM Port``` is set correctly. If errors are returned after running the script a number of times try ```fclose(a); clear(a); delete(a)``` on the MATLAB command line.

At the top of the code, the ThingSpeak.com Channel Number ```ThingSpeak_channel``` and ThingSpeak.com Write API key ```Write_API_Key``` need to be defined. Fill in the values appropriate to your individual ThingSpeak Channel. The sample channel can be viewed at : https://thingspeak.com/channels/325023

```
ThingSpeak_channel = 'XXXXXX';      % Set ThingSpeak Channel
Write_API_Key = 'XXXXXXXXXXXXXXXX'; % Set Write_API_Key
```

## Arduino Code
The [Arduino_code.ino](Arduino_code.ino) sketch was uploaded on the Arduino using the Arduino IDE.


## Results
The result will give the number of data points that the user wants to collect. Once enough data points are gathered, MATLAB will upload the information to the ThingSpeak cloud.

## Future Work
Since the data points are uploaded to the cloud for multiple users to monitor the water level of the fish tank, future work could entail working in coordination with the water pump team, to generate one script managing the water flow and thus the water levels. 

## License
GNU General Public License v3.0
