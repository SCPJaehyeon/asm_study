TITLE Program asm7bubblesort(asm7bubblesort.asm)

; 프로그램 설명문 : 버블 정렬 프로그램
; 개발자:	SCPJaehyeon
; 개발 일자 : 20200602
; 최종 수정 일자 : 20200603

INCLUDE c:\Irvine\Irvine32.inc


.data
num			BYTE		98, 54, 76, 23, 12, 89, 45, 32, 67, 3, 127	; 추가 공간 만듦
str1		BYTE			">> 변수 초기 값 : ", 0
str2		BYTE			">> 버블 정열 값 : ", 0

.code
main		PROC
mov			edx, offset str1
call		WriteString
xor			esi, esi
mov			esi, offset num
mov			ecx, sizeof num - 1

L1:									; 초기 변수값 출력
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

mov			al, sizeof num - 1		; 버블정열 비교횟수 N*(N - 1) / 2, 계산
mov			cl, sizeof num - 2
mul			cl
shr			ax, 1
mov			cx, ax
mov			ebp, sizeof num - 1
ebagain:							; ebx 초기화
mov			ebx, 0
dec			ebp
L2 :								; 버블정열 시작
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
xchg		al, dl					; 스왑 수행
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

L3:									; 정열된 변수 출력
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