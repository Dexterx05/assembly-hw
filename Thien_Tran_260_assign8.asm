.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


; change NUM to the value that you want to run the program with 
NUM = 13
.data

; do NOT change quadArray here in the data segment!!!
; You will be building this array with your loop

quadArray DWORD NUM DUP(0)

.code
main proc
; Comment 1: Initialize the ESI register with the memory offset of quadArray so we can use the indirect operand approach.
mov esi, OFFSET quadArray
	
; Comment 2: Initialize Quad(1) by storing the first base case value of 1 into the first DWORD position of the array.
mov dword ptr [esi], 1
    
; Comment 3: Initialize Quad(2) by storing 1 into the second DWORD position of the array, offset by 4 bytes.
mov dword ptr [esi+4], 1
    
; Comment 4: Initialize Quad(3) by storing 1 into the third DWORD position of the array, offset by 8 bytes.
mov dword ptr [esi+8], 1
    
; Comment 5: Initialize Quad(4) by storing 1 into the fourth DWORD position of the array, offset by 12 bytes.
mov dword ptr [esi+12], 1
    
; Comment 6: Set the loop counter ECX to NUM, which dictates the total number of Quadonacci elements to generate.
mov ecx, NUM
    
; Comment 7: Subtract 4 from the loop counter ECX because the first 4 base cases have already been manually initialized.
sub ecx, 4

; Comment 8: Advance the ESI pointer by 16 bytes so it now points to the 5th element (Quad(5)) in the array where the loop will begin writing.
add esi, 16

L1:
    ; Comment 9: Load Quad(N-1) into EAX by indirectly accessing the DWORD located 4 bytes behind the current ESI pointer.
    mov eax, [esi-4]
    
    ; Comment 10: Add Quad(N-2) to the running total in EAX by accessing the element located 8 bytes behind the ESI pointer.
    add eax, [esi-8]
    
    ; Comment 11: Add Quad(N-3) to the running total in EAX by accessing the element located 12 bytes behind the ESI pointer.
    add eax, [esi-12]
    
    ; Comment 12: Add Quad(N-4) to the running total in EAX by accessing the element located 16 bytes behind the ESI pointer.
    add eax, [esi-16]
    
    ; Comment 13: Store the newly calculated Quad(N) value from EAX into the current array position pointed to by ESI.
    mov [esi], eax
    
    ; Comment 14: Advance the ESI pointer forward by 4 bytes so it points to the next empty DWORD slot for the next loop iteration.
    add esi, 4
    
    ; Comment 15: Decrement ECX and jump back to the L1 label if ECX is not zero, continuing the loop sequence.
    loop L1

	invoke ExitProcess,0
main endp
end main