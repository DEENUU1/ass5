.model small
.stack 100h
.data
    lancuch db 'ABCDEF$', 0
.code
start:
    ; ustaw segment danych
    mov ax, @data
    mov ds, ax

    ; ustaw wskaźnik SI na początek łańcucha
    mov si, offset lancuch
petla:
    ; sprawdź, czy to znak '$' – jeśli tak skocz do końca
    cmp byte ptr [si], '$'
    je koniec

    ; zamień bieżący znak na 'x'
    mov byte ptr [si], 'x'

    ; przejdź do kolejnego znaku
    inc si

    ; wróć do początku pętli
    jmp petla
koniec:
    ; wypisz cały łańcuch  -> xxxxxx
    mov dx, offset lancuch
    mov ah, 09h
    int 21h

    ; zakończ program
    mov ax, 4C00h
    int 21h
end start
