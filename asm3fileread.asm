TITLE Program asm3fileread(asm3fileread.asm)

; ���α׷� ���� : ��ũ�� ������ �а� ����ϴ� ���α׷�
; ������:			SCPJaehyeon
; ���� ���� :		20200421
; ���� ���� ���� :	20200421

INCLUDE c:\Irvine\Irvine32.inc
BUF_SIZE = 240

.data
filename		BYTE "newfile.txt", 0
BUF				BYTE BUF_SIZE DUP(? )
good     		BYTE "Good processed !", 0dh, 0ah, 0
Nogood			BYTE "File open or write error !", 0dh, 0ah, 0

.code
main			PROC
mov				edx, offset filename
call			OpenInputFile			; �Է����� ����
mov				ebx, eax				; �ڵ� ebx�� mov
cmp				eax, 0					; ���� ���� Ȯ��
jnz				good_open				; eax != 0 ����open
call			WriteWindowsMsg			; open ����
jmp				terminate

good_open :
	mov			eax, ebx
	mov			edx, offset BUF
	mov			ecx, BUF_SIZE
	call		ReadFromFile			; ���� ���� �б�
	jnc			good_read				; cf=0�̸� jmp
	call		WriteWindowsMsg			; open ����
	jmp			terminate

good_read :		
	mov			edx, offset BUF			; ���۳��� edx�� mov
	call		WriteString				; edx ���
	call		Crlf
	jmp			good_end

good_end :								; �ڵ� �ݱ�
	mov			eax, ebx
	call		CloseFile
	mov			edx, offset good
	call		WriteString
	exit

terminate :
	mov			edx, offset nogood
	call		WriteString
	call		WaitMsg
	exit

main	ENDP
END	main

