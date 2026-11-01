.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
   array1 DWORD 1, 2, 3, 4, 5
   array2 DWORD 6, 7, 8, 9, 10
   array3 DWORD LENGTHOF array1 dup(?)

.code
main proc

;Comment 1: Swap first index of array1 and last index of array2
mov eax, [array1]
mov ebx, [array2+16]
mov [array1], ebx
mov [array2+16], eax

;Comment 2: Swap second index of array1 and fourth index of array2
mov eax, [array1+4]
mov ebx, [array2+12]
mov [array1+4], ebx
mov [array2+12], eax

;Comment 3: Swap third index of array1 and third index of array2
mov eax, [array1+8]
mov ebx, [array2+8]
mov [array1+8], ebx
mov [array2+8], eax

;Comment 4: Swap fourth index of array1 and second index of array2
mov eax, [array1+12]
mov ebx, [array2+4]
mov [array1+12], ebx
mov [array2+4], eax

;Comment 5: Swap fifth index of array1 and first index of array2
mov eax, [array1+16]
mov ebx, [array2]
mov [array1+16], ebx
mov [array2], eax

;Comment 6: Swap the values of array1 and array2 and store the result in array3
mov eax, [array1]
sub eax, [array2]
mov [array3], eax

;Comment 7: Swap the values of array1 and array2 and store the result in array3
mov eax, [array1+4]
sub eax, [array2+4]
mov [array3+4], eax

;Comment 8: Swap the values of array1 and array2 and store the result in array3
mov eax, [array1+8]
sub eax, [array2+8]
mov [array3+8], eax

;Comment 9: Swap the values of array1 and array2 and store the result in array3
mov eax, [array1+12]
sub eax, [array2+12]
mov [array3+12], eax

;Comment 10: Swap the values of array1 and array2 and store the result in array3
mov eax, [array1+16]
sub eax, [array2+16]
mov [array3+16], eax

	invoke ExitProcess,0
main endp
end main