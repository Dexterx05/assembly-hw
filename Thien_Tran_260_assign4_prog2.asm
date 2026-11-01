
; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

A DWORD ?
B DWORD 1
C1 DWORD 2  ; C is a reserved word
D DWORD 3
E DWORD 4
F DWORD 5
G DWORD 6
H DWORD 7
I DWORD 8
J DWORD 9
K DWORD 10
L DWORD 11
M DWORD 12
N DWORD 13
O DWORD 14
P DWORD 15

.code
main proc
	
mov eax, 0 ; initialize eax to 0

add eax, E
add eax, E
add eax, E

mov ebx, eax ; ebx=12

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

mov ebx, eax ; ebx=60

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

mov ebx, eax ; ebx=360

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

mov ebx, eax ; ebx=2520

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

mov ebx, eax ; ebx=20,160

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

mov ebx, eax ; ebx=181,440

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

mov ebx, eax ; ebx=1,814,400

add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx
add eax, ebx

add eax, B
add eax, C1
add eax, M
add eax, N
add eax, O
add eax, P

mov A, eax

	invoke ExitProcess,0
main endp
end main