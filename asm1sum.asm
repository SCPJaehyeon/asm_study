TITLE Program asm1sum(asm1sum.asm)

; ���α׷� ���� : 1���� 10������ ���� ���� ����ϴ� ���α׷�
; ������ : SCPJaehyeon
; ���� ���� : 20200415
; ���� ���� ���� : 20200416

INCLUDE c:\Irvine\Irvine32.inc

.data
Str_data db "1 + 2 + 3 ... + 10 = ", 0 ; String ��� ���� ����

.code
main PROC ; Main PROC

mov		ecx, 10 ; ecx�� 10�� mov
xor		eax, eax ; eax <- 0

LP : ; LOOP
add		eax, ecx ; eax + ecx
loop	LP ; LOOP �ݺ�, ecx 1�� ����
mov edx, offset Str_data ; edx�� Str_data �ּ� mov
call writeString ; Str_data ���

call WriteDec ; eax 10���� ���
call Crlf ; ���� �ѱ��
call DumpRegs ; �������� ����


exit ; ����

main ENDP ; Main ENDP

END main ;
