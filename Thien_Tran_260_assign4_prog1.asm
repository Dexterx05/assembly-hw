; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	A DWORD ?
	B DWORD 5
	C1 DWORD 10
	D DWORD 4
	E DWORD 6
	F DWORD 7
	G DWORD 8
	H DWORD 2
	I DWORD 3
	J DWORD 12


.code
main proc
mov eax, 0


add eax, B
add eax, C1

add eax, B
add eax, B
add eax, B
add eax, B

add eax, E
add eax, E
add eax, E
add eax, E
add eax, E

add eax, F
add eax, F
add eax, F
add eax, F
add eax, F
add eax, F

add eax, G
add eax, G
add eax, G
add eax, G
add eax, G
add eax, G
add eax, G

add eax, D
add eax, D
add eax, D
add eax, D

add eax, B
add eax, B
add eax, B
add eax, B
add eax, B

add eax, I
add eax, I

add eax, D
add eax, D
add eax, D

add eax, H
add eax, J

mov A, eax


	invoke ExitProcess,0
main endp
end main