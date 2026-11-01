.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	var1 BYTE 'W'
	var2 BYTE 'X'
	var3 BYTE 'Y'
	var4 BYTE 'Z'
	
.code
main proc

;Comment 1: Load 4 variables into 8 bit registers
mov al, var1
mov ah, var2
mov bl, var3
mov bh, var4

;Comment 2: Store each value with 1 position backwards
mov var1, bh
mov var2, al
mov var3, ah
mov var4, bl

;Comment 3: Reset eax to 0 so no leftover bits remain from phase 1
sub eax, eax

;Comment 4: put var1 var2 to lower 16 bits of eax
mov ah, var1
mov al, var2

; Comment 5: add eax 16 times, shift it left 16 bits
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax

;Comment 6: Move var3 var4 to lower 16 bits of eax
mov ah, var3
mov al, var4

;Comment 7: clear ebx to 0
sub ebx, ebx

;Comment 8: var1 2's complement into bh
mov bh, 0FFh
sub bh, var1
add bh, 1

;Comment 9: Same two's complement into var2 stored in bl
mov bl, 0FFh
sub bl, var2
add bl, 1

;Comment 10: Shift ebx left 16 times 
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx

;Comment 11: two's complement of var3 var4 into bh and bl
mov bh, 0FFh
sub bh, var3
add bh, 1
mov bl, 0FFh
sub bl, var4
add bl, 1

	invoke ExitProcess,0
main endp
end main