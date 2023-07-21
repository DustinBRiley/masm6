INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
p1 BYTE "Greatest common divisor of (5,20) calculated by loop is: ", 0
p2 BYTE "Greatest common divisor of (24,18) calculated by loop is: ", 0
p3 BYTE "Greatest common divisor of (11,7) calculated by loop is: ", 0
p4 BYTE "Greatest common divisor of (438,226) calculated by loop is: ", 0
p5 BYTE "Greatest common divisor of (26,13) calculated by loop is: ", 0
rec BYTE "calculated by recursion is: ", 0

.code
gcd proc
	cmp eax, 0		;get absolute value of eax
	jae A1			;jump if eax is above or equal to 0
	neg eax			;negate negative eax to positive eax
	A1:
		cmp ebx, 0	;get absolute value of ebx
		jae A2		;jump if ebx is above or equal to 0
		neg ebx		;negate negative ebx to positive ebx
	A2:
		mov edx, 0		;clear edx for remainder
		div ebx			;div stores remainder into edx
		mov eax, ebx	;eax = ebx
		mov ebx, edx	;ebx = remainder
		cmp ebx, 0		;compare ebx to zero
		ja A2			;jump if above to A2
	ret
gcd endp

gcdrec proc
	cmp eax, 0		;get absolute value of eax
	jae A3			;jump if eax is above or equal to 0
	neg eax			;negate negative eax to positive eax
	A3:
		cmp ebx, 0	;get absolute value of ebx
		jae A4		;jump if ebx is above or equal to 0
		neg ebx		;negate negative ebx to positive ebx
	A4:
		mov edx, 0		;clear edx for remainder
		div ebx			;div stores remainder into edx
		mov eax, ebx	;eax = ebx
		mov ebx, edx	;ebx = n
		cmp ebx, 0		;compare ebx to zero
		je L2			;jump if equal to L2
		call gcdrec		;recursive call
	L2:
		ret
gcdrec endp

main proc
	mov edx, OFFSET p1			;print p1
	call writestring
	mov eax, 5					;load params
	mov ebx, 20
	call gcd
	call writedec				;write result
	call crlf
	mov edx, OFFSET rec			;print rec
	call writestring
	mov eax, 5					;load params
	mov ebx, 20
	call gcdrec
	call writedec				;write result
	call crlf
	mov edx, OFFSET p2			;print p2
	call writestring
	mov eax, 24					;load params
	mov ebx, 18
	call gcd
	call writedec				;write result
	call crlf
	mov edx, OFFSET rec			;print rec
	call writestring
	mov eax, 24					;load params
	mov ebx, 18
	call gcdrec
	call writedec				;write result
	call crlf
	mov edx, OFFSET p3			;print p3
	call writestring
	mov eax, 11					;load params
	mov ebx, 7
	call gcd
	call writedec				;write result
	call crlf
	mov edx, OFFSET rec			;print rec
	call writestring
	mov eax, 11					;load params
	mov ebx, 7
	call gcdrec
	call writedec				;write result
	call crlf
	mov edx, OFFSET p4			;print p4
	call writestring
	mov eax, 438				;load params
	mov ebx, 226
	call gcd
	call writedec				;write result
	call crlf
	mov edx, OFFSET rec			;print rec
	call writestring
	mov eax, 438				;load params
	mov ebx, 226
	call gcdrec
	call writedec				;write result
	call crlf
	mov edx, OFFSET p5			;print p5
	call writestring
	mov eax, 26					;load params
	mov ebx, 13
	call gcd
	call writedec				;write result
	call crlf
	mov edx, OFFSET rec			;print rec
	call writestring
	mov eax, 26					;load params
	mov ebx, 13
	call gcdrec
	call writedec				;write result
	call crlf
	call waitmsg
	invoke ExitProcess, 0
main endp
end main