;名称：divdw
;功能：进行不会产生溢出的除法运算，被除数为dword型，除数为word型，结果为dword型。
;参数：(ax)=dword型数据的低16位
;     (dx)=dword型数据的高16位 
;     (cx)＝除数
;返回： (dx)＝结果的高16位，(ax)=结果的低16位 （cx）＝余数
;特殊要求：栈的可用空间不小于3/4字节
divdw:
    push bx
    push ax
    mov ax,dx
    mov dx,0
    div cx
    mov bx,ax 
    pop ax
    div cx
    mov cx,dx
    mov dx,bx
    pop bx
    ret  
；子程序divdw结束