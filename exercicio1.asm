.data
	vetor: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0		#vetor pra fazer a mudanca
	vetor1: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	str1: .asciiz "\nDigite um  numero:  "
	str2: .asciiz "\nVetor depois da mudanca: "
	str3: .asciiz "\nVetor antes da mudanca: "
	str4: .asciiz " ; " 
.text
     main: 
     	li $t0, 0 				# Armazena no registrador $t0 o índice 0
	li $t7, 10				# Armazena no registrador $t1 o índice 21
	la $t2, vetor				# Armzaena o registrador $t2 o endereço do vetor vet
	la $a0, str3   			#movo pro registrador $a0 a str1
	li $v0,4				#printo na tela
	syscall					#chama o sistema
	
          Loop9:
 		sw $t0, 100($t2)			# Armazena na posição 0 do vetor o conteúdo do registrador $t0
 		addi $t0, $t0, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
		addi $t2, $t2, 4 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
		la $a0, ($t0)			#movo pro a0 o valor no indice
		li $v0,1			# informa que sera impresso um numero
		syscall				# realiza uma chamada de sistema
		la $a0, str4
		li $v0,4			# informa que sera impresso um numero
		syscall	
		beq $t0, $t7, ExitLoop9		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 		j Loop9 				# Efetua o salto para o label Loop
	ExitLoop9:
	
	la $a0, str1    			#movo pro registrador $a0 a str1
	li $v0,4				#printo na tela
	syscall					#chama o sistema
	
	li $t0, 0 				# Armazena no registrador $t0 o índice 0
	li $t7, 10				# Armazena no registrador $t1 o índice 21
	la $t2, vetor				# Armzaena o registrador $t2 o endereço do vetor vet
	
	li $v0, 5				# leio um numero que o usuario digitou
	syscall
	move $t1, $v0				#movo o q o usuario digitou pra um registrador temporario
	
	beq $t1, $zero, Label			#comparo se o que o usuario digitou for zero, se for chamo a funcao atribuir par
	jal atribuirPar
				
	Label: jal atribuirImpar			# se oq o usuario digitou for impar atribuo impar nos vetores		
	
	
	
	atribuirPar:
			li $t6,0
			li $t3,6		
		loop4:
			sw $t0, 100($t2) 			# Armazena na posição 0 do vetor o conteúdo do registrador $t0
 			addi $t1, $t1, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
 			sw $t6, 100($t2)
 			addi $t2, $t2, 8 		# Incrementa $t2 de 8 (passa para o próximo item do vetor)
 			beq  $t1, $t3, Exit4          # testa se o conteudo dos registradores $t0 e $t1 são inguais			
		j loop4
		Exit4:
		
		la $a0, str2    			#movo pro registrador $a0 a str2
		li $v0,4				#printo na tela a str2        	
		syscall
		
		jal printar
				
		

	atribuirImpar:
			li $t6,1
			li $t3,4
			#li $t0, 0 				# Armazena no registrador $t0 o valor 0
		loop1:
			sw $t0, 104($t2) # Armazena na posição 0 do vetor o conteúdo do registrador $t0
 			addi $t1, $t1, 1 # Incrementa o índice a ser armazenado na posição correspondente do vetor
 			sw $t6, 104($t2)
 			addi $t2, $t2, 8 # Incrementa $t2 de 8 (passa para o próximo item do vetor)
 			beq $t1, $t3 ,Exit1 # ExitLoop # testa se o conteudo dos registradores $t0 e $t1 são inguais
 		
		j loop1
		Exit1:
		la $a0, str2    			#movo pro registrador $a0 a str2
		li $v0,4				#printo na tela a str2        	
		syscall
		
		jal printar

		la $a0, str3    			#movo pro registrador $a0 a str3
		li $v0,4				#printo na tela
		syscall	
		move $a0, $v1				# move o conteudo do registrador de retorno $v1 para o registrador $a0
		
	printar:
			li $t7, 10				# Armazena no registrador $t1 o índice 21
			la $t2, vetor				# Armzaena o registrador $t2 o endereço do vetor vet
			Loop:
 				sw $t0, 100($t2)			# Armazena na posição 0 do vetor o conteúdo do registrador $t0
 				addi $t1, $t1, 1 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
 				la $a0, ($t0)			#movo pro a0 o valor no indice
				li $v0,1			# informa que sera impresso um numero
				addi $t2, $t2, 4 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
				syscall				# realiza uma chamada de sistema
				la $a0, str4    			#movo pro registrador $a0 a str1
				li $v0,4				#printo na tela
				syscall					#chama o sistema
 				beq $t1, $t7, ExitLoop		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 				j Loop 				# Efetua o salto para o label Loop
				ExitLoop: li $v0, 10				# informa que o programa sera encerrado
					syscall					# realiza uma chamada de sistema
