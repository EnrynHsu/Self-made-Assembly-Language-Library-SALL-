;名称：btod_dw
;功能：将dword型数据转变为表示十进制数的字符串，，字符串以0为结尾符
;参数：(ax)=dword型数据的低16位
;      (dx)=dword型数据的高16位
;      ds:si指向字符串的首地址
;返回：无
;特殊要求：(1)需要可用的栈空间不小于[（显示的数字数）+5/6]字
;        (2)本程序需要子程序divdw(近转移)
btod_dw:
    push dx
    push ax
    push cx
    push di
    mov di,si
    
    btod_s:
        mov cx,10
        call divdw
        mov [si],cl
        add byte ptr [si],30h
        inc si
        mov cx,ax
        jcxz upside_down_befor
    jmp btod_s

    upside_down_before:
        mov cx,dx
    jcxz upside_down
    jmp btod_s

    upside_down:
        mov byte ptr [si],0
        mov ax,si
        upside_down_s:
            dec si
            push [si]
            mov cx,si
            sub cx,di
            jcxz upside_down_
        jmp upside_down_s
        upside_down_:
            mov si,ax
            upside_down_s0:
                dec si
                pop ax
                mov [si],al
                mov cx,si
                sub cx,di
                jcxz upside_down_e
            jmp upside_down_s0

        upside_down_e:
            pop di
            pop cx
            pop ax
            pop dx
            
            ret 
;子程序btod_dw结束