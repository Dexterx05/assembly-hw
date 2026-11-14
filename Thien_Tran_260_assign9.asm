; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

DAYS = 7     ; constant representing the number of days in a week
HOURS = 24   ; constant representing the number of hours in a day
MINUTES = 60  ; constant representing the number of minutes in an hour
SECONDS = 60  ; constant representing the number of seconds in a minute

.data

date_time DWORD ? ; byte 0000 stores the DAY, byte 0001 stores the HOUR, byte 0002 stores the MINUTE, and byte 0003 stores the SECOND
num_of_iters DWORD 0  ; counts the total number of iterations
day BYTE DAYS   ; used to restore cl to the current day value
hour BYTE HOURS  ; used to restore cl to the current hour value
minute BYTE MINUTES  ; used to restore cl to the current minute value
	
.code
main proc

;Comment 1: initialize ECX loop counter to iterate through 7 days of week
	mov ecx, DAYS

DAY_LOOP:
    ; Comment 2: Save the current remaining day counter from CL into the day variable before ECX is overwritten by the inner loops.
    mov day, cl

    ; Comment 3: Calculate the zero-based current day index (0 to 6) by subtracting the remaining counter in CL from DAYS.
    mov al, DAYS
    sub al, cl

    ; Comment 4: Store the calculated current day byte into relative byte 0 of the date_time variable in memory.
    mov BYTE PTR [date_time], al

    ; Comment 5: Set the ECX loop counter to HOURS (24) to prepare the second-level loop for iterating through the hours of the day.
    mov ecx, HOURS

HOUR_LOOP:
    ; Comment 6: Save the current remaining hour counter from CL into the hour variable so it can be restored after the minute loop finishes.
    mov hour, cl

    ; Comment 7: Calculate the zero-based current hour index (0 to 23) by subtracting CL from HOURS and store it into relative byte 1 of date_time.
    mov al, HOURS
    sub al, cl
    mov BYTE PTR [date_time + 1], al

    ; Comment 8: Set the ECX loop counter to MINUTES (60) to prepare the third-level loop for iterating through the minutes of the hour.
    mov ecx, MINUTES

MINUTE_LOOP:
    ; Comment 9: Save the current remaining minute counter from CL into the minute variable before entering the innermost seconds loop.
    mov minute, cl

    ; Comment 10: Calculate the zero-based current minute index (0 to 59) by subtracting CL from MINUTES and store it into relative byte 2 of date_time.
    mov al, MINUTES
    sub al, cl
    mov BYTE PTR [date_time + 2], al

    ; Comment 11: Set the ECX loop counter to SECONDS (60) to prepare the innermost loop for iterating through the 60 seconds of a minute.
    mov ecx, SECONDS

SECOND_LOOP:
    ; Comment 12: Calculate the zero-based current second index (0 to 59) by subtracting CL from SECONDS and store it into relative byte 3 of date_time.
    mov al, SECONDS
    sub al, cl
    mov BYTE PTR [date_time + 3], al

    ; Comment 13: Increment the num_of_iters counter by 1 during each innermost iteration to track the total number of seconds processed.
    inc num_of_iters

    ; Comment 14: Decrement ECX and jump back to SECOND_LOOP until all 60 seconds of the current minute have been processed.
    loop SECOND_LOOP

    ; Comment 15: Restore the outer minute loop counter into ECX using zero-extension from the saved minute byte variable.
    movzx ecx, minute

    ; Comment 16: Decrement the restored minute counter in ECX and repeat MINUTE_LOOP until all 60 minutes of the hour are complete.
    loop MINUTE_LOOP

    ; Comment 17: Restore the outer hour loop counter into ECX using zero-extension from the saved hour byte variable.
    movzx ecx, hour
    loop HOUR_LOOP

    ; Comment 18: Restore the outermost day loop counter into ECX using zero-extension from the saved day byte variable and repeat until all 7 days finish.
    movzx ecx, day
    loop DAY_LOOP


	invoke ExitProcess,0
main endp
end main