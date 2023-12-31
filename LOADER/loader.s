global loader				; the entry symbol 
					; for ELF

MAGIC_NUMBER equ 0x1BADB002 		; define the magic number
			    		; constant
FLAGS	     equ 0x0	    		; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER ; (magic number + checksum + flags should = 0)

section .text:				; start of the text (code) section
align 4					; the code must be 4 byte aligned
	dd MAGIC_NUMBER			; write the magic number to the 
					; machine code, the flags, checksum
	dd FLAGS
	dd CHECKSUM
loader:					; the loader label
					; defined as entry point in linker 
					; script
	mov eax, 0xCAFEBABE		; place the magic # in reg eax

.loop:					; loop forever
	jmp .loop
