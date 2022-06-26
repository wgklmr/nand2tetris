// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@i
M=1

@R0
D=M

@R2
M=D

(LOOP)
@R1
D=M

@i
D=D-M

@END
D; JLE // R1 - i <= 0 => 終了

@R0
D=M

// sumにR0を足す
@R2
M=D+M

// loopの最後にiをインクリメント
@i
M=M+1

@LOOP
0; JMP

(END)
@END
0; JMP
