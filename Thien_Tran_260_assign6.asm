; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

   msgforward WORD 6 DUP(?)
   msgbackward WORD 6 DUP(?)
   restore_esp DWORD ?

.code
main proc
  
  mov restore_esp, esp ; save the contents of register ESP so it can be restored before the program finishes
                       ; DO NOT REMOVE THIS

  ; clear the registers

  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
  mov esi, 0
  mov edi, 0
  mov esp, 0
  mov ebp , 0

     ; store the message "Welcome Home" in reverse order across the six 16-bit registers

   mov ax, "BA"
   mov bx, "L "
   mov si, "RE"
   mov di, "TU"
   mov sp, "PM"
   mov bp, "OC"


 ; PUT YOUR INSTRUCTIONS FOR PHASES 1 -3 HERE
 ; PUT YOUR INSTRUCTIONS FOR PHASES 1 -3 HERE
 ; PUT YOUR INSTRUCTIONS FOR PHASES 1 -3 HERE
 ; PUT YOUR INSTRUCTIONS FOR PHASES 1 -3 HERE
 ; PUT YOUR INSTRUCTIONS FOR PHASES 1 -3 HERE

 ;Comment 1: Move first word from bp to start of msgforward array
 mov msgforward, bp
 
 ;Comment 2: Move 2nd word from sp to 2nd position of msgforward array
 mov msgforward + 2, sp

 ;Comment 3: Same tedious tasks but +2 again and again
 mov msgforward + 4, di
 mov msgforward + 6, si
 mov msgforward + 8, bx
 mov msgforward + 10, ax

 ;Comment 3: Now phase 3, we reverse byte ordering in registers

 ;Comment 4: Swapping high and low bytes of register ax using temporary register cl
 mov cl, al
 mov al, ah
 mov ah, cl

 ;Comment 5: Same thing but for bx
 mov cl, bl
 mov bl, bh
 mov bh, cl

 ;Comment 6: Swap high and low bytes of register si using cx and dl for byte manipulation
 mov cx, si
 mov dx, cx
 mov cl, dh
 mov ch, dl
 mov si, cx

 ;Comment 7: Same thing but for di
 mov cx, di
 mov dx, cx
 mov cl, dh
 mov ch, dl
 mov di, cx

 ;Comment 8: Same thing but for sp
 mov cx, sp
 mov dx, cx
 mov cl, dh
 mov ch, dl
 mov sp, cx

 mov cx, bp
 mov dx, cx
 mov cl, dh
 mov ch, dl
 mov bp, cx

 ;PHASE 3: Message moved in reverse order
 ;Comment 9: Move first swapped word from ax to start of msgbackward array
 mov msgbackward, ax

 ;Comment 10: Now we move each swapped word from each register to the msgbackward array in reverse order
 mov msgbackward + 2, bx
 mov msgbackward + 4, si
 mov msgbackward + 6, di
 mov msgbackward + 8, sp
 mov msgbackward + 10, bp

 
mov esp, restore_esp ; restore register ESP to it's original value so the program can end correctly
                     ; DO NOT REMOVE THIS

	invoke ExitProcess,0
main endp
end main