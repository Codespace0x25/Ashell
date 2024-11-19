	.file	"ashell.c"
	.intel_syntax noprefix
	.text
	.globl	aliases
	.bss
	.align 32
	.type	aliases, @object
	.size	aliases, 204800
aliases:
	.zero	204800
	.globl	alias_count
	.align 4
	.type	alias_count, @object
	.size	alias_count, 4
alias_count:
	.zero	4
	.section	.rodata
.LC0:
	.string	"\033[0m"
.LC1:
	.string	"\033[1;32m"
.LC2:
	.string	"\033[1;34m"
.LC3:
	.string	"\033[1;36m"
.LC4:
	.string	"\033[1;33m"
.LC5:
	.string	"\033[1;31m"
	.text
	.globl	get_color_code
	.type	get_color_code, @function
get_color_code:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi
	cmp	DWORD PTR -4[rbp], 5
	ja	.L2
	mov	eax, DWORD PTR -4[rbp]
	lea	rdx, 0[0+rax*4]
	lea	rax, .L4[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L4[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L9:
	lea	rax, .LC0[rip]
	jmp	.L10
.L8:
	lea	rax, .LC1[rip]
	jmp	.L10
.L7:
	lea	rax, .LC2[rip]
	jmp	.L10
.L6:
	lea	rax, .LC3[rip]
	jmp	.L10
.L5:
	lea	rax, .LC4[rip]
	jmp	.L10
.L3:
	lea	rax, .LC5[rip]
	jmp	.L10
.L2:
	lea	rax, .LC0[rip]
.L10:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_color_code, .-get_color_code
	.globl	handle_signal
	.type	handle_signal, @function
handle_signal:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	handle_signal, .-handle_signal
	.globl	add_alias
	.type	add_alias, @function
add_alias:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	eax, DWORD PTR alias_count[rip]
	cmp	eax, 99
	jg	.L14
	mov	eax, DWORD PTR alias_count[rip]
	cdqe
	sal	rax, 11
	mov	rdx, rax
	lea	rax, aliases[rip]
	lea	rcx, [rdx+rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 1024
	mov	rsi, rax
	mov	rdi, rcx
	call	strncpy@PLT
	mov	eax, DWORD PTR alias_count[rip]
	cdqe
	sal	rax, 11
	lea	rdx, 1024[rax]
	lea	rax, aliases[rip]
	lea	rcx, [rdx+rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 1024
	mov	rsi, rax
	mov	rdi, rcx
	call	strncpy@PLT
	mov	eax, DWORD PTR alias_count[rip]
	add	eax, 1
	mov	DWORD PTR alias_count[rip], eax
.L14:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	add_alias, .-add_alias
	.globl	replace_alias
	.type	replace_alias, @function
replace_alias:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L19:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 11
	mov	rdx, rax
	lea	rax, aliases[rip]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L17
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 11
	lea	rdx, 1024[rax]
	lea	rax, aliases[rip]
	lea	rcx, [rdx+rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 1024
	mov	rsi, rcx
	mov	rdi, rax
	call	strncpy@PLT
	mov	eax, 1
	jmp	.L18
.L17:
	add	DWORD PTR -4[rbp], 1
.L16:
	mov	eax, DWORD PTR alias_count[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L19
	mov	eax, 0
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	replace_alias, .-replace_alias
	.section	.rodata
.LC6:
	.string	"HOME"
	.align 8
.LC7:
	.string	"HOME environment variable not set.\n"
.LC8:
	.string	"%s/.AShellrc"
.LC9:
	.string	"r"
.LC10:
	.string	"\n"
.LC11:
	.string	"export "
.LC12:
	.string	"alias "
	.text
	.globl	load_shell_config
	.type	load_shell_config, @function
load_shell_config:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 2112
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	getenv@PLT
	mov	QWORD PTR -2104[rbp], rax
	cmp	QWORD PTR -2104[rbp], 0
	jne	.L21
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 35
	mov	esi, 1
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	fwrite@PLT
	jmp	.L20
.L21:
	mov	rdx, QWORD PTR -2104[rbp]
	lea	rax, -2064[rbp]
	mov	rcx, rdx
	lea	rdx, .LC8[rip]
	mov	esi, 1024
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -2064[rbp]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -2096[rbp], rax
	cmp	QWORD PTR -2096[rbp], 0
	je	.L32
	jmp	.L24
.L29:
	lea	rax, -1040[rbp]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcspn@PLT
	mov	BYTE PTR -1040[rbp+rax], 0
	movzx	eax, BYTE PTR -1040[rbp]
	test	al, al
	je	.L24
	movzx	eax, BYTE PTR -1040[rbp]
	cmp	al, 35
	jne	.L26
	jmp	.L24
.L26:
	lea	rax, -1040[rbp]
	mov	edx, 7
	lea	rcx, .LC11[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L27
	lea	rax, -1040[rbp]
	mov	rdi, rax
	call	system@PLT
	jmp	.L24
.L27:
	lea	rax, -1040[rbp]
	mov	edx, 6
	lea	rcx, .LC12[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L28
	lea	rax, -1040[rbp]
	mov	esi, 61
	mov	rdi, rax
	call	strchr@PLT
	mov	QWORD PTR -2088[rbp], rax
	cmp	QWORD PTR -2088[rbp], 0
	je	.L24
	mov	rax, QWORD PTR -2088[rbp]
	mov	BYTE PTR [rax], 0
	lea	rax, -1040[rbp]
	add	rax, 6
	mov	QWORD PTR -2080[rbp], rax
	mov	rax, QWORD PTR -2088[rbp]
	add	rax, 2
	mov	QWORD PTR -2072[rbp], rax
	mov	rax, QWORD PTR -2072[rbp]
	mov	rdi, rax
	call	strlen@PLT
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -2072[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rdx, QWORD PTR -2072[rbp]
	mov	rax, QWORD PTR -2080[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	add_alias
	jmp	.L24
.L28:
	lea	rax, -1040[rbp]
	mov	rdi, rax
	call	system@PLT
.L24:
	mov	rdx, QWORD PTR -2096[rbp]
	lea	rax, -1040[rbp]
	mov	esi, 1024
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L29
	mov	rax, QWORD PTR -2096[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L20
.L32:
	nop
.L20:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	load_shell_config, .-load_shell_config
	.section	.rodata
.LC13:
	.string	"USER"
.LC14:
	.string	"%H:%M:%S"
	.align 8
.LC15:
	.string	"%s[%s]%s %s%s%s at %s%s%s %s\342\236\234%s "
.LC16:
	.string	"getcwd failed"
	.text
	.globl	print_prompt
	.type	print_prompt, @function
print_prompt:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 1112
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	getenv@PLT
	mov	QWORD PTR -1120[rbp], rax
	lea	rax, -1128[rbp]
	mov	rdi, rax
	call	time@PLT
	lea	rax, -1128[rbp]
	mov	rdi, rax
	call	localtime@PLT
	mov	QWORD PTR -1112[rbp], rax
	mov	rdx, QWORD PTR -1112[rbp]
	lea	rax, -1097[rbp]
	mov	rcx, rdx
	lea	rdx, .LC14[rip]
	mov	esi, 9
	mov	rdi, rax
	call	strftime@PLT
	lea	rax, -1088[rbp]
	mov	esi, 1024
	mov	rdi, rax
	call	getcwd@PLT
	test	rax, rax
	je	.L34
	mov	edi, 0
	call	get_color_code
	mov	r15, rax
	mov	edi, 4
	call	get_color_code
	mov	r14, rax
	mov	edi, 0
	call	get_color_code
	mov	r13, rax
	mov	edi, 2
	call	get_color_code
	mov	r12, rax
	mov	edi, 0
	call	get_color_code
	mov	rbx, rax
	mov	edi, 1
	call	get_color_code
	mov	QWORD PTR -1144[rbp], rax
	mov	edi, 0
	call	get_color_code
	mov	QWORD PTR -1152[rbp], rax
	mov	edi, 3
	call	get_color_code
	mov	rsi, rax
	mov	rcx, QWORD PTR -1120[rbp]
	lea	rax, -1097[rbp]
	push	r15
	push	r14
	push	r13
	lea	rdx, -1088[rbp]
	push	rdx
	push	r12
	push	rbx
	mov	r9, rcx
	mov	r8, QWORD PTR -1144[rbp]
	mov	rcx, QWORD PTR -1152[rbp]
	mov	rdx, rax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	rsp, 48
	jmp	.L35
.L34:
	lea	rax, .LC16[rip]
	mov	rdi, rax
	call	perror@PLT
.L35:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	print_prompt, .-print_prompt
	.section	.rodata
.LC17:
	.string	"/bin/AShell"
.LC18:
	.string	"SHELL"
.LC19:
	.string	"Memory allocation failed.\n"
.LC20:
	.string	"Welcome to AShell!"
.LC21:
	.string	"clear"
.LC22:
	.string	"exit"
.LC23:
	.string	"Exiting AShell. Goodbye!"
.LC24:
	.string	"cd "
.LC25:
	.string	"cd failed"
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	edx, 0
	lea	rax, .LC17[rip]
	mov	rsi, rax
	lea	rax, .LC18[rip]
	mov	rdi, rax
	call	setenv@PLT
	lea	rax, handle_signal[rip]
	mov	rsi, rax
	mov	edi, 2
	call	signal@PLT
	lea	rax, handle_signal[rip]
	mov	rsi, rax
	mov	edi, 20
	call	signal@PLT
	mov	eax, 0
	call	load_shell_config
	mov	edi, 1024
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L38
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 26
	mov	esi, 1
	lea	rax, .LC19[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L39
.L38:
	lea	rax, .LC20[rip]
	mov	rdi, rax
	call	puts@PLT
.L49:
	mov	eax, 0
	call	print_prompt
	mov	DWORD PTR -24[rbp], 0
	jmp	.L40
.L43:
	cmp	DWORD PTR -20[rbp], 12
	jne	.L41
	lea	rax, .LC21[rip]
	mov	rdi, rax
	call	system@PLT
	mov	DWORD PTR -24[rbp], 0
	mov	eax, 0
	call	print_prompt
	jmp	.L40
.L41:
	cmp	DWORD PTR -24[rbp], 1022
	jg	.L40
	mov	eax, DWORD PTR -24[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -24[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -20[rbp]
	mov	BYTE PTR [rax], dl
.L40:
	call	getchar@PLT
	mov	DWORD PTR -20[rbp], eax
	cmp	DWORD PTR -20[rbp], 10
	je	.L42
	cmp	DWORD PTR -20[rbp], -1
	jne	.L43
.L42:
	mov	eax, DWORD PTR -24[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	replace_alias
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, .LC22[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L44
	lea	rax, .LC23[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	jmp	.L39
.L44:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 3
	lea	rcx, .LC24[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L46
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 3
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	chdir@PLT
	test	eax, eax
	je	.L50
	lea	rax, .LC25[rip]
	mov	rdi, rax
	call	perror@PLT
	jmp	.L50
.L46:
	cmp	DWORD PTR -24[rbp], 0
	jle	.L49
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	system@PLT
	jmp	.L49
.L50:
	nop
	jmp	.L49
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
