	.file	"main.c"
	.intel_syntax noprefix
	.text
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
	.globl	handle_sigint
	.type	handle_sigint, @function
handle_sigint:
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
	.size	handle_sigint, .-handle_sigint
	.globl	handle_sigtstp
	.type	handle_sigtstp, @function
handle_sigtstp:
.LFB8:
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
.LFE8:
	.size	handle_sigtstp, .-handle_sigtstp
	.section	.rodata
	.align 8
.LC6:
	.string	"if [ -f /etc/profile ]; then . /etc/profile; fi"
.LC7:
	.string	"HOME"
	.align 8
.LC8:
	.string	"if [ -f %s/.profile ]; then . %s/.profile; fi"
	.text
	.globl	load_startup_files
	.type	load_startup_files, @function
load_startup_files:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 1056
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	system@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	getenv@PLT
	mov	QWORD PTR -1048[rbp], rax
	cmp	QWORD PTR -1048[rbp], 0
	je	.L16
	mov	rcx, QWORD PTR -1048[rbp]
	mov	rdx, QWORD PTR -1048[rbp]
	lea	rax, -1040[rbp]
	mov	r8, rcx
	mov	rcx, rdx
	lea	rdx, .LC8[rip]
	mov	esi, 1024
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -1040[rbp]
	mov	rdi, rax
	call	system@PLT
.L16:
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	load_startup_files, .-load_startup_files
	.globl	is_login_shell
	.type	is_login_shell, @function
is_login_shell:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -4[rbp], edi
	mov	QWORD PTR -16[rbp], rsi
	cmp	DWORD PTR -4[rbp], 0
	jle	.L18
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	jne	.L18
	mov	eax, 1
	jmp	.L19
.L18:
	mov	eax, 0
.L19:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	is_login_shell, .-is_login_shell
	.section	.rodata
	.align 8
.LC9:
	.string	"Failed to initialize terminal settings"
	.text
	.globl	init_terminal
	.type	init_terminal, @function
init_terminal:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -80[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	tcgetattr@PLT
	test	eax, eax
	jne	.L21
	mov	eax, DWORD PTR -68[rbp]
	or	eax, 10
	mov	DWORD PTR -68[rbp], eax
	lea	rax, -80[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 0
	call	tcsetattr@PLT
	jmp	.L24
.L21:
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	perror@PLT
.L24:
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	init_terminal, .-init_terminal
	.section	.rodata
.LC10:
	.string	"USER"
.LC11:
	.string	"%H:%M:%S"
	.align 8
.LC12:
	.string	"%s[%s]%s %s%s%s at %s%s%s %s\342\236\234%s "
.LC13:
	.string	"getcwd failed"
	.text
	.globl	print_prompt
	.type	print_prompt, @function
print_prompt:
.LFB12:
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
	lea	rax, .LC10[rip]
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
	lea	rdx, .LC11[rip]
	mov	esi, 9
	mov	rdi, rax
	call	strftime@PLT
	lea	rax, -1088[rbp]
	mov	esi, 1024
	mov	rdi, rax
	call	getcwd@PLT
	test	rax, rax
	je	.L26
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
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	rsp, 48
	jmp	.L27
.L26:
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	perror@PLT
.L27:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
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
.LFE12:
	.size	print_prompt, .-print_prompt
	.section	.rodata
.LC14:
	.string	"/bin/AShell"
.LC15:
	.string	"SHELL"
	.align 8
.LC16:
	.string	"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
.LC17:
	.string	"PATH"
.LC18:
	.string	"Memory allocation failed.\n"
.LC19:
	.string	"clear"
.LC20:
	.string	"exit"
.LC21:
	.string	"Exiting program."
.LC22:
	.string	"cd "
.LC23:
	.string	"cd failed"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	rdx, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR -36[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	is_login_shell
	test	eax, eax
	je	.L30
	mov	eax, 0
	call	load_startup_files
.L30:
	mov	edx, 1
	lea	rax, .LC14[rip]
	mov	rsi, rax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	call	setenv@PLT
	mov	edx, 1
	lea	rax, .LC16[rip]
	mov	rsi, rax
	lea	rax, .LC17[rip]
	mov	rdi, rax
	call	setenv@PLT
	lea	rax, handle_sigint[rip]
	mov	rsi, rax
	mov	edi, 2
	call	signal@PLT
	lea	rax, handle_sigtstp[rip]
	mov	rsi, rax
	mov	edi, 20
	call	signal@PLT
	mov	esi, 1
	mov	edi, 1
	call	signal@PLT
	mov	eax, 0
	call	init_terminal
	mov	edi, 1024
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L31
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 26
	mov	esi, 1
	lea	rax, .LC18[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L32
.L31:
	mov	eax, 0
	call	print_prompt
	mov	DWORD PTR -24[rbp], 0
	jmp	.L33
.L36:
	cmp	DWORD PTR -20[rbp], 12
	jne	.L34
	lea	rax, .LC19[rip]
	mov	rdi, rax
	call	system@PLT
	mov	DWORD PTR -24[rbp], 0
	mov	eax, 0
	call	print_prompt
	jmp	.L33
.L34:
	cmp	DWORD PTR -24[rbp], 1022
	jg	.L33
	mov	eax, DWORD PTR -24[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -24[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -20[rbp]
	mov	BYTE PTR [rax], dl
.L33:
	call	getchar@PLT
	mov	DWORD PTR -20[rbp], eax
	cmp	DWORD PTR -20[rbp], 10
	je	.L35
	cmp	DWORD PTR -20[rbp], -1
	jne	.L36
.L35:
	mov	eax, DWORD PTR -24[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, .LC20[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L37
	lea	rax, .LC21[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	jmp	.L32
.L37:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, .LC19[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L39
	lea	rax, .LC19[rip]
	mov	rdi, rax
	call	system@PLT
	jmp	.L40
.L39:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 3
	lea	rcx, .LC22[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L41
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 3
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	chdir@PLT
	test	eax, eax
	je	.L43
	lea	rax, .LC23[rip]
	mov	rdi, rax
	call	perror@PLT
	jmp	.L43
.L41:
	cmp	DWORD PTR -24[rbp], 0
	jle	.L31
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	system@PLT
	jmp	.L31
.L43:
	nop
.L40:
	jmp	.L31
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
