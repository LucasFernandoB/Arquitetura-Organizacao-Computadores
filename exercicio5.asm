.data
	vet: .word 
	str7 : .asciiz " Digite um numero: "
	str3: .asciiz " Agora, digite valor aleatorio:  "
	str2: .asciiz " Vetor resultante:  "
	str4: .asciiz " ;  "
.text
	main:
		li $t0, 0				 # Armazena no registrador $t0 o índice 0
		li $t3, 6				 # Armazena no registrador $t1 o índice 10
		la $t2, vet				 # Armzaena o registrador $t2 o endereço do vetor vet
	Loop:
		la $a0, str3   				#movo pro registrador $a0 a str3
		li $v0,4				#printo na tela
		syscall					#chama o sistema
	        sw $t0, 80($t2)				 # Armazena na posição 0 do vetor o conteúdo do registrador $t0
	        li $v0, 5				 # leio um numero que o usuario digitou
		syscall
		move $t1, $v0				#movo o q o usuario digitou pra um registrador temporario
		sw $t1, 80($t2)				#preencho a posicao do vetor com oq o usuario digitou		 	
 	        #  add $t0, $zero, $t1			 # Incrementa o índice a ser armazenado na posição correspondente do vetor
 	        addi $t4, $t4,1			 	# Incrementa o índice a ser armazenado na posição correspondente do vetor        
	        addi $t2, $t2, 4 			 # Incrementa $t2 de 4 (passa para o próximo item do vetor
 		beq $t4, $t3, ExitLoop			 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 	j Loop 						 # Efetua o salto para o label Loop
		
		ExitLoop: la $a0, str7    		#movo pro registrador $a0 a str3
		li $v0,4				#printo na tela
		syscall					#chama o sistema
		li $v0, 5				# leio um numero que o usuario digitou
		syscall
		move $t4,$v0				#movo o q o usuario digitou pra um registrador temporario
		la $t2, vet				 # Armzaena o registrador $t2 o endereço do vetor vet
		lw $s0, 100($t2)				# busco na memoria a posicao 5 do vetor deslocada 20 baites
		li $t0, 0				 # Armazena no registrador $t0 o valor 0
		slt $t0,$t4,$s0				# comparo os numeros e vejo se o t4 e menor
		addi $t6,$zero,1			# registrador de controle				
		beq $t0,$t6, else 			# comparo o q o usuario digitou com a posicao 5
		jal atualizaPar
		else: jal atualizaImpar
		
		jal printarVetor

		li $v0, 10				# informa que o programa sera encerrado
		syscall					# realiza uma chamada de sistema

		atualizaPar: 
				li $t3, 3			# Armazena no registrador $t1 o índice 3
				li $t1, 0			# Armazena no registrador $t0 o índice 0
				li $t7, 2			# Armazena no registrador $t0 o índice 0
				la $t2, vet			 # Armzaena o registrador $t2 o endereço do vetor vet
				addi $t7, $zero, 2 		# Incrementa o índice a ser armazenado na posição correspondente do vetor			
				Loop1:
 				sw $t0, 80($t2)			# Armazena na posição 0 do vetor o conteúdo do registrador $t0
 				addi $t1, $t1, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
 				sw $t7, 80($t2)			# mudo as posicoes pares do vetor com valor igual a 2
 				addi $t2, $t2, 8 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
 				beq $t1, $t3, ExitLoop1		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 				j Loop1 				# Efetua o salto para o label Loop
				ExitLoop1: jr  $ra			# retorna a execucaoo para o endereco armazenado em $ra
				

		atualizaImpar:
				li $t3, 3			# Armazena no registrador $t1 o índice 10
				li $t1, 0			 # Armazena no registrador $t0 o índice 0
				li $t7, 0			 # Armazena no registrador $t0 o índice 0
				la $t2, vet			 # Armzaena o registrador $t2 o endereço do vetor vet
				addi $t7, $zero, 1 
				Loop2:
 				sw $t0, 88($t2)			# Armazena na posição 0 do vetor o conteúdo do registrador $t0,comecando no indice 1
 				addi $t1,$t1,1		
 				sw $t7, 88($t2)			# mudo as posicoes pares do vetor com valor igual a 2
 				addi $t2, $t2, 8 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
 				beq $t1, $t3, ExitLoop2		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 				j Loop2 			# Efetua o salto para o label Loop
				ExitLoop2:jr  $ra		# retorna a execucaoo para o endereco armazenado em $ra
			
		printarVetor: 
				li $t3, 6			# Armazena no registrador $t1 o índice 10
				li $t1, 0			 # Armazena no registrador $t0 o índice 0
				li $t4, 0			 # Armazena no registrador $t0 o índice 0
				#li $t0, 0			 # Armazena no registrador $t0 o índice 0
				la $t2, vet			 # Armzaena o registrador $t2 o endereço do vetor vet
				la $a0, str2
				li $v0,4			# informa que sera impresso um numero
				syscall				# realiza uma chamada de sistema
			   Loop3:
				sw $t0, 80($t2)			# Armazena na posição 0 do vetor o conteúdo do registrador $t0
 				addi $t4, $t4, 1 		# Incrementa o índice a ser armazenado na posição correspondente do vetor
 				addi $t2, $t2, 4 		# Incrementa $t2 de 4 (passa para o próximo item do vetor)
 				la $a0, ($t0)			#movo pro a0 o valor no indice
				li $v0,1			# informa que sera impresso um numero
				syscall				# realiza uma chamada de sistema
				la $a0, str4   			#movo pro registrador $a0 a str3
				li $v0,4			#printo na tela
				syscall				#chama o sistema
 				beq $t4, $t3, ExitLoop3		 # testa se o conteudo dos registradores $t0 e $t1 são inguais
 				j Loop3 				# Efetua o salto para o label Loop
				ExitLoop3: jr $ra
				syscall
				
