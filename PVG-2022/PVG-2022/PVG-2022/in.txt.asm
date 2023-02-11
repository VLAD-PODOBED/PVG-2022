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
divideOnZeroExeption BYTE "Попытка деления на ноль.", 0  ;STR, для вывода ошибки при делении на ноль
	FindFactor$LEX1 DWORD 1 ;INT
	main$LEX4 DWORD 5 ;INT
	main$LEX5 BYTE "AlexeiKruglik", 0  ;STR
	main$LEX6 BYTE "Char type:", 0  ;STR
	main$LEX7 BYTE 'q' ;CHR
	main$LEX8 DWORD 32 ;INT
	main$LEX9 DWORD 254 ;INT
	main$LEX11 BYTE "Number to be circilar shifted:", 0  ;STR
	main$LEX12 DWORD 2 ;INT
	main$LEX13 BYTE "32<<2:", 0  ;STR
	main$LEX15 BYTE "32>>2:", 0  ;STR
	main$LEX16 BYTE "Hours:", 0  ;STR
	main$LEX18 BYTE "Minutes:", 0  ;STR
	main$LEX20 BYTE "Date:", 0  ;STR
	main$LEX22 BYTE "Month:", 0  ;STR
	main$LEX24 DWORD 3 ;INT
	main$LEX25 DWORD 4 ;INT
	main$LEX26 DWORD 0 ;INT
.data
	FindFactoranswer DWORD 0 ;INT
	mainnumber DWORD 0 ;INT
	mainbl DWORD 0 ;STR
	mainstr1 BYTE 0 ;CHR
	maindemo DWORD 0 ;INT
	mainl DWORD 0 ;INT
	maini DWORD 0 ;INT
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
mov ebx, FindFactor$LEX1
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

; String #30 :ivl
push main$LEX9
pop mainl

; String #32 :ivilv
push mainl
push FindFactor$LEX1
pop ebx
pop eax
add eax, ebx 
push eax
pop maini

push maini
CALL outputuint

push offset main$LEX11
CALL outputstr

push maindemo
CALL outputuint

; String #37 :ivilv
push maindemo
push main$LEX12
pop ebx
pop eax
push ecx ; сохраняем данные регистра ecx
mov ecx, ebx
SHL eax, cl
pop ecx
push eax
pop maindemo1

push offset main$LEX13
CALL outputstr

push maindemo1
CALL outputuint

; String #41 :ivilv
push maindemo
push main$LEX12
pop ebx
pop eax
push ecx ; сохраняем данные регистра ecx
mov ecx, ebx
SHR eax, cl
pop ecx
push eax
pop maindemo2

push offset main$LEX15
CALL outputstr

push maindemo2
CALL outputuint

push offset main$LEX16
CALL outputstr

; String #49 :ivil@1
invoke GetHours, FindFactor$LEX1
push eax ;результат функции
pop mainnumber1

push mainnumber1
CALL outputuint

push offset main$LEX18
CALL outputstr

; String #52 :ivil@1
invoke GetMinutes, FindFactor$LEX1
push eax ;результат функции
pop mainnumber2

push mainnumber2
CALL outputuint

push offset main$LEX20
CALL outputstr

; String #55 :ivil@1
invoke GetDate, FindFactor$LEX1
push eax ;результат функции
pop mainnumber3

push mainnumber3
CALL outputuint

push offset main$LEX22
CALL outputstr

; String #58 :ivil@1
invoke GetMonth, FindFactor$LEX1
push eax ;результат функции
pop mainnumber4

push mainnumber4
CALL outputuint

; String #63 :ivl
push main$LEX24
pop maina

; String #64 :ivl
push main$LEX25
pop mainb

; String #65 :iviiv
push maina
push mainb
pop ebx
pop eax
sub eax, ebx
push eax
pop mainc

push mainc
CALL outputuint

mov eax, main$LEX26
	jmp endPoint
	div_by_0:
	push offset divideOnZeroExeption
CALL outputstr
endPoint:
	invoke		ExitProcess, eax
main ENDP
end main