.data
	str1: .asciiz "Digite um numero entre 1 e 10: "
	str4: .asciiz " ; "
	str2: .asciiz " resultado:  "
	vetor: .word 1,2,3,4,5,6,7,8,9,10
.text
	main:
		li $t0, 0 # Armazena no registrador $t0 o índice 0
		li $t1, 10 # Armazena no registrador $t1 o índice 10
		la $t2, vetor # Armzaena o registrador $t2 o endereço do vetor vet
		
		la $a0, str1    			#movo pro registrador $a0 a str1
		li $v0,4				#printo na tela
		syscall					#chama o sistema	
		li $v0, 5				# leio um numero que o usuario digitou
		syscall
		move $t3,$v0				#movo o q o usuario digitou pra um registrador temporario
		mul $t4,$t3,4
		jal imprimeValor			#chamaa a funcao 

		li $v0, 10				# informa que o programa sera encerrado
		syscall					# realiza uma chamada de sistema

		imprimeValor:
		Loop:
 				sw $t0, 0($t2)			 # Armazena na posição 0 do vetor o conteúdo do registrador $t0
 				addi $t0, $t0, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
 				addi $t2, $t2, 4 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
 				beq $t0, $t3, ExitLoop		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 				j Loop 				# Efetua o salto para o label Loop
		ExitLoop:
		la $a0, str2    			#movo pro registrador $a0 a str1
		li $v0,4				#printo na tela
		syscall					#chama o sistema 			
		Loop1:
				
 				sw $t0, 0($t2)			 # Armazena na posição 0 do vetor o conteúdo do registrador $t0
 				addi $t0, $t0, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
 				addi $t2, $t2, 4 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
				la $a0, ($t0)			#movo pro a0 o valor no indice
				li $v0,1			# informa que sera impresso um numero
				syscall				# realiza uma chamada de sistema
				la $a0, str4
				li $v0,4			# informa que sera impresso um numero
				syscall				# realiza uma chamada de sistema	
 				 beq $t0, $t1, ExitLoop1		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 				j Loop1 				# Efetua o salto para o label Loop
				ExitLoop1: li $v0, 10 		# Encerra o programa
				syscall
			
