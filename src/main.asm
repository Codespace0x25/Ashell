	.file	"ashell.history.c"
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
	.globl	history
	.align 32
	.type	history, @object
	.size	history, 800
history:
	.zero	800
	.globl	history_count
	.align 4
	.type	history_count, @object
	.size	history_count, 4
history_count:
	.zero	4
	.globl	history_index
	.align 4
	.type	history_index, @object
	.size	history_index, 4
history_index:
	.zero	4
	.globl	original_termios
	.align 32
	.type	original_termios, @object
	.size	original_termios, 60
original_termios:
	.zero	60
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
.LC7:
	.string	"%s/.AShellrc"
.LC8:
	.string	"r"
.LC9:
	.string	"\n"
.LC10:
	.string	"export "
.LC11:
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
	je	.L32
	mov	rdx, QWORD PTR -2104[rbp]
	lea	rax, -2064[rbp]
	mov	rcx, rdx
	lea	rdx, .LC7[rip]
	mov	esi, 1024
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -2064[rbp]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -2096[rbp], rax
	cmp	QWORD PTR -2096[rbp], 0
	je	.L33
	jmp	.L24
.L29:
	lea	rax, -1040[rbp]
	lea	rdx, .LC9[rip]
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
	lea	rcx, .LC10[rip]
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
	lea	rcx, .LC11[rip]
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
	jmp	.L20
.L33:
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
.LC12:
	.string	"%s/.AShellHistory"
	.text
	.globl	load_history
	.type	load_history, @function
load_history:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 2088
	.cfi_offset 3, -24
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	getenv@PLT
	mov	QWORD PTR -2096[rbp], rax
	cmp	QWORD PTR -2096[rbp], 0
	je	.L42
	mov	rdx, QWORD PTR -2096[rbp]
	lea	rax, -2080[rbp]
	mov	rcx, rdx
	lea	rdx, .LC12[rip]
	mov	esi, 1024
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -2080[rbp]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -2088[rbp], rax
	cmp	QWORD PTR -2088[rbp], 0
	je	.L43
	jmp	.L38
.L39:
	lea	rax, -1056[rbp]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcspn@PLT
	mov	BYTE PTR -1056[rbp+rax], 0
	mov	eax, DWORD PTR history_count[rip]
	cmp	eax, 99
	jg	.L38
	mov	ebx, DWORD PTR history_count[rip]
	lea	eax, 1[rbx]
	mov	DWORD PTR history_count[rip], eax
	lea	rax, -1056[rbp]
	mov	rdi, rax
	call	strdup@PLT
	mov	rcx, rax
	movsx	rax, ebx
	lea	rdx, 0[0+rax*8]
	lea	rax, history[rip]
	mov	QWORD PTR [rdx+rax], rcx
.L38:
	mov	rdx, QWORD PTR -2088[rbp]
	lea	rax, -1056[rbp]
	mov	esi, 1024
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L39
	mov	rax, QWORD PTR -2088[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L34
.L42:
	nop
	jmp	.L34
.L43:
	nop
.L34:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	load_history, .-load_history
	.section	.rodata
.LC13:
	.string	"w"
.LC14:
	.string	"%s\n"
	.text
	.globl	save_history
	.type	save_history, @function
save_history:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 1072
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	getenv@PLT
	mov	QWORD PTR -1056[rbp], rax
	cmp	QWORD PTR -1056[rbp], 0
	je	.L52
	mov	rdx, QWORD PTR -1056[rbp]
	lea	rax, -1040[rbp]
	mov	rcx, rdx
	lea	rdx, .LC12[rip]
	mov	esi, 1024
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -1040[rbp]
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -1048[rbp], rax
	cmp	QWORD PTR -1048[rbp], 0
	je	.L53
	mov	DWORD PTR -1060[rbp], 0
	jmp	.L48
.L49:
	mov	eax, DWORD PTR -1060[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, history[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -1048[rbp]
	lea	rcx, .LC14[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -1060[rbp], 1
.L48:
	mov	eax, DWORD PTR history_count[rip]
	cmp	DWORD PTR -1060[rbp], eax
	jl	.L49
	mov	rax, QWORD PTR -1048[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L44
.L52:
	nop
	jmp	.L44
.L53:
	nop
.L44:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L51
	call	__stack_chk_fail@PLT
.L51:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	save_history, .-save_history
	.globl	add_to_history
	.type	add_to_history, @function
add_to_history:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 24
	.cfi_offset 3, -24
	mov	QWORD PTR -24[rbp], rdi
	mov	eax, DWORD PTR history_count[rip]
	cmp	eax, 99
	jg	.L55
	mov	ebx, DWORD PTR history_count[rip]
	lea	eax, 1[rbx]
	mov	DWORD PTR history_count[rip], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	strdup@PLT
	mov	rcx, rax
	movsx	rax, ebx
	lea	rdx, 0[0+rax*8]
	lea	rax, history[rip]
	mov	QWORD PTR [rdx+rax], rcx
	jmp	.L57
.L55:
	mov	rax, QWORD PTR history[rip]
	mov	rdi, rax
	call	free@PLT
	lea	rax, history[rip+8]
	mov	edx, 792
	mov	rsi, rax
	lea	rax, history[rip]
	mov	rdi, rax
	call	memmove@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	strdup@PLT
	mov	QWORD PTR history[rip+792], rax
.L57:
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	add_to_history, .-add_to_history
	.globl	enable_raw_mode
	.type	enable_raw_mode, @function
enable_raw_mode:
.LFB14:
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
	lea	rax, original_termios[rip]
	mov	rsi, rax
	mov	edi, 0
	call	tcgetattr@PLT
	mov	rax, QWORD PTR original_termios[rip]
	mov	rdx, QWORD PTR original_termios[rip+8]
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -72[rbp], rdx
	mov	rax, QWORD PTR original_termios[rip+16]
	mov	rdx, QWORD PTR original_termios[rip+24]
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR original_termios[rip+32]
	mov	rdx, QWORD PTR original_termios[rip+40]
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR original_termios[rip+44]
	mov	rdx, QWORD PTR original_termios[rip+52]
	mov	QWORD PTR -36[rbp], rax
	mov	QWORD PTR -28[rbp], rdx
	mov	eax, DWORD PTR -68[rbp]
	and	eax, -11
	mov	DWORD PTR -68[rbp], eax
	lea	rax, -80[rbp]
	mov	rdx, rax
	mov	esi, 2
	mov	edi, 0
	call	tcsetattr@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L59
	call	__stack_chk_fail@PLT
.L59:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	enable_raw_mode, .-enable_raw_mode
	.globl	disable_raw_mode
	.type	disable_raw_mode, @function
disable_raw_mode:
.LFB15:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	lea	rax, original_termios[rip]
	mov	rdx, rax
	mov	esi, 2
	mov	edi, 0
	call	tcsetattr@PLT
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	disable_raw_mode, .-disable_raw_mode
	.section	.rodata
.LC15:
	.string	"\r\033[K"
.LC16:
	.string	"%s"
	.text
	.globl	handle_arrow_keys
	.type	handle_arrow_keys, @function
handle_arrow_keys:
.LFB16:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	DWORD PTR -20[rbp], edx
	cmp	DWORD PTR -20[rbp], 65
	jne	.L62
	mov	eax, DWORD PTR history_index[rip]
	test	eax, eax
	jle	.L65
	mov	eax, DWORD PTR history_index[rip]
	sub	eax, 1
	mov	DWORD PTR history_index[rip], eax
	mov	eax, DWORD PTR history_index[rip]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, history[rip]
	mov	rcx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 1024
	mov	rsi, rcx
	mov	rdi, rax
	call	strncpy@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], edx
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	call	print_prompt
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC16[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	jmp	.L65
.L62:
	cmp	DWORD PTR -20[rbp], 66
	jne	.L65
	mov	eax, DWORD PTR history_count[rip]
	lea	edx, -1[rax]
	mov	eax, DWORD PTR history_index[rip]
	cmp	edx, eax
	jle	.L64
	mov	eax, DWORD PTR history_index[rip]
	add	eax, 1
	mov	DWORD PTR history_index[rip], eax
	mov	eax, DWORD PTR history_index[rip]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, history[rip]
	mov	rcx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 1024
	mov	rsi, rcx
	mov	rdi, rax
	call	strncpy@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], edx
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	call	print_prompt
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC16[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	jmp	.L65
.L64:
	mov	eax, DWORD PTR history_count[rip]
	mov	DWORD PTR history_index[rip], eax
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], 0
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	call	print_prompt
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
.L65:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	handle_arrow_keys, .-handle_arrow_keys
	.section	.rodata
.LC17:
	.string	"USER"
.LC18:
	.string	"%H:%M:%S"
	.align 8
.LC19:
	.string	"%s[%s]%s %s%s%s at %s%s%s %s\342\236\234%s "
.LC20:
	.string	"getcwd failed"
	.text
	.globl	print_prompt
	.type	print_prompt, @function
print_prompt:
.LFB17:
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
	lea	rax, .LC17[rip]
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
	lea	rdx, .LC18[rip]
	mov	esi, 9
	mov	rdi, rax
	call	strftime@PLT
	lea	rax, -1088[rbp]
	mov	esi, 1024
	mov	rdi, rax
	call	getcwd@PLT
	test	rax, rax
	je	.L67
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
	lea	rax, .LC19[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	rsp, 48
	jmp	.L68
.L67:
	lea	rax, .LC20[rip]
	mov	rdi, rax
	call	perror@PLT
.L68:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L69
	call	__stack_chk_fail@PLT
.L69:
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
.LFE17:
	.size	print_prompt, .-print_prompt
	.section	.rodata
.LC21:
	.string	"/bin/AShell"
.LC22:
	.string	"SHELL"
.LC23:
	.string	"Memory allocation failed.\n"
.LC24:
	.string	"clear"
.LC25:
	.string	"exit"
.LC26:
	.string	"cd "
.LC27:
	.string	"cd failed"
	.text
	.globl	main
	.type	main, @function
main:
.LFB18:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	edx, 0
	lea	rax, .LC21[rip]
	mov	rsi, rax
	lea	rax, .LC22[rip]
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
	mov	eax, 0
	call	load_history
	mov	edi, 1024
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L71
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 26
	mov	esi, 1
	lea	rax, .LC23[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L72
.L71:
	mov	eax, 0
	call	enable_raw_mode
.L84:
	mov	eax, 0
	call	print_prompt
	mov	DWORD PTR -20[rbp], 0
.L79:
	call	getchar@PLT
	mov	BYTE PTR -22[rbp], al
	cmp	BYTE PTR -22[rbp], 10
	jne	.L73
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	mov	edi, 10
	call	putchar@PLT
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L80
	jmp	.L87
.L73:
	cmp	BYTE PTR -22[rbp], 12
	jne	.L75
	lea	rax, .LC24[rip]
	mov	rdi, rax
	call	system@PLT
	mov	DWORD PTR -20[rbp], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	BYTE PTR [rax], 0
	mov	eax, 0
	call	print_prompt
	jmp	.L79
.L75:
	cmp	BYTE PTR -22[rbp], 27
	jne	.L77
	call	getchar@PLT
	call	getchar@PLT
	mov	BYTE PTR -21[rbp], al
	movsx	edx, BYTE PTR -21[rbp]
	lea	rcx, -20[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	handle_arrow_keys
	jmp	.L79
.L77:
	cmp	BYTE PTR -22[rbp], 127
	jne	.L78
	mov	eax, DWORD PTR -20[rbp]
	test	eax, eax
	jle	.L79
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	call	print_prompt
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	lea	rax, .LC16[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	jmp	.L79
.L78:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, 1022
	jg	.L79
	mov	eax, DWORD PTR -20[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -20[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -22[rbp]
	mov	BYTE PTR [rdx], al
	movsx	eax, BYTE PTR -22[rbp]
	mov	edi, eax
	call	putchar@PLT
	jmp	.L79
.L87:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	add_to_history
	mov	eax, DWORD PTR history_count[rip]
	mov	DWORD PTR history_index[rip], eax
.L80:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L81
	mov	eax, 0
	call	disable_raw_mode
	mov	eax, 0
	call	save_history
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	jmp	.L72
.L81:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 3
	lea	rcx, .LC26[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncmp@PLT
	test	eax, eax
	jne	.L82
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 3
	mov	rdi, rax
	call	chdir@PLT
	test	eax, eax
	je	.L84
	lea	rax, .LC27[rip]
	mov	rdi, rax
	call	perror@PLT
	jmp	.L84
.L82:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	system@PLT
	jmp	.L84
.L72:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L85
	call	__stack_chk_fail@PLT
.L85:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
