.data 
  entermsg: .asciiz "Please enter the required numbers: "
  entered: .asciiz "The entered numbers are: "
  value: .asciiz "Please enter the value to be searched: "
  found: .asciiz "             Value is found"
  notfound: .asciiz "          Value is not found"
  space: .asciiz "\n"
  tinyspace: .asciiz " "
  arr: .word 5

.text

main:

#print enter message
la $a0, entermsg
li $v0, 4
syscall

#No. of elements
li $t0, 5

#load address of array
la $s0, arr

#reading elments by Read subroutine
jal Read
 

#print 2 empty lines
la $a0, space
li $v0, 4
syscall

la $a0, space
li $v0, 4
syscall

#print entered value msg
la $a0, entered
li $v0, 4
syscall


#load address of array
la $s0, arr

jal disply

#print empty line
la $a0, space
li $v0, 4
syscall

#print search value msg
la $a0, value
li $v0, 4
syscall

#input value to be searched for in array
li $v0, 5
syscall

move $a0, $v0
li $v0, 1
syscall
move $t1, $a0 #$t1 contain value to be searched

#load address of array
la $s0, arr


#print 2 empty lines
la $a0, space
li $v0, 4
syscall

la $a0, space
li $v0, 4
syscall

jal search



#################################

Read:

#counter
li $s1, 0

loopR: 
beq $s1, $t0, exit1

#input 1 element
li $v0, 5
syscall

sw $v0, 0($s0)

addi $s0, $s0, 4
addi $s1, $s1, 1

j loopR

exit1: jr $ra

#################################

disply:

#counter
li $s1, 0

loopD:
beq $s1, $t0, exit2

lw $a0, 0($s0)
li $v0, 1
syscall

la $a0, tinyspace
li $v0, 4
syscall

addi $s0, $s0, 4
addi $s1, $s1, 1

j loopD

exit2: jr $ra

#################################

search:

#counter
li $s1, 0

loopS:
beq $s1, $t0, notFound1

lw $s2, 0($s0)

beq $s2, $t1, Found1

addi $s0, $s0, 4
addi $s1, $s1, 1


j loopS


notFound1: 
la $a0, notfound
li $v0, 4
syscall

j end

Found1: 
la $a0, found
li $v0, 4
syscall


end:
li $v0, 10
syscall












