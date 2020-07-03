TITLE Program asm4filewrite(asm4filewrite.asm)

; ���α׷� ���� : ��ũ�� ������ �а� ����ϴ� ���α׷�
; ������ :			SCPJaehyeon
; ���� ���� :		20200515
; ���� ���� ���� :	20200515

INCLUDE c:\Irvine\Irvine32.inc

.data
filename		BYTE "datafile.txt", 0
BUF			BYTE		100 DUP(0), 0dh, 0ah,0
FILEBUF		BYTE		100 DUP(0)
msg0_0	BYTE		">> ��ũ ���� ���� ���μ���",0dh, 0ah, 0
msg0_1	BYTE		">> 10�� ������ ���ڿ��� �Է��ϼ��� (����=Enter)",0dh, 0ah, 0
msg0_2	BYTE		"1234567890", 0dh, 0ah, 0
msg1_0	BYTE		">> ��ũ ���� �б� ���μ���",0dh, 0ah, 0
msg2_0	BYTE		">> Disk write process is terminated !",0dh, 0ah, 0

.code
main			PROC
	mov				edx, offset msg0_0
	call			WriteString
	jmp				try_open
try_open:
	mov				edx, offset filename
	call			CreateOutputFile
	mov				ebx, eax
	cmp				eax, 0
	jnz				good_write
	call			WriteWindowsMsg
	jmp				zeroskip

good_write:
	mov				edx, offset msg0_1
	call			WriteString
	mov				edx, offset msg0_2
	call			WriteString
	mov				edx, offset BUF
	mov				ecx, 12
	call			ReadString
	cmp				eax, 0
	jz				zeroskip
	mov				eax, ebx
	mov				edx, offset BUF
	mov				ecx, 12
	call			WriteToFile
	call			Crlf
	jmp				good_write

zeroskip:
	mov				edx, offset msg2_0
	call			WriteString
	mov				eax, ebx
	call			CloseFile
	mov				edx, offset msg1_0
	call			WriteString
	mov				edx, offset filename
	call			OpenInputFile
	mov				ebx, eax
	cmp				eax, 0
	jnz				good_open
	call			WriteWindowsMsg

good_open:
	mov				eax, ebx
	mov				edx, offset BUF
	mov				ecx, 100
	call			ReadFromFile
	mov				edx, offset BUF
	jnc				good_read
	call			WriteWindowsMsg

good_read:
	call			WriteString
	add				edx, 12
	call			Crlf
	sub				eax, 12
	cmp				eax, 0
	jnz				good_read
	jmp				good_end

good_end:
	mov				eax, ebx
	call			CloseFile
	call			Crlf
	mov				edx, offset msg2_0
	call			WriteString
	exit


main	ENDP
END	main

