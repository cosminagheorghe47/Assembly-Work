.data
	zer: .long 0
	mmm: .long 35
	a: .long 97
	str: .space 901
	v: .space 150
	formatscan:.asciz "%901[^\n]"
//	str: .asciz "x 1 let x 2 add y 10 let y x sub mul"
	chDelim: .asciz " "
	formatPrintf: .asciz "%d\n"
	nr: .space 10
	res: .space 4
	zero: .long 48
	noua: .long 57 
.text

.global main

main:
	movl $v, %edi

        xorl %ecx, %ecx
	xorl %edx, %edx
	movl zer, %edx
for:
        cmp mmm, %ecx
        je gata
//        movl $v, %edi
        movl %edx, (%edi, %ecx, 4)
        incl %ecx
        jmp for
gata:

	pushl $str
	pushl $formatscan
	call scanf
	popl %ebx
	popl %ebx

//	xorl %edi, %edi

	pushl $chDelim
	pushl $str
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax, res

	movl res,  %edx
        xorl %ecx, %ecx
        movb (%edx, %ecx, 1), %al

	cmp $48, %al
        jae compnr


//        pushl res
  //      call atoi
//        popl %ebx
//	pushl %eax
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

	xorl %esi, %esi
//	xorl %edi, %edi

	cmp $0, %eax
	je exit
	
	movl %eax, res
	
	movl res,  %edx
	xorl %ecx, %ecx
	movb (%edx, %ecx, 1), %al
//	movb %al, nr
	
	cmp zero, %al
	jae compnr

carac:
	cmp $108, %al
	je let
	cmp $100, %al
	je div
	cmp $97, %al
	je add 
	cmp $115, %al
	je sub
	cmp $109, %al
	je mul
variabila:
//	movb (%edx, %

	xorl %esi, %esi
	xorl %ebx, %ebx
//	xorl %eax, %eax
	movb %al, %bl
	movl %ebx, %esi
	xorl %ebx, %ebx
	movl a, %eax
	subl %eax, %esi
variabilafor:
	movl (%edi, %esi, 4), %ebx
	cmp $0, %ebx
	je adaugavec

	jmp adaugastiva

//	incl %ecx
//	incl %ecx
//	jmp variabilafor

//	jmp et_for
adaugavec:
	pushl $chDelim
        pushl $0
        call strtok
        popl %ebx
        popl %ebx 

	movl %eax, res
	pushl res
        call atoi
        popl %ebx

	movl %eax, (%edi, %esi, 4)
	jmp et_for
adaugastiva:
//	movl (%edi, %esi, 4), %eax
	pushl %ebx
	jmp et_for
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

let:
 
	addl $1, %ecx
        movb (%edx, %ecx, 1), %al
        subl $1, %ecx
        cmp $0, %al
        je variabila

/*
	xorl %eax, %eax
        xorl %edx, %edx
        popl %eax
        popl %edx
	mov %eax, (%edi, %esi, 1)
        incl %esi
	pushl %eax
*/
	jmp et_for

add:
	addl $1, %ecx
	movb (%edx, %ecx, 1), %al
	subl $1, %ecx
	cmp $0, %al
	je variabila

	xorl %eax, %eax
	xorl %edx, %edx
	popl %eax
	popl %edx
	addl %eax, %edx
	pushl %edx
	jmp et_for
mul:
        addl $1, %ecx
        movb (%edx, %ecx, 1), %al
        subl $1, %ecx
        cmp $0, %al
        je variabila

	xorl %eax, %eax
	xorl %edx, %edx
	popl %eax
	popl %edx
	mull %edx
	pushl %eax
	jmp et_for
sub:
        addl $1, %ecx
        movb (%edx, %ecx, 1), %al
        subl $1, %ecx
        cmp $0, %al
        je variabila

        xorl %eax, %eax
        xorl %edx, %edx
        popl %eax
        popl %edx
        subl %eax, %edx
        pushl %edx
	jmp et_for
div:
        addl $1, %ecx
        movb (%edx, %ecx, 1), %al
        subl $1, %ecx
        cmp $0, %al
        je variabila

        xorl %eax, %eax
        xorl %edx, %edx
	xorl %ebx, %ebx
	popl %ebx
	popl %eax
	divl %ebx
	pushl %eax
	jmp et_for
compnr:
	cmp $57, %al
	jbe numar
	cmp $57, %al
	ja carac
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
