# ECE385-FinalProject  
ECE385 FinalProject from ZJUI FA2020  
### Description  
In the final project, we design a game named Bongo Touch, which is a 2D percussion music game. In the hardware part, we use System Bus, on-chip-memory, SDRAM in our SoC and implement control modules, music modules, display modules and so on. We use NIOS Ⅱ CPU to interface with USB keyboard as we have done in lab 8. In our software part, we modified the C code about USB and IO to accept 4 keycodes input at the same time. 
In the game, the player should press “S” or “F” if there is a red note coming and press “A” or “G“ if there is a blue note coming. The player should press the keyboard as the same time with the flowing note reaching the destination. The note will become smiling if the player press the right keyboard at the right time and then he will be awarded one score. The total score will display at the left of the destination. Meanwhile, we have two patterns, which are 1P (one player) and 2P (two players). The second player should press “↓” or “1” if there is a red note coming and press “←” or “2“ if there is a blue note coming. There are two notes coming at the same time separately for each player and the scores will be calculated and display separately.  
### Credits  
General Framework: https://github.com/kushpatel0703/GuitarZero  
Drawing Tutorial: https://github.com/atrifex/ECE385-HelperTools  
Music Playing: https://github.com/0x60/385-audio-tools, 
https://github.com/AhmadGon/WM8731-Audio-CODEC