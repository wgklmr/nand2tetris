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

// Put your code here.

@24575
D=A

@MAX_SCREEN_ADDRESS
M=D

(LOOP)

// CURRENT_PIXEL_ADDRESSを設定 ================
@SCREEN
D=A
@CURRENT_PIXEL_ADDRESS
M=D

// 入力情報を保存 ================
@KBD
D=M

@WHITE
D; JEQ

@BLACK
D; JGT

(WHITE)
@FILLED_VALUE
MD=0

@SCREEN_LOOP
0; JMP

(BLACK)
@FILLED_VALUE
MD=-1


// 黒 or 白 にする ================
(SCREEN_LOOP)

@FILLED_VALUE
D=M

// ターゲット設定
@CURRENT_PIXEL_ADDRESS
A=M // 塗りつぶすメモリを指定
M=D // FILLED_VALUEで塗りつぶす

// インクリメント
@CURRENT_PIXEL_ADDRESS
M=M+1

// ループ条件
@MAX_SCREEN_ADDRESS // 24575を格納している
D=M
@CURRENT_PIXEL_ADDRESS
D=D-M

@SCREEN_LOOP
D; JGT // (24575-CURRENT_PIXEL_ADDRESS) > 0 ならループ

@LOOP
0; JMP
