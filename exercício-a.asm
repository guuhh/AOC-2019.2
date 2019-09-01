# Exercício 1 - letra a
# int y = 5;
# int y = 4;
# z = 5x^x + x + 3y + 8;
# z = 150

.data

       x: .word 5
       y: .word 4


.text
#carregar valores em memoria de X e Y para os reggistradores $t0 e $t1 respectivamente
        lw $s1,x
        lw $s2,y

#reusando registro $t0 como contador
        li $t0,0
        
#Função
#z = 5x^x + x + 3y + 8


# calcular x^x
for_x_x:

          beq   $t0, $s1, for_5_x_x #Desvia para "for_5_x_x" se o valor $t0 é igual a $s1
 
          add  $s3,$s3,$s1          #Adicionar valor 5 ao registrador $s3

          addi $t0,$t0,1            #Incrementar contador do for_x_x + 1
          
j for_x_x                           #Executar laço até satisfazer valor de $t0 igual a $s1, valor 5

# multiplicar 5 pelo valor de x^x
for_5_x_x:

           beq  $t5,5, for_3y       #Desvia para "for_3y" se o valor $t5 é igual a 5
 
           add  $s4,$s4,$s3         #Adicionar valor 5 ao registrador $s4

           addi $t5,$t5,1           #Incrementar contador do for_5_x_x +1
            
j for_5_x_x                         #Executar laço até satisfazer valor de $t0 igual a $s1, valor 5

#Multiplicar 3 pelo valor de y
for_3y:

           beq  $t6,3, end_sum     #Desvia para "end_sum" se o valor $t0 é igual a $t1
           
           add  $s5,$s5,$s2        #Adicionar valor 5 ao registrador $s5

           addi $t6,$t6,1          #Incrementar contador de for_3y +1
           
j for_3y                           #Executar laço até satisfazer valor de $t0 igual a $s1, valor 5

#soma de todos os valore
end_sum:

           add $s6,$s6,$s4         #Soma de z = 5(x^x) 

           add $s6,$s6,$s1         #Soma de z = 5(x^x) + x
 
           add $s6,$s6,$s5         #Soma de z = 5(x^x) + + 3y

          addi $s6,$s6,8         #Soma de z = 5(x^x) + + 3y + 8

#Imprimir o valor de Z
           li $v0, 1
           add $a0, $a0,$s6
           syscall  
j end

end:
           li $v0,10  #realize uma chamada no sistema operacional
           syscall
      
