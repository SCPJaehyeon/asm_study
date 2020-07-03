TITLE Program asm3fileread(asm3fileread.asm)

; 프로그램 설명문 : 디스크의 파일을 읽고 출력하는 프로그램
; 개발자:			SCPJaehyeon
; 개발 일자 :		20200421
; 최종 수정 일자 :	20200421

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
call			OpenInputFile			; 입력파일 열기
mov				ebx, eax				; 핸들 ebx로 mov
cmp				eax, 0					; 정상 오픈 확인
jnz				good_open				; eax != 0 정상open
call			WriteWindowsMsg			; open 오류
jmp				terminate

good_open :
	mov			eax, ebx
	mov			edx, offset BUF
	mov			ecx, BUF_SIZE
	call		ReadFromFile			; 파일 내용 읽기
	jnc			good_read				; cf=0이면 jmp
	call		WriteWindowsMsg			; open 오류
	jmp			terminate

good_read :		
	mov			edx, offset BUF			; 버퍼내용 edx로 mov
	call		WriteString				; edx 출력
	call		Crlf
	jmp			good_end

good_end :								; 핸들 닫기
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

