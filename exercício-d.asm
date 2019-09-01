# Exercício 1 - letra d
# int a = 0;
# int b = 15;
# for(int i=0; i < 3; i++) {a += b;};  a = a+b
# saída de a=

.data
# Carregando em memoria valor 1 e 0 nos indexs a e b respectivamente
       a: .word 0
       b: .word 15
       i: .word 0

.text
# carregando valores nos registradores
       lw $t0,a       # valor de a no registrador
       lw $t1,b       # valor de b no registrador
       lw $s0,i       # contador do for setado igual a zero
       
for_increment_b_to_a:

        beq $s0,3 display_a      # Se contador i < 3, continue, Se não imprima a soma de a
        add $t0,$t0,$t1          # Increment a  = a + b; 
        addi $s0,$s0,1           # Incremente +1 no contador i
        j for_increment_b_to_a   # Loop da label "for_increment_b_to_a" até satisfazer i < 3
        
display_a:

          li $v0,1                       # Configucação para imprimir inteiro
          move $a0,$t0                   # Movendo valor de a para ser imprimido no sistema
          syscall                        # Chamada do sistema
          
          #Saida do sistema
          li $v0,10
          syscall
