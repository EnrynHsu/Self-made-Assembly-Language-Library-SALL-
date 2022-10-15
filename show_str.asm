;名称：show_str
;功能：在指定的位置，用指定的颜色，显示一个用0结束的字符串。
;参数：（dh）＝行号（取值范围0~24), （dl）＝列号（取值范围0～79），（cl）＝颜颜色，ds：si指向字符串的首地址
;返回：ds:si最后指向字符串末尾(0)
;特殊要求：需要可用的栈大小不小于7/8字节
show_str:
    push es
    push ax
    push dx
    push di
    push bx
    
    mov al,2
    mul dl
    mov dl,al
    mov ax,0b800h
    mov es,ax
    mov al,dh
    mov dh,0a0h
    mul dh
    mov dh,0
    add dx,ax
    mov bx,dx
    show_str_s:
        push cx
        mov cl,[si]
        mov ch,0
        jcxz show_str_e
        mov es:[bx],cl
        inc bx
        inc si
        pop cx
        mov es:[bx],cl
        inc bx
    jmp show_str_s
    show_str_e:
        pop cx

        pop bx
        pop di
        pop dx
        pop ax
        pop es
        
        ret  

;子程序show_str结束