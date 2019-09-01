# Exercício 1 - letra c
# int a = 10;
# if a > 0, b = a + 20 else b = a - 20; 

.data
# Carregando em memoria valor 1 e 0 nos indexs a e b respectivamente
       a: .word 10
       b: .word 0

.text
# carregando valores nos registradores
       lw $t0,a
       lw $t1,b
       
a_great_than_zero:

       bgt $t0,0 b_constains_a_sum_20 # Se a é maior que 0, adicione valor de a + 20 em b
       j b_constains_a_minus_20       # Se não, adicione valor de a - 20 em b
       
b_constains_a_sum_20:

       add $t1,$t1,$t0               # Adicione valor de a em b
       addi $t1,$t1,20               # Adicione valor de 20 em b
       j display_b

b_constains_a_minus_20:
        
       add $t1,$t1,$t0                # Adicione valor de a em b
       addi $t1,$t1,-20               # Adicione valor de -20 em b
       j display_b
       
display_b:

          li $v0,1                       # Configucação para imprimir inteiro
          move $a0,$t1                   # Movendo valor de b para ser imprimido no sistema
          syscall                        # Chamada do sistema
          
          #Saida do sistema
          li $v0,10
          syscall