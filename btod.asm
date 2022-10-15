;名称：btod
;功能：将word型数据转变为表示十进制数的字符串，，字符串以0为结尾符
;参数：(ax)=word型数据
;      ds:si指向字符串的首地址
;返回：无
;特殊要求：(1)需要可用的栈空间不小于[（显示的数字数）+5/6]字节
;         (2)采用被除数为32位的除法，注意溢出
btod:
    push dx
    push ax
    push cx
    push di
    
    btod_s:
        mov cx,10
        mov dx,0
        div cx
        mov [si],dl
        add byte ptr [si],30h
        inc si
        mov cx,ax
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
                ; sub cx,bx
                jcxz upside_down_e
            jmp upside_down_s0
        upside_down_e:
            pop di
            pop cx
            pop ax
            pop dx
            ret 

;子程序btod结束