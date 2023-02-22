.data
	str: .space 901
	formatscan:.asciz "%901[^\n]"
//	str: .asciz "2 33 add"
	chDelim: .asciz " "
	formatPrintf: .asciz "%d\n"
	nr: .space 10
	res: .space 4 
.text

.global main

main:
	pushl $str
	pushl $formatscan
	call scanf
	popl %ebx
	popl %ebx

	pushl $chDelim
	pushl $str
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax, res
	
        pushl res
        call atoi
        popl %ebx
	pushl %eax
//	movl %eax, nr

//	pushl nr				# este deja un pointer
//	pushl $formatPrintf
//	call printf
//	popl %ebx
//	popl %ebx
	
et_for:
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	cmp $0, %eax
	je exit
	
	movl %eax, res
	
	movl res,  %edx
	xorl %ecx, %ecx
	movb (%edx, %ecx, 1), %al
//	movb %al, nr
	
	cmp $100, %al
	je div
	cmp $97, %al
	je add 
	cmp $115, %al
	je sub
	cmp $109, %al
	je mul
numar:
        pushl res
        call atoi
        popl %ebx
        pushl %eax

//        pushl res
 //       call atoi
//        popl %ebx
//      pushl %eax
//        movl %eax, nr

//	pushl nr				# este deja un pointer
//	pushl $formatPrintf
//	call printf
//	popl %ebx
//	popl %ebx
	
	jmp et_for	

add:
	xorl %eax, %eax
	xorl %edx, %edx
	popl %eax
	popl %edx
	addl %eax, %edx
	pushl %edx
	jmp et_for
mul:
	xorl %eax, %eax
	xorl %edx, %edx
	popl %eax
	popl %edx
	mull %edx
	pushl %eax
	jmp et_for
sub:
        xorl %eax, %eax
        xorl %edx, %edx
        popl %eax
        popl %edx
        subl %eax, %edx
        pushl %edx
	jmp et_for
div:
        xorl %eax, %eax
        xorl %edx, %edx
	xorl %esi, %esi
	popl %esi
	popl %eax
	divl %esi
	pushl %eax
	jmp et_for
exit:
	popl %eax
	movl %eax, nr
	pushl nr
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

