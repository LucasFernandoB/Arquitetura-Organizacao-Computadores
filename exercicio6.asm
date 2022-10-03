.data
	str1: .asciiz "Digite um numero: "
	str2: .asciiz" Digite outro numero: "
	str3: .asciiz"\n 1- subtracao : "
	str4: .asciiz"\n 2- soma: "
	str5: .asciiz"\n 3- multiplicacao: "
	str6: .asciiz"\n 4- sair: \n Opcao: "
	str7: .asciiz"\n O resultado e: "
	str8: .asciiz"\n resultado da sua escolha: "
.text
	main:
		la $a0, str1    			#movo pro registrador $a0 a str1
		li $v0,4				#printo na tela
		syscall					#chama o sistema	
		li $v0, 5				# leio um numero que o usuario digitou
		syscall
		move $s0,$v0				#movo o q o usuario digitou pra um registrador temporario
		
		la $a0, str2    			#movo pro registrador $a0 a str2
		li $v0,4				#printo na tela
		syscall					#chama o sistema	
		li $v0, 5				# leio um numero que o usuario digitou
		syscall
		move $s7,$v0				#movo o q o usuario digitou pra um registrador temporario

		la $a0, str3    			#movo pro registrador $a0 a str3
		li $v0,4				#printo na tela
		syscall					#chama o sistema
		la $a0, str4    			#movo pro registrador $a0 a str4
		li $v0,4				#printo na tela
		syscall					#chama o sistema
		la $a0, str5    			#movo pro registrador $a0 a str5
		li $v0,4				#printo na tela
		syscall					#chama o sistema
		la $a0, str6    			#movo pro registrador $a0 a str6
		li $v0,4				#printo na tela
		syscall					#chama o sistema
		li $v0, 5				# leio o numero que o usuario digitou que refere a funcao
		syscall		
		move $t5,$v0
							#movo o q o usuario digitou pra um registrador temporario
		addi $s1,$zero,1			#movo pro registrador s1 o valor 1 pra comparar com a opcao que o usuario escolheu
		addi $s2,$zero,2			#movo pro registrador s2 o valor 2 pra comparar com a opcao que o usuario escolheu
		addi $s3,$zero,3			#movo pro registrador s3 o valor 3 pra comparar com a opcao que o usuario escolheu
		addi $s4,$zero,4			#movo pro registrador s4 o valor 4 pra comparar com a opcao que o usuario escolheu

		la $a0, str7    			#movo pro registrador $a0 a str7
		li $v0,4				#printo na tela
		syscall					#chama o sistema
		
		beq $s1, $t5, labe2			#comparo a funcao que o usuario escolheu com o registrador
		jal soma				#chamo a funcao soma
		labe2: beq $s2, $t5, labe3
		jal sub					#chamo a funcao subtracao
		labe3: beq $s3, $t5, labe4 
		jal m 				#chamo a funcao multiplicacao
		labe4: jal sair 			#chamo a funcao de sair do programa
		jal sair
		 



		soma: 
			add $s6,$s0,$s7      		#somo o q o usuario digitou
			move $a0, $s6				#movo pro a0 o registrador de retorno de metodo
			li $v0,1				#printo na tela
			syscall					#chama o sistema
			li $v0, 10			# informa que o programa sera encerrado
			syscall				# realiza uma chamada de sistema
			#jr $ra				#instrucao de retorno

		sub: 
			sub $s5,$s0,$s7     		#somo o q o usuario digitou
			move $a0, $t5				#movo pro a0 o registrador de retorno de metodo
			li $v0,1				#printo na tela
			syscall					#chama o sistema
			li $v0, 10			# informa que o programa sera encerrado
			syscall				# realiza uma chamada de sistema
			#jr $ra					#instrucao de retorno

		m:  
			mul $s6, $s0, $s7     		#somo o q o usuario digitou
			move $a0, $s6				#movo pro a0 o registrador de retorno de metodo
			li $v0,1				#printo na tela
			syscall					#chama o sistema
			li $v0, 10			# informa que o programa sera encerrado
			syscall				# realiza uma chamada de sistema
			#jr $ra					#instrucao de retorno

		sair: 
			li $v0, 10			# informa que o programa sera encerrado
			syscall				# realiza uma chamada de sistema
