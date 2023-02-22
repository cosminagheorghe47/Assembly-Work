.data
	str: .space 1601
	op: .space 10
	colind: .space 100
//	linind: .space 4
	formatscan:.asciz "%1601[^\n]"
//	str: .asciz "x 1 1 -6 let x 3 div"
	chDelim: .asciz " "
	formatPrintf: .asciz "%d "
	n: .space 4
	m: .space 4
	formatScanf: .asciz "%d"
	res: .space 4
	nr: .space 10
	l: .long 4
	sum: .space 10
	index: .space 4
	formatendl: .asciz "\n"
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

	movl $colind, %edi
	xorl %esi, %esi
	xorl %ecx, %ecx
et_for:
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	cmp $0, %eax
	je exitt
	
	movl %eax, res
	pushl %ecx
	movl res,  %edx
	xorl %ecx, %ecx
	movb (%edx, %ecx, 1), %al
	popl %ecx
	cmp $108, %al
	je let

	pushl res
        call atoi
        popl %ebx
	movl %eax, (%edi, %esi, 4)
//	incl %esi
	xorl %edx, %edx
	movl (%edi, %esi, 4), %edx
//	addl %edx, sum
	movl %edx, nr
	incl %esi
//	pushl nr				# este deja un pointer
//	pushl $formatPrintf
//	call printf
//	popl %ebx
//	popl %ebx

	
//	addl %edx, %ecx

	jmp et_for

let:
	movl $0, (%edi, %esi, 4)

	pushl $chDelim
        pushl $0
        call strtok
        popl %ebx
        popl %ebx 

	pushl $chDelim
        pushl $0
        call strtok
        popl %ebx
        popl %ebx
	movl %eax, res 

	pushl %ecx
	xorl %ecx, %ecx
        movb (%eax, %ecx, 1), %al
        popl %ecx
	cmp $114, %al
        je rot

	pushl res
        call atoi
        popl %ebx
	movl %eax, op
//	pushl op                                # este deja un pointer
//        pushl $formatPrintf
//        call printf
//        popl %ebx
//        popl %ebx

	pushl $chDelim
        pushl $0
        call strtok
        popl %ebx
        popl %ebx 
        
        movl %eax, res

        movl res,  %edx
        xorl %ecx, %ecx
        movb (%edx, %ecx, 1), %al

	cmp $100, %al
	je div
	cmp $97, %al
	je add 
	cmp $115, %al
	je sub
	cmp $109, %al
	je mul
add:
	xorl %esi, %esi
	xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
	movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
	incl %esi
	xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi

addfor:
	xorl %eax, %eax
	movl (%edi, %esi, 4), %eax
	cmp $0, %eax
	je exitt
	addl op, %eax
	movl %eax, sum
	pushl sum
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	incl %esi
	jmp addfor
sub:
	xorl %esi, %esi
        xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
	pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi

subfor:
	xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        cmp $0, %eax
        je exitt
        subl op, %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        jmp subfor
div:
	xorl %esi, %esi
        xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
divfor:
	xorl %eax, %eax
	xorl %edx, %edx
	xorl %ecx, %ecx
        movl (%edi, %esi, 4), %eax
        cmp $0, %eax
        je exitt
//	movb (%eax, %edx, 1), %al
//	cmp $45, %al
//	jl divneg
	cdq
	movl op, %ecx
        idivl %ecx
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        jmp divfor
mul:
        xorl %esi, %esi
        xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
mulfor:
	xorl %eax, %eax
        movl (%edi, %esi, 4), %eax
        cmp $0, %eax
        je exitt
        imull op
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        jmp mulfor

rot:
	movl %esi, index
	xorl %esi, %esi
	xorl %eax, %eax
	movl (%edi, %esi, 4), %eax
	movl %eax, n
	incl %esi
	movl (%edi, %esi, 4), %eax
        movl %eax, m
	incl %esi
	pushl m
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
	pushl n
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
//	jmp exitt
	xorl %ebx, %ebx
	movl n, %ebx
	cmp %eax, %ebx
	jbe n_mic
	cmp %eax, %ebx
	ja n_mic
n_mic:
	xorl %esi, %esi
	movl index, %esi
	xorl %eax, %eax
n_mic_FOR:
	cmp m, %eax
	je exitt
	xorl %ecx, %ecx
	movl index, %esi
	addl %eax, %esi
	incl %eax
n_mic_for:
	cmp n, %ecx
	je n_mic_FOR
	xorl %edx, %edx
	movl m, %edx
	subl %edx, %esi
	xorl %edx, %edx
	movl (%edi, %esi, 4), %edx
	movl %edx, sum
	pushl %eax
	pushl %ecx
	pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
	popl %ecx
	popl %eax
	incl %ecx
	jmp n_mic_for
m_mic:
	jmp exit

divneg:
	xorl %edx, %edx
	movl $1, %edx
	movl op, %ecx
        idivl %ecx
        movl %eax, sum
        pushl sum
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        incl %esi
        jmp divfor

exitt:
//	movl %ecx, sum
//	pushl sum                                # este deja un pointer
//        pushl $formatPrintf
 //       call printf
//        popl %ebx
 //       popl %ebx
	

	pushl $0
        call fflush
        popl %ebx
	       
	pushl $formatendl
	call printf
	popl %ebx
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
