;名称: letterc
;功能: 将以0结尾的字符串中的小写字母转变成大写字母
;参数: ds:si指向字符串的首地址
;返回：ds:si指向字符串的末地址(0)
;特殊要求：空闲栈空间不小于2字节
letterc:
    pushf
letterc_s:
    cmp byte ptr [si],0
    je letterc_e
    cmp byte ptr [si],60h
    jb letterc_c
    and byte ptr [si],11011111b
    letterc_c:
        inc si
jmp short letterc
    letterc_e:
        popf
        ret