/* Water Level Sensor System
 *  Authors: ENGR114 Student Group at Portland Community College, Summer 2017
 *  Date: 08/17/2017
 *  Version: 3.0
 *  Descripition: This program reads the analog voltage signal from the eTape 
 *  and pushes it to the IOT through a wireless device.
 *  Sources: https://github.com/ABontrager08/MATLAB-waterlevel-sensor/blob/master/water_level.ino
 *  
 *  Connect pin #2 of the eTape to ground, then pin #3 to a 550 ohm resistor.
 *  The other side of the 550 ohm resistor connects to the VCC 5v supply of the redboard.
 *  At the point of connection between pin #3 and the 550 ohm resistor add a conection to the ADC pin on the Red Board
 */
 // The value of the resistor(not the eTape)
 #define SERIESRESISTOR 550

 // Sensor pin input
 # define SENSORPIN A0

// resistance values
#define zero_depth_resistance 550 // resistance when no liquid is present.
#define max_resistance 60 // resistance when liquid is at max line.

 // sets the data rate in bits per second over the serial port
void setup(void) {
  Serial.begin(9600);
}

// body of the code that will control what the arduino does
void loop(void) {

  // create a variable to store the data pulled from the sensor
  float reading;

  // volateg reading from eTape
  reading = analogRead(SENSORPIN); // read the volatage from the pin
  reading = reading + 0.5; // helps with rounding the value stored in reading appropriatly in preperation for truncation due to casting to an int value
  reading = (int)reading; // convert to an int value to control for any erronius values in the decimals

  Serial.println(reading); // send the value recoreded to the serial port to be displayed or pulled using the computer


  delay(50); // add a 50ms delay to prevent a bus overflow and loss of data or erronious data

}

