.data
	vetor: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0			#vetor pra fazer a mudanca
	vetor1: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	str1: .asciiz "\nDigite um  numero:  "
	str2: .asciiz "\nVetor antes da mudanca: "
	str3: .asciiz "\nVetor depois da mudanca: "
.text
     main: 

	la $a0, str1    			#movo pro registrador $a0 a str1
	li $v0,4				#printo na tela
	syscall					#chama o sistema
	
	li $t0, 0 				# Armazena no registrador $t0 o índice 0
	li $t7, 21				# Armazena no registrador $t1 o índice 21
	la $t2, vetor				# Armzaena o registrador $t2 o endereço do vetor vet
	
	li $v0, 5				# leio um numero que o usuario digitou
	syscall
	move $t1, $v0				#movo o q o usuario digitou pra um registrador temporario
	
	beq $t1, $zero, L2			#comparo se o que o usuario digitou for zero, se for chamo a funcao atribuir par
	jal atribuirPar
				
	L2: jal atribuirImpar			# se oq o usuario digitou for impar atribuo impar nos vetores		
	
	li $v0, 10				# informa que o programa ser encerrado
	syscall					# realiza uma chamada de sistema
	
	atribuirPar:		
		loop:
			sw $t0, 0($t2) 			# Armazena na posição 0 do vetor o conteúdo do registrador $t0
 			addi $t0, $t0, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
 			addi $t2, $t2, 8 		# Incrementa $t2 de 8 (passa para o próximo item do vetor)
 			beq  $t0, $t7, Exit          # testa se o conteudo dos registradores $t0 e $t1 são inguais
			
		j loop
		Exit:
		la $a0, str2    			#movo pro registrador $a0 a str2
		li $v0,4				#printo na tela a str2        	
		syscall
		la $a0, vetor	  			#movo pro registrador $a0 o vetor
		li $v0,1				#printo na tela o vetor       	
		syscall


		la $a0, str3    			#movo pro registrador $a0 a str3
		li $v0,4				#printo na tela
		syscall	
		move $a0, $v1				# move o conteudo do registrador de retorno $v1 para o registrador $a0
		la $a0, vetor1	  			#movo pro registrador $a0 o vetor		la
		li $v0, 1				# informa que sera impresso um vetor
		syscall					# realiza uma chamada de sistema
		li $v0, 10				# informa que o programa ser encerrado
		syscall					# realiza uma chamada de sistema
		#jr  $ra				 # retorna a execucao para o endereco armazenado em $ra		
		



	atribuirImpar:
		loop1:
			sw $t0, 4($t2) # Armazena na posição 0 do vetor o conteúdo do registrador $t0
 			addi $t0, $t0, 1 # Incrementa o índice a ser armazenado na posição correspondente do vetor
 			addi $t2, $t2, 8 # Incrementa $t2 de 8 (passa para o próximo item do vetor)
 			beq $t0, $t7 ,Exit1 # ExitLoop # testa se o conteudo dos registradores $t0 e $t1 são inguais
 		
		j loop1
		Exit1:
		la $a0, str2    			#movo pro registrador $a0 a str2
		li $v0,4				#printo na tela a str2        	
		syscall
		la $a0, vetor	  			#movo pro registrador $a0 o vetor
		li $v0,1				#printo na tela o vetor       	
		syscall

		la $a0, str3    			#movo pro registrador $a0 a str3
		li $v0,4				#printo na tela
		syscall	
		move $a0, $v1				# move o conteudo do registrador de retorno $v1 para o registrador $a0
		la $a0, vetor1	  			#movo pro registrador $a0 o vetor		
		li $v0, 1				# informa que sera impresso um vetor
		syscall					# realiza uma chamada de sistema
		li $v0, 10				# informa que o programa ser encerrado
		syscall					# realiza uma chamada de sistema		
		#jr  $ra				# retorna a execuo para o endereo armazenado em $ra