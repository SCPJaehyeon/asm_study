TITLE Program asm1sum(asm1sum.asm)

; 프로그램 설명문 : 1부터 10까지의 합을 구해 출력하는 프로그램
; 개발자 : SCPJaehyeon
; 개발 일자 : 20200415
; 최종 수정 일자 : 20200416

INCLUDE c:\Irvine\Irvine32.inc

.data
Str_data db "1 + 2 + 3 ... + 10 = ", 0 ; String 출력 위해 정의

.code
main PROC ; Main PROC

mov		ecx, 10 ; ecx에 10을 mov
xor		eax, eax ; eax <- 0

LP : ; LOOP
add		eax, ecx ; eax + ecx
loop	LP ; LOOP 반복, ecx 1씩 감소
mov edx, offset Str_data ; edx에 Str_data 주소 mov
call writeString ; Str_data 출력

call WriteDec ; eax 10진수 출력
call Crlf ; 한줄 넘기기
call DumpRegs ; 레지스터 덤프


exit ; 종료

main ENDP ; Main ENDP

END main ;
