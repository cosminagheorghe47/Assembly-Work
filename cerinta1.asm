.data
	sir16: .space 241
	sir2: .space 961
	sirf: .space 20
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%s"
	formatnumar: .asciz "%d "
	formatnumarneg: .asciz "-%d "
	formatPrintfs: .asciz "%s "
	formatcaracter: .asciz "%c"
	formatendl: .asciz "\n"
	minuss: .asciz "-"
	doisprz: .long 12
	indexsir2: .long 0
	indexsirf: .long 0
	putere: .long 128
	putere2: .long 128
	op: .long 2
	sum: .long 0
.text

.global main

main:
	pushl $sir16
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	movl $sir16, %edi
	movl $sir2, %esi
	xorl %ecx, %ecx

et:
	movb (%edi, %ecx,1), %al
	cmp $0, %al
	je transformare

	cmp $48, %al
	je cif0
        cmp $49, %al
        je cif1
        cmp $50, %al
        je cif2
        cmp $51, %al
        je cif3
        cmp $52, %al
        je cif4
        cmp $53, %al
        je cif5
        cmp $54, %al
        je cif6
        cmp $55, %al
        je cif7
        cmp $56, %al
        je cif8
        cmp $57, %al
        je cif9
        cmp $65, %al
        je cifA
        cmp $66, %al
        je cifB
        cmp $67, %al
        je cifC
        cmp $68, %al
        je cifD
        cmp $69, %al
        je cifE
        cmp $70, %al
        je cifF

cont:
	incl %ecx
	jmp et
cif0:
	pushl %ecx

	movl indexsir2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

	movl %ecx, indexsir2

	popl %ecx
	jmp cont

cif1:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif2:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif3:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif4:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif5:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif6:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif7:
        pushl %ecx

        movl indexsir2, %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif8:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cif9:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cifA:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cifB:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cifC:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cifD:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cifE:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $48, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

cifF:
        pushl %ecx

        movl indexsir2, %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx
        movb $49, (%esi, %ecx,1)
        incl %ecx

        movl %ecx, indexsir2

        popl %ecx
        jmp cont

transformare:
	movl indexsir2, %ecx
	movb $0, (%esi, %ecx,1)
	movl %ecx, indexsir2
	xorl %ecx, %ecx
        xorl %edx, %edx
	movl $sirf, %edi

ett:
	movb (%esi, %ecx,1), %al
        cmp $0, %al
        je exitt

	xorl %edx, %edx

	pushl %ecx
	movl putere2, %ecx
	movl %ecx, putere
	movl indexsirf, %ecx
	movl %ecx, sum
	popl %ecx


	incl %ecx
	incl %edx
	movb (%esi, %ecx,1), %al
        cmp $48, %al
        je zero1
	cmp $49, %al
	je unu1

zero1:
	incl %ecx
        incl %edx
	movb (%esi, %ecx,1), %al
        cmp $48, %al
        je zero2
        cmp $49, %al
        je unu2
unu1:
	incl %ecx
	incl %ecx
        incl %ecx
        incl %ecx
        incl %ecx
        incl %ecx
        incl %ecx
        incl %ecx
        movb (%esi, %ecx,1), %al
        cmp $48, %al
        je zero9
        cmp $49, %al
        je unu9
unu9:
	pushl %ecx

        movl $0, %ecx
        movb $100, (%edi, %ecx,1)
        incl %ecx
        movb $105, (%edi, %ecx,1)
        incl %ecx
        movb $118, (%edi, %ecx,1)
        incl %ecx
        movb $32, (%edi, %ecx,1)
        incl %ecx

	pushl $sirf
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

        popl %ecx
	incl %ecx
	incl %ecx
	incl %ecx
        jmp ett
zero9:
	incl %ecx
        movb (%esi, %ecx,1), %al
        cmp $48, %al
        je zero10
        cmp $49, %al
        je unu10
zero10:
        incl %ecx
        movb (%esi, %ecx,1), %al
        cmp $48, %al
        je zero11
        cmp $49, %al
        je unu11
zero11:
        pushl %ecx

        movl $0, %ecx
        movb $108, (%edi, %ecx,1)
        incl %ecx
        movb $101, (%edi, %ecx,1)
        incl %ecx
        movb $116, (%edi, %ecx,1)
        incl %ecx
        movb $32, (%edi, %ecx,1)
        incl %ecx

        pushl $sirf
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx


        popl %ecx
	incl %ecx
        jmp ett
unu11:
        pushl %ecx

        movl $0, %ecx
        movb $97, (%edi, %ecx,1)
        incl %ecx
        movb $100, (%edi, %ecx,1)
        incl %ecx
        movb $100, (%edi, %ecx,1)
        incl %ecx
        movb $32, (%edi, %ecx,1)
        incl %ecx

        pushl $sirf
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx
        

        popl %ecx
	incl %ecx
        jmp ett
unu10:
        incl %ecx
        movb (%esi, %ecx,1), %al
        cmp $48, %al
        je zero112
        cmp $49, %al
        je unu112
zero112:
	pushl %ecx

        movl $0, %ecx
        movb $115, (%edi, %ecx,1)
        incl %ecx
        movb $117, (%edi, %ecx,1)
        incl %ecx
        movb $98, (%edi, %ecx,1)
        incl %ecx
        movb $32, (%edi, %ecx,1)
        incl %ecx

        pushl $sirf
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx


        popl %ecx
	incl %ecx
        jmp ett
unu112:
	pushl %ecx

        movl $0, %ecx
        movb $109, (%edi, %ecx,1)
        incl %ecx
        movb $117, (%edi, %ecx,1)
        incl %ecx
        movb $108, (%edi, %ecx,1)
        incl %ecx
        movb $32, (%edi, %ecx,1)
        incl %ecx

        pushl $sirf
        pushl $formatPrintf
        call printf
        popl %ebx
        popl %ebx


        popl %ecx
	incl %ecx
        jmp ett
zero2:
        incl %ecx
        incl %edx
        movb (%esi, %ecx,1), %al
        cmp $48, %al
        je pozitiv
        cmp $49, %al
        je negativ

pozitiv:
	incl %ecx
        incl %edx
forp:
	cmp doisprz, %edx
	je transump
	movb (%esi, %ecx, 1), %al

	cmp $48, %al
	je zerop
	cmp $49, %al
	je unup
zerop:
	pushl %edx
	movl $0, %edx
	movl putere, %eax
	movl op, %ebx
	div %ebx
	movl %eax, putere
	popl %edx
	incl %ecx
        incl %edx
	jmp forp
unup:
	pushl %edx
        movl $0, %edx
        movl putere, %eax
	movl sum, %ebx
        add %eax, %ebx
        movl %ebx, sum

        movl op, %ebx
        div %ebx
        movl %eax, putere
	popl %edx
        incl %ecx
        incl %edx
        jmp forp
transump:
	pushl %ecx
	pushl sum
	pushl $formatnumar
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	jmp ett

negativ:
	incl %ecx
        incl %edx
forn:
	cmp doisprz, %edx
	je transumn
	movb (%esi, %ecx, 1), %al

	cmp $48, %al
	je zeron
	cmp $49, %al
	je unun
zeron:
	pushl %edx
	movl $0, %edx
	movl putere, %eax
	movl op, %ebx
	div %ebx
	movl %eax, putere
	popl %edx
	incl %ecx
        incl %edx
	jmp forn
unun:
	pushl %edx
        movl $0, %edx
        movl putere, %eax
	movl sum, %ebx
        add %eax, %ebx
        movl %ebx, sum

        movl op, %ebx
        div %ebx
        movl %eax, putere
	popl %edx
        incl %ecx
        incl %edx
        jmp forn
transumn:
	pushl %ecx
	pushl sum
	pushl $formatnumarneg
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	jmp ett

unu2:
        incl %ecx
	incl %ecx
        incl %edx
        incl %edx

forr:
        cmp doisprz, %edx
        je transumm
        movb (%esi, %ecx, 1), %al

        cmp $48, %al
        je zeroo
        cmp $49, %al
        je unuu
zeroo:
	pushl %edx
        movl $0, %edx
        movl putere, %eax
        movl op, %ebx
        div %ebx
        movl %eax, putere
	popl %edx
        incl %ecx
	incl %edx
        jmp forr
unuu:
	pushl %edx
        movl $0, %edx
        movl putere, %eax
        movl sum, %ebx
        add %eax, %ebx
        movl %ebx, sum

        movl op, %ebx
        div %ebx
        movl %eax, putere
	popl %edx
        incl %ecx
	incl %edx
        jmp forr
transumm:
	pushl %ecx
        pushl $sum
        pushl $formatPrintfs
        call printf
        popl %ebx
        popl %ebx
	popl %ecx
        jmp ett
exitt:
	pushl $formatendl
	call printf
	popl %ebx

        pushl $0
        call fflush
        popl %ebx

        movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
