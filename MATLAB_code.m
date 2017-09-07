%% Using MATLAB to read serial output from an Arduino in real time
% Authors: ENGR114 Student Group Spring 2017
% Revised: 09/05/17
% Version: 2.1
% Licence: Open source BSD Licence

%% Clear variables, commandline, figures and existing serial ports
clc,clear
close all
delete(instrfindall); %deletes any exhisting serial ports

%% Change 'COM4' to the port the arduino is connected to

% creates a serial port object that is associated to the serial port
% indicated
a = serial('COM4','BaudRate',9600);

% prompts the user for the number of data points they would like also used
% as the control for the following while loop
user_points = input('Please enter the number of data points you would like, between 10 and 20: ');

% while loop to check that the user makes a valid selection
 while user_points < 10 || user_points > 20
     
     % prompts the user for the number of data points they would like also
     % used as the control for the while loop
     user_points = input('Please enter the number of data points you would like, between 10 and 20: ');
     
% ends the while loop that checks the user input     
 end
 
%% Collect serial data from the arduino

% start for loop for reading data from the port and pushing that data to
% the IOT ThingSpeak
for i=1:user_points
    % open the serial port to connect to the Arduino
    fopen(a);
    
    % save read the data be pushed through the serial port from the arduino
    serial_read = fscanf(a,'%c');
    
    % cast the data from string type to double type
    serial_read = str2double(serial_read);
    
    % calculate the depth that correspnds to the data from the arduino
    serial_data = (932.59 - serial_read) / 6.5227;
    
    % close the arduino serial object
    fclose(a);

    %% Define ThingSpeak channel and write API, build web url, and send data to thing speak

    % create variable containing thing speak channel 
    thingspeak_channel = '324021';

    % create avariable containing write API
    write_API_key = 'D3B0WR7X31DFN8EW';
    
    % if statment to control for static/noise from the arduino sensor
    if serial_data >= 0 || serial_data <= 12
        
        % if statement controling for rounding and measurement error at
        % lower end of sensor
        if serial_data < 2
            
            % error correction value for measurement output
            serial_data = 1;
        
        % end if statement governing rounding controll
        end
        
        % converting the measurement data to string for upload to ThingSpeak
        data_point = int2str(serial_data); 
        
        % API for creating IOT host url
        API = 'https://api.thingspeak.com/update?api_key=';
        
        % string for url creation, contains the field 
        field_equals1 = '&field1=';
        
        % Dynamic url for uploading the data points to ThingSpeak
        url = [ API write_API_key field_equals1 data_point ];
        
        % command to communicate and push data to ThingSpeak
        webread(url)

        %% Show the user the API called and the respons
        % Author Peter Kazarinoff
        % Shows the channel that the data was pushed to
        disp(['Using ThingSpeak Channel: ', thingspeak_channel])
        
        % shows the write API key that was used to push the data
        disp(['Using Write API Key: ', write_API_key])
        
        % shows the value that was pushed to thing speak
        disp(['Using Data Point: ', data_point])
        
        % shows the complete url that was used to push the data
        disp(['Sent API request: ',url])
        
        % creates a pause to wait for the respons from ThingSpeak
        pause(1) 
        
        % shows the respons from thing speak, >0, indicates a successful push 
        disp(['\nRequest Successful! Data Saved as entry ID: ',ans])
        
        % pauses before starting the loop again, alowing for the time delay
        % between data pushes to ThingSpeak to be insync with the data
        % retrieved from the arduino
        pause(13)
    
    % end the if statement that governs static/noise from arduino sensor
    end
    
% end for statment that controls pushing data to ThingSpeak    
end


% user_choice = input('Would you like to save the figure (1 for yes/2 for no)? ')
% if user_choice == 1
%     savefig('water depth vs. time.fig')
% end
