TITLE Program asm5math(asm5math.asm)

; ���α׷� ���� : �ִ��ּ�����հ�� ���α׷�
; ������:			SCPJaehyeon
; ���� ���� : 20200518
; ���� ���� ���� : 20200518

INCLUDE c:\Irvine\Irvine32.inc

.data
buff		WORD		100 DUP(0)	  
str1		BYTE		" ��° ����� �Է��ϼ��� ( ����=0 ) ? ", 0
str2		BYTE		0dh, 0ah, ">> �Է¹��� ���� ���� = ", 0
str3		BYTE		0dh, 0ah, ">> �Էµ� �ڷᰡ �����ϴ�.", 0dh, 0ah, 0
min		WORD		65535
max		WORD		0
suum	WORD		0
count	WORD		0
minstr	BYTE		">> �ּ� �� = ", 0
maxstr	BYTE		">> �ִ� �� = ", 0
sumstr	BYTE		">> ��	�� = ", 0
avrstr	BYTE		">> ��� �� : �� = ", 0
avrstr2 BYTE		"   ������ = ", 0

.code
main			PROC
mov				ebx, offset buff
xor				ecx, ecx
again :
mov				eax, ecx
inc				eax
call			WriteDec
mov				edx, offset str1
call			WriteString
call			ReadDec; ���� �Է½� 0 -- > eax
cmp				ax, 0
jz				last
mov				[ecx*TYPE buff][ebx], ax
add				suum, ax
inc				ecx
jmp				again
last :
cmp				ecx, 0
jz				term
mov				eax, ecx
mov				edx, offset str2
call			WriteString
mov				count, cx
call			WriteDec
call			Crlf
mov				esi, offset buff
mov				ebx, TYPE buff
call			DumpMem
call			Crlf
mov				esi, offset buff

compare :
mov				ax, word ptr[esi]
cmp				ax, max
jna				no_max; jle		no_max
mov				max, ax

no_max :
cmp				ax, min
jnb				no_min; jge		no_min
mov				min, ax

no_min :
add				esi, TYPE buff
loop			compare
mov				edx, offset maxstr
call			WriteString
movzx			eax, max
call			WriteDec
call			Crlf
mov				edx, offset minstr
call			WriteString
movzx			eax, min
call			WriteDec
call			Crlf
mov				edx, offset sumstr
call			WriteString
mov				ax, suum
call			WriteDec
call			Crlf
mov				edx, offset avrstr
call			WriteString
mov				eax, 0
mov				edx, 0
mov				ax, suum
mov				bx, count
div				bx	
mov				bx, dx
cwde
call			WriteDec
mov				edx, offset avrstr2
call			WriteString
mov				eax, 0
mov				ax, bx
cwde
call			WriteDec
exit

term :
mov				edx, offset str3
call			WriteString
exit


main	ENDP
END	main

