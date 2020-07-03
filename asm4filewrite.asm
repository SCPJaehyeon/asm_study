TITLE Program asm4filewrite(asm4filewrite.asm)

; 프로그램 설명문 : 디스크의 파일을 읽고 출력하는 프로그램
; 개발자 :			SCPJaehyeon
; 개발 일자 :		20200515
; 최종 수정 일자 :	20200515

INCLUDE c:\Irvine\Irvine32.inc

.data
filename		BYTE "datafile.txt", 0
BUF			BYTE		100 DUP(0), 0dh, 0ah,0
FILEBUF		BYTE		100 DUP(0)
msg0_0	BYTE		">> 디스크 파일 쓰기 프로세스",0dh, 0ah, 0
msg0_1	BYTE		">> 10자 길이의 문자열을 입력하세요 (종료=Enter)",0dh, 0ah, 0
msg0_2	BYTE		"1234567890", 0dh, 0ah, 0
msg1_0	BYTE		">> 디스크 파일 읽기 프로세스",0dh, 0ah, 0
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

