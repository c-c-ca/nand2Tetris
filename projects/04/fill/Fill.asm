// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Initialize pointer before clearing screen
(BEGIN)
    @SCREEN
    D=A        // D=SCREEN
    @ptr
    M=D        // ptr=SCREEN
(CLEAR)
    @ptr
    A=M
    M=0        // *ptr=0
    @ptr
    M=M+1      // ptr++
    D=M
    @KBD
    D=D-A
    @CLEAR
    D;JLT      // If ptr<KBD goto CLEAR
(KEY_UP)
    @KBD
    D=M
    @KEY_UP
    D;JEQ      // loops while each key is up

// Initialize pointer before filling screen
    @SCREEN
    D=A        // D=SCREEN
    @ptr
    M=D        // ptr=SCREEN
(FILL)
    @ptr
    A=M
    M=-1       // *ptr=0
    @ptr
    M=M+1      // ptr++
    D=M
    @KBD
    D=D-A
    @FILL
    D;JLT      // If ptr<KBD goto FILL
(KEY_DOWN)
    @KBD
    D=M
    @KEY_DOWN
    D;JNE      // loops while any key is down
    @BEGIN
    0;JMP
