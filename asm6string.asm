TITLE Program asm6string(asm6string.asm)

; ���α׷� ���� : ���ڿ� ��, ���� Ž�� ���α׷�
; ������:			SCPJaehyeon
; ���� ���� : 20200602
; ���� ���� ���� : 20200603

INCLUDE c:\Irvine\Irvine32.inc

.data
input_fir		BYTE		100 DUP(? )
input_sec		BYTE		100 DUP(? )
input_thr		BYTE		100 DUP(? )
input_fou		BYTE		2 DUP(? )
str1		BYTE			">> �⺻ ���ڿ� : ", 0
str2		BYTE			">> ���� ���ڿ� : ", 0
res_match	BYTE			".. �� ���ڿ��� ��ġ�մϴ� !", 0dh, 0ah, 0
res_nomatch	BYTE			".. �� ���ڿ��� ��ġ���� �ʽ��ϴ� !", 0dh, 0ah, 0
str3		BYTE			">> �� �� �� : ", 0
str4		BYTE			">> ã�� ���� : ", 0
res_fnd		BYTE			".. ã�� ���� ��ġ : ", 0
res_notfnd	BYTE			".. ���� ã�� ���� !", 0dh, 0ah, 0

.code
main	PROC
mov				edx, offset str1
call			WriteString
mov				edx, offset input_fir
mov				ecx, 100
call			ReadString
mov				ebx, eax
mov				edx, offset str2
call			WriteString
mov				edx, offset input_sec
mov				ecx, 100
call			ReadString
inc				ebx
mov				ecx, ebx
xor				esi, esi
L1 :
inc				esi
mov				eax, 0
mov				edx, 0
mov				al, byte ptr input_fir[esi - 1]
mov				dl, byte ptr input_sec[esi - 1]
cmp				dl, al
loopz			L1
cmp				esi, ebx
jz				success
mov				edx, offset res_nomatch
call			WriteString
call			Crlf
jmp				fndstr

success:
mov				edx, offset res_match
call			WriteString
call			Crlf
jmp				fndstr

fndstr:
mov				edx, offset str3
call			WriteString
mov				edx, offset input_thr
mov				ecx, 100
call			ReadString
mov				ebx, eax
mov				edx, offset str4
call			WriteString
mov				edx, offset input_fou
mov				ecx, 2
call			ReadString
inc				ebx
mov				ecx, ebx
mov				esi, 0
L2 :
inc				esi
mov				eax, 0
mov				edx, 0
mov				al, byte ptr input_fir[esi - 1]
mov				dl, byte ptr input_fou
cmp				al, dl
loopnz			L2
cmp				esi, ebx
jz				fndfail
mov				edx, offset res_fnd
call			WriteString
mov				eax, esi
call			WriteDec		
exit

fndfail:
mov				edx, offset res_notfnd
call			WriteString
exit

main	ENDP
END		main