TITLE Program asm7bubblesort(asm7bubblesort.asm)

; ���α׷� ���� : ���� ���� ���α׷�
; ������:	SCPJaehyeon
; ���� ���� : 20200602
; ���� ���� ���� : 20200603

INCLUDE c:\Irvine\Irvine32.inc


.data
num			BYTE		98, 54, 76, 23, 12, 89, 45, 32, 67, 3, 127	; �߰� ���� ����
str1		BYTE			">> ���� �ʱ� �� : ", 0
str2		BYTE			">> ���� ���� �� : ", 0

.code
main		PROC
mov			edx, offset str1
call		WriteString
xor			esi, esi
mov			esi, offset num
mov			ecx, sizeof num - 1

L1:									; �ʱ� ������ ���
mov			eax, 0
inc			esi
mov			al, BYTE ptr[esi - 1]
call		WriteDec
mov			al, ' '
call		WriteChar
loop		L1

call		Crlf
call		Crlf
mov			edx, offset str2
call		WriteString

mov			al, sizeof num - 1		; �������� ��Ƚ�� N*(N - 1) / 2, ���
mov			cl, sizeof num - 2
mul			cl
shr			ax, 1
mov			cx, ax
mov			ebp, sizeof num - 1
ebagain:							; ebx �ʱ�ȭ
mov			ebx, 0
dec			ebp
L2 :								; �������� ����
cmp			ebx, ebp
jz			ebagain
mov			eax, 0
mov			edx, 0
mov			al, num[ebx]
mov			dl, num[ebx + BYTE]
cmp			al, dl
jg			change
jmp			continu
change:
mov			al, num[ebx]
mov			dl, num[ebx + BYTE]
xchg		al, dl					; ���� ����
mov			num[ebx], al
mov			num[ebx + BYTE], dl
jmp			continu
continu:
inc			ebx
loop		L2

mov			esi, 0
mov			esi, offset num
mov			ecx, sizeof num - 1
mov			ebx, 0

L3:									; ������ ���� ���
mov			eax, 0
inc			esi
mov			al, BYTE ptr[esi - 1]
call		WriteDec
mov			al, ' '
call		WriteChar
loop		L3

call		Crlf

exit
main		ENDP

END		main