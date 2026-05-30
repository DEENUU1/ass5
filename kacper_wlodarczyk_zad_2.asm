.model small
.stack 100h
.data
    lancuch db 'ABCDEF$', 0
.code
start:
    ; ustaw segment danych
    mov ax, @data
    mov ds, ax

    ; ustaw wskaźnik na początek łańcucha
    mov si, offset lancuch

    ; zamień znak o indeksie 3
    mov byte ptr [si+3], 'X'

    ; zamień znak o indeksie 4
    mov byte ptr [si+4], 'Y'

    ; zamień znak o indeksie 5
    mov byte ptr [si+5], 'Z'

    ; wypisz cały łańcuch zakończony znakiem '$'
    mov dx, offset lancuch
    mov ah, 09h
    int 21h

    ; zakończ program
    mov ax, 4C00h
    int 21h
end start
