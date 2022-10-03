.data
	str1: .asciiz " Digite um  numero: "
	str2: .asciiz " Digite outro  numero: "
	str3: .asciiz "\nO numero maior e: "
	str4: .asciiz "\n O numero digitado e maior que 10."

.text
	main:
		la $a0, str1    			#movo pro registrador $a0 a str1
		li $v0,4				#printo na tela
		syscall					#chama o sistema	
		li $v0, 5				# leio um numero que o usuario digitou
		syscall
		move $t0,$v0				#movo o q o usuario digitou pra um registrador temporario
		
		la $a0, str2    			#movo pro registrador $a0 a str2
		li $v0,4				#printo na tela
		syscall					#chama o sistema	
		li $v0, 5				# leio um numero que o usuario digitou
		syscall
		move $t1,$v0				#movo o q o usuario digitou pra um registrador temporario

		addi $t6,$zero,10			#coloco no registrador t6 o valor 10 pra comparacao
		slt $t3,$t0,$t1				# comparo os valores que o usuario digitou e armazerno em t3 1 se for t0 o menor
		addi $t4, $t4, 1			#adiciono o 1 no registrador pra fazer comparacao
		beq $t3,$t4, L2				#comparo o valor que esta em t3 com o valor 1 do t4, se o numero for maior mostra ele
		la $a0,str3				#carrega no registrador a0 a string 3
		li $v0,4				#mostro que sera impreeso uma string
		syscall		
		move $a0,$t0				#carrega o numero que o usuario digitou e portanto o menor em a0
		li $v0,1				#mostro que sera impreeso um numero
		syscall
		
		L2: la $a0,str3				#carrega no registrador a0 a string 3
		li $v0,4				#mostro que sera impreeso uma string
		syscall
		move $a0, $t1				#movo o numero que o usuario digitou pro a0
		li $v0,1
		syscall
	
		slt $t3,$t0,$t6				#comparo se o numero que o usuario digitou e menor que 10
		addi $t7, $t7,1
		beq $t3,$t7  label			#comparo o valor em t3 realizado com a operaco da linha acima
		la $a0,str4				#carrego em a0 a string 4
		li $v0,4
		syscall
		li $v0, 10				# informa que o programa sera encerrado
		syscall					# realiza uma chamada de sistema
		
		label: li $v0, 10				# informa que o programa sera encerrado
		syscall					# realiza uma chamada de sistema
