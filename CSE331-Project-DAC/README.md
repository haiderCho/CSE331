<h1 align="center"> CSE331 (Microprocessor Interfacing & Embedded System): Project </h1>
<h2 align="center"> Digital Alarm clock using 8051 microcontroller
<p align="center">

</p>
</h2>

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


### Abstract

This project report details the development and implementation of a digital alarm clock using the 8051 (89c51/89c52) microcontroller. The project integrates a 16x2 LCD for display, a 4x3 keypad for user input, and a buzzer to signal the alarm. The internal timers of the 89c51 microcontroller are utilized for timekeeping, eliminating the need for an external Real-Time Clock (RTC). This report covers the project requirements, circuit diagram, and code structure, providing a comprehensive guide for understanding and replicating the project.

### Introduction

The 8051 microcontroller is a popular choice for embedded systems due to its simplicity and wide availability. This project leverages the 89c51 microcontroller to create a digital alarm clock that functions similarly to commercial digital clocks and alarms found in watches and mobile phones. The project is an extension of a digital clock project and incorporates additional features to support alarm functionality.

### Project Requirements

- **Microcontroller:** 8051 (89c51 or 89c52)
- **Alarm:** Buzzer
- **Display:** 16×2 LCD
- **Contrast Control:** Potentiometer/variable resistor
- **User Input:** 4×3 keypad (4×4 keypad can also be used)
- **Clock:** Crystal oscillator (11.0592 MHz)
- **Prototyping:** Breadboard or PCB (Printed Circuit Board)
- **Power Supply:** 5V DC

### Circuit Diagram

The circuit design is straightforward and involves connecting various peripherals to the 8051 microcontroller as follows:
- **LCD Connections**: 
  - Data pins (D0-D7) connected to Port 1 of the microcontroller.
  - Control pins (RS, RW, E) connected to P3.5, P3.6, and P3.7 respectively.
- **Keypad Connections**: 
  - Rows connected to P2.0, P2.1, P2.2, P2.3.
  - Columns connected to P2.5, P2.6, P2.7.
- **Buzzer**: 
  - Connected to P0.0.
- **Crystal Oscillator**: 
  - Connected between pins 18 and 19.
- **Power and Ground**: 
   - VCC to pin 40, GND to pin 20, and EA to pin 31.
- **Reset**: 
  - Connected to pin 9 via a push button and a resistor-capacitor network.

![image](https://github.com/haiderCho/CSE331/assets/117144478/49b59194-3cb8-4d16-b1c4-7e9298dca960)

### Code Structure

The program for the digital alarm clock is written in C and compiled using the Keil IDE. The key components of the code include:

1. **Header Files:** Inclusion of `reg52.h` for 8051 microcontroller configuration.
2. **Keypad Function:** `keypad()` scans for key presses on the 4x3 keypad.
3. **Character Conversion:** `tochar()` converts integers to 8-bit characters for LCD display.
4. **Port Declarations:** Single bits of ports are declared for the buzzer and keypad.
5. **Messages:** Character arrays are used for messages displayed on the LCD.
6. **Delay Function:** `delay()` generates required delays.
7. **LCD Functions:** `lcdcmd()` sends commands and `lcddata()` sends data to the LCD.
8. **Condition Check:** `checkconditions()` manages timekeeping logic and alarm conditions.
9. **Clock Delay:** `clockdelay()` produces the timing mechanism for seconds, minutes, and hours.
10. **LCD Initialization:** `lcdinit()` initializes the LCD.
11. **Time Setting:** `settime()` allows the user to set the initial time via the keypad.
12. **Start Function:** `start()` displays the time on the LCD at program start.

#### Function Descriptions

- **`delay()`**: Creates a delay for the specified amount of time. This is used for timing purposes in the program.
- **`lcdcmd()`**: Sends a command to the LCD. Commands are used to configure the LCD and perform operations like clearing the display or setting the cursor position.
- **`lcddata()`**: Sends data (characters) to the LCD to be displayed.
- **`scankey()`**: Scans the keypad to detect key presses. This is used in various functions to read user input.
- **`checkconditions()`**: Checks the current time against the set alarm time. If the alarm time is reached, the buzzer is activated.
- **`clockdelay()`**: Implements the timing mechanism for the clock, incrementing the seconds, minutes, and hours, and checking alarm conditions.
- **`lcdint()`**: Initializes the LCD, setting it up for use.
- **`keypad()`**: Handles keypad input, detecting which key is pressed and returning the corresponding value.
- **`settime()`**: Allows the user to set the initial time using the keypad.
- **`start()`**: Displays the initial time on the LCD when the program starts.
- **`tochar()`**: Converts an integer to characters and sends them to the LCD for display.

### Code Flow

1. **Initial Setup:** On program start, the user sets the clock time using the 4x3 keypad. The time is displayed on the 16x2 LCD.
2. **Running Clock:** The clock runs continuously using the internal timers of the microcontroller.
3. **Setting Alarm:** The user sets the alarm time by pressing a specific key on the keypad. The alarm time is entered in hours and minutes.
4. **Alarm Activation:** When the clock time matches the set alarm time, the buzzer is activated.

### Conclusion

The digital alarm clock project demonstrates the practical application of the 8051 microcontroller in creating a functional embedded system. By understanding and modifying the provided code, users can extend the project's capabilities, such as adding AM/PM functionality or integrating additional devices triggered by the alarm.

---
### References
- **8051 Microcontroller Datasheet**
- **Keil IDE Documentation**
- **LCD and Keypad Datasheets**
- **Embedded Systems Textbooks**
- **EngineersGarage**
