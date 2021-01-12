# GuitarZero
### Objective
For our Digital Systems Lab final project, my partners and I decided to make a Guitar Hero like name (aptly named Guitar Zero) that can run on the FPGA. Our objective was to display sprites to the screen and having those sprites drop down the screen based on the music that was loaded into memory.
### Description
This project turned out to be more complicated than we anticipated because we had to write USB interface, VGA, and sound drivers from scratch. Ultimately our game was completed and consisted of sprite generation, randomization of sprites, sound driver, video driver, and usb controller driver. The project took about 2 months spending 10-20 hours a week. 
 ### Technology
 - SystemVerilog for all FPGA module code
 - C for all the driver itnerface code
 - Cyclone IV FPGA chip on which this whole game was presented
