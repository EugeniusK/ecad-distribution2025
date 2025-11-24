program = """.macro DEBUG_PRINT reg
csrw 0x800, \reg
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
    li   t6, 1           # hold value "1"
loop:
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else    # if (R >= D) then go else
    blez t5, end         # if i = 0 then end
    sub t5, t5, t6       # i = i - 1
    j    loop            # repeat loop
else:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    blez t5, end         # if i = 0 then end
    sub t5, t5, t6       # i = i - 1
    j    loop            # repeat loop
end:
    mv   a0, t0
    mv   a1, t1
    ret
return_zero:
    li   a0, 0
    li   a1, 0
    ret
"""

# print(program)

start = """.macro DEBUG_PRINT reg
csrw 0x800, \reg
.endm
	
.text
.global div              # Export the symbol 'div' so we can call it from other files
.type div, @function"""

init = """div:
    beqz a1, return_zero # if dividing by zero, return 0,0
    li   t0, 0           # Q = 0
    li   t1, 0           # R = 0
    li   t2, 0           # N_i = 0
    li   t3, 0           # mask_i = 0
    li   t4, 0           # condition variable (for loop)
    li   t5, 31          # loop variable (for loop)
    li   t6, 1           # hold value '1'"""

print(start)
print(init)
for i in range(31, -1, -1):
    shard = f"""loop{i}:    
    slli t1, t1, 1       # R = R << 1
    sll  t3, t6, t5      # mask_i = 1 << i   
    and  t2, a0, t3      # N_i = N & mask_i  
    srl  t2, t2, t5      # N_i = N_i >> i
    or   t1, t1, t2      # R = R | N_i
    bge  t1, a1, else{i}   # if (R >= D) then go else{i}
    sub t5, t5, t6       # i = i - 1"""
    print(shard)

for i in range(31, -1, -1):
    shard = f"""else{i}:
    sub  t1, t1, a1      # R = R - D
    or   t0, t0, t3      # Q = Q | mask_i
    sub t5, t5, t6       # i = i - 1
    j    loop{i-1}           # repeat loop"""
    print(shard)

end = """mv   a0, t0
    mv   a1, t1
    ret
return_zero:
    li   a0, 0
    li   a1, 0
    ret"""

print(end)

'''
A
if B then C

A2
if B then C2


'''