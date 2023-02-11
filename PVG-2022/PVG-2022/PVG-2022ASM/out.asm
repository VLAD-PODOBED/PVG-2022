.586
	.model flat, stdcall
	includelib libucrt.lib
	includelib kernel32.lib
	includelib ../Debug/PVG-2022LIB.lib
	ExitProcess PROTO :DWORD


	GetHours PROTO :DWORD 
	GetMonth PROTO :DWORD 
	GetMinutes PROTO :DWORD 
	GetDate PROTO :DWORD 
outputuint PROTO :DWORD
outputchar PROTO :BYTE
outputstr PROTO :DWORD

.stack 4096
.const
num_err byte 'Error: overflow', 0
divideOnZeroExeption BYTE "Попытка деления на ноль.", 0  ;STR, для вывода ошибки при делении на ноль
	FindFactor$LEX1 DWORD 1 ;INT
	FindFactor$LEX2 DWORD 6 ;INT
	main$LEX4 DWORD 5 ;INT
	main$LEX5 BYTE "AlexeiKruglik", 0  ;STR
	main$LEX6 BYTE "Char type:", 0  ;STR
	main$LEX7 BYTE 'q' ;CHR
	main$LEX8 DWORD 255 ;INT
	main$LEX9 BYTE "Number to be circilar shifted:", 0  ;STR
	main$LEX10 DWORD 2 ;INT
	main$LEX11 BYTE "32<<2:", 0  ;STR
	main$LEX13 BYTE "32>>2:", 0  ;STR
	main$LEX14 BYTE "Hours:", 0  ;STR
	main$LEX16 BYTE "Minutes:", 0  ;STR
	main$LEX18 BYTE "Date:", 0  ;STR
	main$LEX20 BYTE "Month:", 0  ;STR
	main$LEX22 DWORD 3 ;INT
	main$LEX23 DWORD 4 ;INT
	main$LEX25 DWORD 0 ;INT
.data
	FindFactoranswer DWORD 0 ;INT
	mainnumber DWORD 0 ;INT
	mainbl DWORD 0 ;STR
	mainstr1 BYTE 0 ;CHR
	maindemo DWORD 0 ;INT
	maindemo1 DWORD 0 ;INT
	maindemo2 DWORD 0 ;INT
	mainnumber1 DWORD 0 ;INT
	mainnumber2 DWORD 0 ;INT
	mainnumber3 DWORD 0 ;INT
	mainnumber4 DWORD 0 ;INT
	maina DWORD 0 ;INT
	mainb DWORD 0 ;INT
	mainc DWORD 0 ;INT

.code
$FindFactor PROC uses ebx ecx edi esi ,	FindFactora: DWORD 
; String #3 :ivl
push FindFactor$LEX1
pop FindFactoranswer

While17Start: 
mov eax, FindFactora
mov ebx, FindFactor$LEX2
cmp eax, ebx
jl While17End

; String #6 :iviiv
push FindFactoranswer
push FindFactora
pop ebx
pop eax
mul ebx
push eax
pop FindFactoranswer

; String #7 :ivilv
push FindFactora
push FindFactor$LEX1
pop ebx
pop eax
sub eax, ebx
push eax
pop FindFactora
jmp While17Start
While17End: 

mov eax, FindFactoranswer
ret
$FindFactor ENDP

main PROC

; String #18 :ivil@1
invoke $FindFactor, main$LEX4
push eax ;результат функции
pop mainnumber

push mainnumber
CALL outputuint

; String #21 :ivl
push offset main$LEX5
pop mainbl

push mainbl
CALL outputstr

push offset main$LEX6
CALL outputstr

; String #25 :ivl
movzx eax, main$LEX7
push eax 
pop eax
mov mainstr1, al
push eax
movzx eax, mainstr1
push eax
CALL outputchar
pop eax


; String #28 :ivl
push main$LEX8
pop maindemo

push offset main$LEX9
CALL outputstr

push maindemo
CALL outputuint

; String #32 :ivilv
push maindemo
push main$LEX10
pop ebx
pop eax
push ecx ; сохраняем данные регистра ecx
mov ecx, ebx
SHL eax, cl
pop ecx
push eax
pop maindemo1

push offset main$LEX11
CALL outputstr

push maindemo1
CALL outputuint

; String #36 :ivilv
push maindemo
push main$LEX10
pop ebx
pop eax
push ecx ; сохраняем данные регистра ecx
mov ecx, ebx
SHR eax, cl
pop ecx
push eax
pop maindemo2

push offset main$LEX13
CALL outputstr

push maindemo2
CALL outputuint

push offset main$LEX14
CALL outputstr

; String #44 :ivil@1
invoke GetHours, FindFactor$LEX1
push eax ;результат функции
pop mainnumber1

push mainnumber1
CALL outputuint

push offset main$LEX16
CALL outputstr

; String #47 :ivil@1
invoke GetMinutes, FindFactor$LEX1
push eax ;результат функции
pop mainnumber2

push mainnumber2
CALL outputuint

push offset main$LEX18
CALL outputstr

; String #50 :ivil@1
invoke GetDate, FindFactor$LEX1
push eax ;результат функции
pop mainnumber3

push mainnumber3
CALL outputuint

push offset main$LEX20
CALL outputstr

; String #53 :ivil@1
invoke GetMonth, FindFactor$LEX1
push eax ;результат функции
pop mainnumber4

push mainnumber4
CALL outputuint

; String #58 :ivl
push main$LEX22
pop maina

; String #59 :ivl
push main$LEX23
pop mainb

; String #60 :iviiv
push maina
push mainb
pop ebx
pop eax
sub eax, ebx
push eax
pop mainc

push mainc
CALL outputuint

While263Start: 
mov eax, maina
mov ebx, FindFactor$LEX1
cmp eax, ebx
jl While263End

push maina
CALL outputuint
jmp While263Start
While263End: 

mov eax, main$LEX25
	jmp endPoint
	div_by_0:
	push offset divideOnZeroExeption
CALL outputstr
endPoint:
	invoke		ExitProcess, eax
main ENDP
num_error::
push offset num_err
call outputstr
push - 1
call ExitProcess
end main
