TITLE Program asm2inputprint(asm2inputprint.asm)

; ���α׷� ���� :	���ڿ� �Է¹ް� ����ϴ� ���α׷�
; ������ :	SCPJaehyeon
; ���� ���� :	20200415
; ���� ���� ���� :	20200421

INCLUDE c:\Irvine\Irvine32.inc

.data
Ask			BYTE "INPUT : ", 0
Len			BYTE "Length : ", 0
Output		BYTE "OUTPUT : ", 0
Answer		BYTE 50 DUP(?)

.code
main PROC

START:
	mov		edx, 0
	mov		edx, OFFSET Ask
	call	WriteString				; ASK �ȳ��� ���
	mov		edx, OFFSET Answer
	mov		esi, edx
	mov		ecx, SIZEOF Answer - 1
	call	ReadString				; ���ڿ� �б�
	call	Crlf
	mov		edx, 0
	mov		edx, OFFSET Len
	call	WriteString				; Len �ȳ��� ���
	mov		edx, 0
	mov		edx, OFFSET Answer
	call	StrLength				; ���ڿ� ���� ���
	call	WriteDec				; ���ڿ� ���� eax ���
	call	Crlf
	call	Crlf
	cmp		eax, 0					; ���ڿ� ���� 0 ��
	jz		LOUT					; ���� 0�� ��� ���α׷� ����
	mov		edx, 0
	mov		edx, OFFSET Output
	call	WriteString				; OUTPUT �ȳ��� ���
	mov		edx, 0
	mov		edx, OFFSET Answer
	call	WriteString				; �Է��� ���ڿ� ���
	call	 Crlf
	mov		ecx, eax				; �޸� ���� ��� ���� ����
	call	DumpMem					; �޸� ���� ���
	call	Crlf
	call	START					; �ݺ�

LOUT:		exit					; ����������

main ENDP
END main
