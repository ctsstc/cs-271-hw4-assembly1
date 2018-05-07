section .text
global _start       ; for linker


;;; Variables
section .data
x DD 0
y DD 0
z DD 0
a DD 0


;;; HW 4
;1. x = 2                           x:2
;2. y = x + 4                       y:6
;3. z = y – (x + 1)                 z:3
;4. a = (x + z) * (y / 2) + z^2     a:24 5*3+9z = 24
;5. x = a + z                       x:27
;;; put x,   y,   z,   a    in registers 
;;;     eax, ebx, ecx, edx, respectively. 


_start:             ; label


;1. x = 2
mov eax, 2          ; eax = 2; 2 into eax register
mov [x], eax        ; x = eax; eax into var x


;2. y = x + 4 = 6
mov eax, 4          ; eax = 4; 4 into eax register
add eax, [x]        ; eax += x; add x to eax register
mov [y], eax        ; y = eax; eax into y var


;3. z = y – (x + 1) = 3
mov eax, [x]        ; eax = x; load x into eax
inc eax             ; eax++; increase eax by 1
mov ebx, [y]        ; ebx = y; load y into ebx
sub ebx, eax        ; ebx -= eax; subtract eax from ebx
mov [z], ebx        ; z = ebx


;4. a = (x + z) * (y / 2) + z^2 = 5*3+9 = 24

; Complexicated division: (edx:eax)/ebx
mov eax, [y]        ; eax = y
mov edx, 0          ; edx = 0; zero dividend left
mov ebx, 2          ; ebx = 2; prepare the divisor
div ebx             ; eax = eax / ebx; (y / 2) = 3

; Addition
mov ebx, [x]        ; ebx = x
mov ecx, [z]        ; ecx = z
add ebx, ecx        ; ebx += ecx; (x + z)

; Multiplication
mul ebx             ; eax * ebx; (y / 2) * (x + z) = 15
mov [a], eax        ; a = eax; good checkpoint

mov eax, [z]        ; eax = z; prep multiplication
mov ebx, [z]        ; ebx = z; dirty square
mul ebx             ; eax * ebx; z^2 = 9

mov ebx, [a]        ; ebx = a
add [a], eax        ; a += eax ; (x + z) * (y / 2) + z^2 = 24


;5. x = a + z = 27
mov eax, [a]        ; eax = a
mov [x], eax        ; x = eax; x = a
mov eax, [z]        ; eax = z
add [x], eax        ; x += eax; x += z

;;; put x,   y,   z,   a    in registers 
;;;     eax, ebx, ecx, edx, respectively. 

mov eax, [x]        ; eax = x = 27
mov ebx, [y]        ; ebx = y = 6
mov ecx, [z]        ; ecx = z = 3
mov edx, [a]        ; edx = a = 24