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

    ; pobierz 5. znak (indeks 4) i wypisz go
    mov dl, [si+4]
    mov ah, 02h
    int 21h

    ; pobierz 3. znak (indeks 2) i wypisz go
    mov dl, [si+2]
    mov ah, 02h
    int 21h

    ; pobierz 2. znak (indeks 1) i wypisz go
    mov dl, [si+1]
    mov ah, 02h
    int 21h

    ; zakończ program
    mov ax, 4C00h
    int 21h
end start
