	.file	"main.c" ; Имя файла	
	.text	
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0: 				;Текстовая константа
	.string	"Cannot read all the data"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:				;Текстовая константа
	.string	"(\320\237\320\276\320\264\320\277\321\200\320\276\321\206\320\265\321\201\321\201) \320\244\320\260\320\272\321\202\320\276\321\200\320\270\320\260\320\273 %ld \321\215\321\202\320\276 %ld.\n";Строка записанная на русском
	.text
	.p2align 4
	.globl	run_factorial 	;глобальное объявление run_factorial
	.type	run_factorial, @function
run_factorial:    		; функция
.LFB22:
	.cfi_startproc 		;старт
	pushq	%rbx		; Сохранение регистра %rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movl	4+p(%rip), %edi ; Загрузка аргумента в %edi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax 	;зануление еах
	movq	$0, 8(%rsp)
	call	close@PLT	;вызов close
	movl	p(%rip), %edi ; Загрузка значения в %edi
	leaq	8(%rsp), %rsi ; Загрузка адреса в %rsi
	movl	$8, %edx	;Загрузка значения в %edx
	call	read@PLT	;вызов read
	movl	p(%rip), %edi ; Загрузка значения в %edi
	movq	%rax, %rbx
	call	close@PLT	;вызов close
	cmpq	$8, %rbx; Сравнение
	jne	.L6		;переход к L6
	movq	8(%rsp), %rdi
	call	factorial@PLT	;вызов factorial
	movq	8(%rsp), %rsi	;Загрузка значения
	leaq	.LC1(%rip), %rdi 
	movq	%rax, %rdx	
	movq	%rax, 16(%rsp)
	xorl	%eax, %eax 	;зануление еах
	call	printf@PLT	;вызов printf
	movl	o(%rip), %edi ; Загрузка значения в %edi
	call	close@PLT	;вызов close
	movl	4+o(%rip), %edi ; Загрузка значения в %edi
	leaq	16(%rsp), %rsi
	movl	$8, %edx	;Загрузка значения в %edx
	call	write@PLT	;вызов write
	movl	4+o(%rip), %edi ; Загрузка значения в %edi
	call	close@PLT	;вызов close
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7		;переход к L7
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret			;возвращение из функции
.L6:
	.cfi_restore_state
	leaq	.LC0(%rip), %rdi
	call	puts@PLT	;вызов puts
	movl	$1, %edi ; установка значения в %edi
	call	_exit@PLT	;вызов _exit
.L7:
	call	__stack_chk_fail@PLT 	;вызов __stack_chk_fail
	.cfi_endproc
.LFE22:
	.size	run_factorial, .-run_factorial
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"\320\244\320\260\320\272\321\202\320\276\321\200\320\270\320\260\320\273 \321\207\320\270\321\201\320\273\320\260 %ld \321\215\321\202\320\276 %ld. (Taken from child process)\n"
	.section	.rodata.str1.1
.LC3:
	.string	"A Child process killed."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main	;глобальное объявление main
	.type	main, @function
main:		;main
.LFB23:
	.cfi_startproc
	pushq	%rbp	; значение регистра %rbp на стек
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	p(%rip), %rdi
	pushq	%rbx	; значение регистра %rbx на стек
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax 	;зануление еах
	call	pipe@PLT	;вызов pipe
	leaq	o(%rip), %rdi
	call	pipe@PLT	;вызов pipe
	call	fork@PLT	;вызов fork
	testl	%eax, %eax
	jne	.L9		;переход к L9
	xorl	%eax, %eax 	;зануление еах
	call	run_factorial 	;вызов run_factorial
.L10:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13		;переход к L13
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax 	;зануление еах
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret		;возвращение из функции
.L9:
	.cfi_restore_state
	movl	p(%rip), %edi ; Загрузка значения в %edi
	movl	%eax, %ebx
	movq	%rsp, %rbp
	call	close@PLT	;вызов close
	movl	4+p(%rip), %edi ; Загрузка значения в %edi
	movl	$8, %edx	;Загрузка значения в %edx
	leaq	x(%rip), %rsi
	call	write@PLT	;вызов write
	movl	4+p(%rip), %edi ; Загрузка значения в %edi
	call	close@PLT	;вызов close
	movl	4+o(%rip), %edi ; Загрузка значения в %edi
	call	close@PLT	;вызов close
	movl	o(%rip), %edi ; Загрузка значения в %edi
	movq	%rbp, %rsi
	movl	$8, %edx	;Загрузка значения в %edx
	call	read@PLT	;вызов read
	movl	o(%rip), %edi ; Загрузка значения в %edi
	call	close@PLT	;вызов close
	movq	(%rsp), %rdx
	movq	x(%rip), %rsi
	xorl	%eax, %eax 	;зануление еах
	leaq	.LC2(%rip), %rdi
	call	printf@PLT	;вызов printf
	movl	%ebx, %edi ; Загрузка значения в %edi из %ebx
	xorl	%edx, %edx	;зануление %edx
	movq	%rbp, %rsi
	call	waitpid@PLT	;вызов waitpid
	leaq	.LC3(%rip), %rdi
	call	puts@PLT	;вызов puts
	jmp	.L10	;переход в .L10
.L13:
	call	__stack_chk_fail@PLT	;вызов __stack_chk_fail
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	x	;глобальное объявление переменной х
	.data
	.align 8
	.type	x, @object	;тип переменной х
	.size	x, 8	;размер переменной р
x:
	.quad	8	;установка значения
	.globl	o	;глобальное объявление переменной о
	.bss
	.align 8
	.type	o, @object	;тип переменной о
	.size	o, 8	;размер переменной р
o:
	.zero	8
	.globl	p	;глобальное объявление переменной р
	.align 8
	.type	p, @object	;тип переменной р
	.size	p, 8	;размер переменной р
p:
	.zero	8
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
