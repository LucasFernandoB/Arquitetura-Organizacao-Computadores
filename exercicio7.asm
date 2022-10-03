.data
    str: .asciiz "digite um numero x:  "
    resultado: .asciiz "Fatorial(x) = "
.text
main:
   
    li        $v0, 4			#informo que sera printado uma string
    la        $a0, str			#printo a string
    syscall
   
    li        $v0, 5			#leio o numero que o usuario digitou
    syscall
  
    move      $a0, $v0			#movo oq o usuario digitou pro registrador a0
    jal      factorial      		#chamo a funcao
    move      $t0, $v0        
   
    li        $v0, 4			#informo que sera printado uma string
    la        $a0, resultado		#printo a string
    syscall
   
    li        $v0, 1       		#informo que sera printado um nunero
    move      $a0, $t0    		#movo o valor do registrador $t0 e printo ele   
    syscall               
   
    li        $v0, 10      		#encerro o programa
    syscall


.text
factorial:
   					 # caso base - ainda no segmento de pilha dos pais
   					 # ajustar o ponteiro da pilha para armazenar o endereço de retorno e o argumento
    addi    $sp, $sp, -8      		 #a sp e o ponteiro da pilha
   					 # salva $s0 e $ra
    sw      $s0, 4($sp)			# salva o numero do registrador
    sw      $ra, 0($sp)
    bne     $a0, 0, else		#condicao de parada do fatorial
    addi    $v0, $zero, 1   				 # return 1
    j fact_return

	else:   							
   		move    $s0, $a0			# copia  $a0
    		addi    $a0, $a0, -1			 # vou diminuindo o numero que o usuario digitou
    		jal     factorial			# quando chegamos aqui, já temos o Fatorial (x-1) salvo em $ v0
    		multu   $s0, $v0 			# return x*Fact(x-1)  	
    		mflo    $v0				#operacao especivica pra acessar o numero no registrador
fact_return:
    lw      $s0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra
