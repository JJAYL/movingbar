.model small
.stack 100h
.data
forwards db 8, ' ', '|','$'
backwards db 8, ' ', 8, 8, '|','$'
.code
main proc
mov Ax, @data
mov ds, Ax
mov AH, 2h       ;2h
mov dl , '|' 
int 21h
loopforev:
	mov CL, 78 
	again:
		mov AH, 9h
		lea dx, forwards
		int 21h
		dec CL
		JNZ again
	mov CL, 78
	again2:
		mov AH,9h
		lea dx, backwards
		int 21h
		dec CL
		;cmp CL, 0 with JL again2
		JNZ again2
Jmp loopforev
mov AH, 04ch
int 21h
main endp
end main
