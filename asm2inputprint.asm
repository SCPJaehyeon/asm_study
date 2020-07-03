TITLE Program asm2inputprint(asm2inputprint.asm)

; 프로그램 설명문 :	문자열 입력받고 출력하는 프로그램
; 개발자 :	SCPJaehyeon
; 개발 일자 :	20200415
; 최종 수정 일자 :	20200421

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
	call	WriteString				; ASK 안내문 출력
	mov		edx, OFFSET Answer
	mov		esi, edx
	mov		ecx, SIZEOF Answer - 1
	call	ReadString				; 문자열 읽기
	call	Crlf
	mov		edx, 0
	mov		edx, OFFSET Len
	call	WriteString				; Len 안내문 출력
	mov		edx, 0
	mov		edx, OFFSET Answer
	call	StrLength				; 문자열 길이 계산
	call	WriteDec				; 문자열 길이 eax 출력
	call	Crlf
	call	Crlf
	cmp		eax, 0					; 문자열 길이 0 비교
	jz		LOUT					; 길이 0일 경우 프로그램 종료
	mov		edx, 0
	mov		edx, OFFSET Output
	call	WriteString				; OUTPUT 안내문 출력
	mov		edx, 0
	mov		edx, OFFSET Answer
	call	WriteString				; 입력한 문자열 출력
	call	 Crlf
	mov		ecx, eax				; 메모리 덤프 출력 길이 지정
	call	DumpMem					; 메모리 덤프 출력
	call	Crlf
	call	START					; 반복

LOUT:		exit					; 빠져나가기

main ENDP
END main
