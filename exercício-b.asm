# Exercício 1 - letra b
# int a = 10;
# int b = 25;
# int c =7;
# char d = 'a';
# if ( a < b && c != 0 && d == ‘a’ ) e = 1; 
# if true, e = 1; else e = 0; 

.data

       a: .word 10
       b: .word 25
       c: .word 7
       d: .word 'a'
       e: .word 0


.text
# carregando valores nos registradores
       lw $t0,a
       lw $t1,b
       lw $t2,c
       lw $t3,d
       lw $t4,e
                 
# Se a menor b
a_less_than_b:

        blt $t0, $t1, c_is_different_zero # Se a menor que b, vá para c é diferente de zero
        j display_e                        # Se não, imprima valor de e igual a zero

        
c_is_different_zero:
 
        bne $t2, 0, d_equal_char_a        # Se c é diferente de zero, vá para d egual a char 'a'
        j display_e                       # Se não, imprima valor de e igual a zero
        

d_equal_char_a:
  
         beq $t3, 'a', e_constains_one     # Se d é igual a char 'a', vá para adicionar valor 1 para e
         j display_e                      # Se não, imprima valor de e igual a zero
         

e_constains_one:

          li $t4,1                        # Adicionar valor 1 para e
          j display_e
          
display_e:
           
          li $v0,1                       # Configucação para imprimir inteiro
          move $a0,$t4                   # Movendo valor de e para ser imprimido no sistema
          syscall                        # Chamada do sistema
          
          #Saida do sistema
          li $v0,10
          syscall
        
                
       
        