.macro DEBUG_PRINT reg
csrw 0x800, 
eg
.endm
	
.text
.global div              # Export the symbol 'div' so we can call it from other files
.type div, @function
div:
    beqz a1, return_zero # if dividing by zero, return 0,0
    li   t0, 0           # Q = 0
    li   t1, 0           # R = 0
    li   t2, 0           # N_i = 0
    li   t3, 0           # mask_i = 0
    li   t4, 0           # condition variable (for loop)
    li   t5, 31          # loop variable (for loop)
    li   t6, 1           # hold value '1'
loop31:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else31   # if (R >= D) then go else31
    sub t5, t5, t6       # i = i - 1
loop30:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else30   # if (R >= D) then go else30
    sub t5, t5, t6       # i = i - 1
loop29:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else29   # if (R >= D) then go else29
    sub t5, t5, t6       # i = i - 1
loop28:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else28   # if (R >= D) then go else28
    sub t5, t5, t6       # i = i - 1
loop27:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else27   # if (R >= D) then go else27
    sub t5, t5, t6       # i = i - 1
loop26:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else26   # if (R >= D) then go else26
    sub t5, t5, t6       # i = i - 1
loop25:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else25   # if (R >= D) then go else25
    sub t5, t5, t6       # i = i - 1
loop24:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else24   # if (R >= D) then go else24
    sub t5, t5, t6       # i = i - 1
loop23:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else23   # if (R >= D) then go else23
    sub t5, t5, t6       # i = i - 1
loop22:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else22   # if (R >= D) then go else22
    sub t5, t5, t6       # i = i - 1
loop21:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else21   # if (R >= D) then go else21
    sub t5, t5, t6       # i = i - 1
loop20:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else20   # if (R >= D) then go else20
    sub t5, t5, t6       # i = i - 1
loop19:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else19   # if (R >= D) then go else19
    sub t5, t5, t6       # i = i - 1
loop18:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else18   # if (R >= D) then go else18
    sub t5, t5, t6       # i = i - 1
loop17:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else17   # if (R >= D) then go else17
    sub t5, t5, t6       # i = i - 1
loop16:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else16   # if (R >= D) then go else16
    sub t5, t5, t6       # i = i - 1
loop15:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else15   # if (R >= D) then go else15
    sub t5, t5, t6       # i = i - 1
loop14:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else14   # if (R >= D) then go else14
    sub t5, t5, t6       # i = i - 1
loop13:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else13   # if (R >= D) then go else13
    sub t5, t5, t6       # i = i - 1
loop12:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else12   # if (R >= D) then go else12
    sub t5, t5, t6       # i = i - 1
loop11:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, -2048      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else11   # if (R >= D) then go else11
    sub t5, t5, t6       # i = i - 1
loop10:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 1024      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else10   # if (R >= D) then go else10
    sub t5, t5, t6       # i = i - 1
loop9:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 512      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else9   # if (R >= D) then go else9
    sub t5, t5, t6       # i = i - 1
loop8:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 256      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else8   # if (R >= D) then go else8
    sub t5, t5, t6       # i = i - 1
loop7:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 128      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else7   # if (R >= D) then go else7
    sub t5, t5, t6       # i = i - 1
loop6:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 64      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else6   # if (R >= D) then go else6
    sub t5, t5, t6       # i = i - 1
loop5:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 32      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else5   # if (R >= D) then go else5
    sub t5, t5, t6       # i = i - 1
loop4:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 16      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else4   # if (R >= D) then go else4
    sub t5, t5, t6       # i = i - 1
loop3:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 8      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else3   # if (R >= D) then go else3
    sub t5, t5, t6       # i = i - 1
loop2:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 4      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else2   # if (R >= D) then go else2
    sub t5, t5, t6       # i = i - 1
loop1:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 2      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else1   # if (R >= D) then go else1
    sub t5, t5, t6       # i = i - 1
loop0:    
    slli t1, t1, 1       # R = R << 1
    andi  t2, a0, 1      # N_i = N & mask_i (immediate)
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else0   # if (R >= D) then go else0
    j    end
else31:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop30           # repeat loop
else30:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop29           # repeat loop
else29:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop28           # repeat loop
else28:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop27           # repeat loop
else27:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop26           # repeat loop
else26:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop25           # repeat loop
else25:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop24           # repeat loop
else24:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop23           # repeat loop
else23:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop22           # repeat loop
else22:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop21           # repeat loop
else21:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop20           # repeat loop
else20:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop19           # repeat loop
else19:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop18           # repeat loop
else18:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop17           # repeat loop
else17:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop16           # repeat loop
else16:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop15           # repeat loop
else15:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop14           # repeat loop
else14:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop13           # repeat loop
else13:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop12           # repeat loop
else12:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop11           # repeat loop
else11:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop10           # repeat loop
else10:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 1024      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop9           # repeat loop
else9:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 512      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop8           # repeat loop
else8:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 256      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop7           # repeat loop
else7:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 128      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop6           # repeat loop
else6:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 64      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop5           # repeat loop
else5:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 32      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop4           # repeat loop
else4:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 16      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop3           # repeat loop
else3:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 8      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop2           # repeat loop
else2:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 4      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop1           # repeat loop
else1:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 2      # Q = Q | mask_i (immediate)
    sub t5, t5, t6       # i = i - 1
    j    loop0           # repeat loop
else0:
    sub  t1, t1, a1      # R = R - D
    ori   t0, t0, 1      # Q = Q | mask_i (immediate)
end:
    mv   a0, t0
    mv   a1, t1
    ret
return_zero:
    li   a0, 0
    li   a1, 0
    ret
