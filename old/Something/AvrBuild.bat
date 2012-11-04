@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "P:\Code\avr\Something\labels.tmp" -fI -W+ie -o "P:\Code\avr\Something\Something.hex" -d "P:\Code\avr\Something\Something.obj" -e "P:\Code\avr\Something\Something.eep" -m "P:\Code\avr\Something\Something.map" "P:\Code\avr\Something\usart.c"
