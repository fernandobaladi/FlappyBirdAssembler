.data
	blanco1: .word 0xFFFFFF
	amarillo: .word 0xfbfc00
	negro: .word 0x000000
	verde:   .word 0x14EE00
	naranja: .word 0xF7792B
	mostaza: .word 0xF7CB2B
	azul: .word 0x0cc6de
	blanco: .word 0xFFFFFF
	puntuación: .asciiz "PERDISTE. TU PUNTAJE ES:  "
	despedida: .asciiz "QUIERES VOLVER A JUGAR?"
.text
	
.eqv base, 0x10000000 

#Usos de las variables:

#<---------------------------------------------------------------------- MACROS------------------------------------------------------>
		
.macro repintarFondoCaer($posición)
	move $t0, $posición
	addi $t1, $t0, base
	addi $t0, $t0, base
	addi $t0, $t0, -512
	pintar(17, azul)
	addi $t0, $t0, -512
	pintar(17, azul)
	move $t0, $t1 
	pintar(17, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(6, azul)
	addi, $t0, $t0, 24
	pintar(5, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(4, azul)
	addi $t0, $t0, 36
	pintar(4, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(3, azul)
	addi $t0, $t0, 44
	pintar(3, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(1, azul)
	addi $t0, $t0, 56
	pintar(2, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 60
	pintar(2,azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 60
	pintar(2,azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 64
	pintar(1,azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(1,azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(2,azul)
	addi $t0, $t0, 56
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(4,azul)
	addi $t0, $t0, 48
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(5,azul)
	addi $t0, $t0, 44
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(7,azul)
	addi $t0, $t0, 16
	pintar(6, azul)
.end_macro

.macro repintarFondoSubir($posición)
	move $t0, $posición
	addi $t1, $t0, base
	addi $t0, $t0, base
	addi $t0, $t1, 2560
	addi $t1, $t1, 2560
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(2, azul)
	addi $t0, $t0, 56
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(4, azul)
	addi $t0, $t0, 48
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(5, azul)
	addi $t0, $t0, 44
	pintar(1, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(7, azul)
	addi $t0, $t0, 16
	pintar(6, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(17, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(17, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(17, azul)
.end_macro 	
		
.macro drawFlappy($posición)
	chocar($posición)
	move $t0, $posición
	addi $t1, $t0, base
	addi $t0, $t0, base
	addi $t0, $t0, 24
	pintar(6, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 16
	pintar(2, negro)
	pintar(4, amarillo)
	pintar(1, negro)
	pintar(1, blanco)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 12
	pintar(1, negro)
	pintar(5, amarillo)
	pintar(1, negro)
	pintar(3, blanco)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 4
	pintar(4, negro)
	pintar(4, amarillo)
	pintar(1, negro)
	pintar(2, blanco)
	pintar(1, negro)
	pintar(1, blanco)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(1, negro)
	pintar(4, blanco)
	pintar(1, negro)
	pintar(3, amarillo)
	pintar(1, negro)
	pintar(2, blanco)
	pintar(1, negro)
	pintar(1, blanco)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(1, negro)
	pintar(5, blanco)
	pintar(1, negro)
	pintar(3, amarillo)
	pintar(1, negro)
	pintar(3, blanco)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	pintar(1, negro)
	pintar(1, amarillo)
	pintar(3, blanco)
	pintar(1, amarillo)
	pintar(1, negro)
	pintar(4, amarillo)
	pintar(5, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 4
	pintar(1, negro)
	pintar(3, amarillo)
	pintar(1, negro)
	pintar(4, amarillo)
	pintar(1, negro)
	pintar(5, naranja)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 8
	pintar(3, negro)
	pintar(4, mostaza)
	pintar(1, negro)
	pintar(1, naranja)
	pintar(5, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 16
	pintar(1, negro)
	pintar(5, mostaza)
	pintar(1, negro)
	pintar(4, naranja)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 20
	pintar(2, negro)
	pintar(4, mostaza)
	pintar(5, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t0, $t0, 28
	pintar(4, negro)
.end_macro 

.macro bajarFlappy($posición)
	repintarFondoCaer($posición)
	addi $s2, $s2, 512
	drawFlappy($posición)
	bge $s2, 59492, finDelJuego
.end_macro 

.macro subirFlappy($posición)
	repintarFondoSubir($posición)
	addi $s2, $s2, -512
	drawFlappy($posición)
	bge $s2, 0, finDelJuego
.end_macro 

.macro randomTubería1()
	li $a1, 60
	li $v0, 42
	syscall
	add $s0, $a0, 15  
.end_macro 
.macro randomTubería2()
	li $a1, 60
	li $v0, 42
	syscall
	add $s1, $a0, 15  
.end_macro 
.macro drawTubería($posición, $aleatorio)
	move $t0, $posición
	addi $t1, $t0, base
	addi $t0, $t0, base
 	move $t7, $aleatorio	

loopTubería:	
	pintar(1, negro)
	pintar(17, verde)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t7, $t7, -1
	bgtz $t7, loopTubería
	pintar(19, negro)
	addi $t0, $t1, 	19968
	addi $t1, $t1, 19968
	pintar(19, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	li $t8, 87
	sub $t7, $t8, $aleatorio

loopTubería2:	
	pintar(1, negro)
	pintar(17, verde)
	pintar(1, negro)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t7, $t7, -1
	bgtz $t7, loopTubería2
.end_macro
.macro borrarTubería($posición, $aleatorio)
	move $t0, $posición
	addi $t1, $t0, base
	addi $t0, $t0, base
 	move $t7, $aleatorio	
loopTubería:	
	pintar(20, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t7, $t7, -1
	bgtz $t7, loopTubería
	pintar(20, azul)
	addi $t0, $t1, 	19968
	addi $t1, $t1, 19968
	pintar(20, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	li $t8, 87
	sub $t7, $t8, $aleatorio
loopTubería2:	
	pintar(20, azul)
	addi $t0, $t1, 512
	addi $t1, $t1, 512
	addi $t7, $t7, -1
	bgtz $t7, loopTubería2
.end_macro 	

.macro pintar($espacios, $color) 
	li $t8, $espacios
	lw $t5, $color
loop1:  sw $t5, 0($t0)
	addi $t0, $t0, 4
	addi $t8, $t8, -1 
	bgtz $t8, loop1
.end_macro
.macro chocar($posición)
	move $t0, $posición
	addi $t0, $t0, base
	li $t8, 5
	li $t7, 0x14EE00	
	lw $t1,28($t0)
	beqz $t1, fin
	lw $t1,32($t0)
	beqz $t1, fin
	lw $t1,36($t0)
	beqz $t1, fin
	lw $t1,40($t0)
	beqz $t1, fin
	lw $t1,44($t0)
	beqz $t1, fin
	addi $t0, $t0, 512
	lw $t1, 16($t0)
	beqz $t1, fin
	lw $t1, 20($t0)
	beqz $t1, fin
	lw $t1, 48($t0)
	beqz $t1, fin
	addi $t0, $t0, 512
	lw $t1, 12($t0)
	beqz $t1, fin
	lw $t1, 52($t0)
	beqz $t1, fin
	addi $t0, $t0, 512
	lw $t1, 4($t0)
	beqz $t1, fin
	lw $t1, 8($t0)
	beqz $t1, fin
	lw $t1, 56($t0)
	beqz $t1, fin
	addi $t0, $t0, 2048
	lw $t1, 4($t0)
	beqz $t1, fin		
	lw $t1,64($t0)
	beqz $t1, fin	
	addi $t0,$t0,512
	lw $t1, 8($t0)
	beqz $t1, fin
	lw $t1, 12($t0)
	beqz $t1, fin
	addi $t0,$t0,512
	lw $t1, 16($t0)
	beqz $t1, fin
	addi $t0,$t0,512
	lw $t1, 20($t0)
	beqz $t1, fin
	lw $t1, 24($t0)
	beqz $t1, fin
	lw $t1, 44($t0)
	beqz $t1, fin
	lw $t1, 48($t0)
	beqz $t1, fin
	lw $t1, 52($t0)
	beqz $t1, fin
	lw $t1, 56($t0)
	beqz $t1, fin
	addi $t0,$t0,512
	lw $t1, 28($t0)
	beqz $t1, fin
	lw $t1, 32($t0)
	beqz $t1, fin
	lw $t1, 36($t0)
	beqz $t1, fin
	lw $t1, 40($t0)
	beqz $t1, fin
	b salir
fin:
	li $s3, 1
salir:	
.end_macro 
#<-------------------------------------------------------------CÓDIGO------------------------------------------------------------------>

iniciar:	
	li $t0, 0
	lw $t1, azul
	li $t6, 432
	li $t9, 0
	li $s7, 0
	li $s3, 0

loop:   
	sw $t1, base($t0)
	addi $t0, $t0, 4
	blt $t0, 65538, loop 
	li $s2, 28260
	randomTubería1()
	drawTubería($t6, $s0)
	drawFlappy($s2)
	b pausa

caer:
	li $v0, 30
	syscall
	addi $s6, $a0, 5
	
retardo: 
	lw $t3, 0xffff0000
	li $v0, 30
	syscall
	blt $a0, $s6, no_movimiento
	add $s2, $s2, $t4
	bgtz $t9, restar9 
vuelve:	
	bgtz $t6, restar6
vuelve2:
	beq $t6, 140, segundaTubería
	beq $t6, 8, eliminarTubería1
	beq $t9, 140, primeraTubería
	beq $t9, 8, eliminarTubería2
	bge $s2, 59492, finDelJuego
	beqz $t9, moverSoloT6
	beqz $t6, moverSoloT9
	blt  $t6, 140, moverAmbasTuberías
	blt $t9, 140, moverAmbasTuberías
volver:	li $v0, 30
	syscall
	addi $s6, $a0, 5	
 	
no_movimiento:
	li $t4, 512
	bne $t3, 1, retardo
	lw $t2, 0xffff0004
	beq $t2, 119, arriba
	beq $t2, 80, pausa
	beq $t2, 112, pausa
	b caer

restar9: subi $t9, $t9, 4
	b vuelve
restar6: subi $t6, $t6, 4
	b vuelve2
pausa:
	lw $t3, 0xffff0000
	lw $t2, 0xffff0004
	beq $t2, 112, pausa
	bne $t3, 1,pausa
	b caer
	
arriba:
	li $t2, 8
	
arribaloop:	

	add $s2, $s2, -512
	bltz $s2, finDelJuego
	repintarFondoSubir($s2)
	li $v0, 30
	syscall
	addi $s6, $a0, 25
	drawFlappy($s2)
	beq $s3, 1, finDelJuego
	subi $t2, $t2, 1
	bnez $t2, arribaloop
	b retardo

salir: 
	add $s2, $s2, 512
	b retardo
eliminarTubería1:
	borrarTubería($t6, $s0)
	borrarTubería($t9, $s1)
	repintarFondoCaer($s2)
	drawFlappy($s2)
	li $t6, 0
	beq $s3, 1, finDelJuego
	b retardo
eliminarTubería2:
	borrarTubería($t9, $s1)
	borrarTubería($t6, $s0)
	repintarFondoCaer($s2)
	drawFlappy($s2)
	li $t9, 0
	beq $s3, 1, finDelJuego
	b retardo
primeraTubería:
	li $t6, 432
	randomTubería1()
	drawTubería($t6, $s0)
moverSoloT9:
	#repintarFondoCaer($s2)
	borrarTubería($t9, $s1)
	#drawFlappy($s2)
	repintarFondoCaer($s2)
	drawTubería($t9, $s1)		
	drawFlappy($s2)
	beq $s3, 1, finDelJuego
	b volver
segundaTubería:
	li $t9, 432
	randomTubería2()
	drawTubería($t9, $s1)
moverSoloT6:
	#repintarFondoCaer($s2)
	borrarTubería($t6, $s0)
	#drawFlappy($s2)
	repintarFondoCaer($s2)
	drawTubería($t6, $s0)
	drawFlappy($s2)
	beq $s3, 1, finDelJuego
	b volver
moverAmbasTuberías:
	#repintarFondoCaer($s2)
	borrarTubería($t6, $s0)
	borrarTubería($t9, $s1)
	repintarFondoCaer($s2)
	#drawFlappy($s2)
	drawTubería($t6, $s0)
	drawTubería($t9, $s1)
	drawFlappy($s2)
	beq $t6, 24, suma
	beq $t9, 24, suma
	beq $s3, 1, finDelJuego
	b volver
suma:
	addi $s7, $s7, 1
	b volver
finDelJuego:	
	la $a0, puntuación
	move $a1, $s7
	li $v0, 56
	syscall
	li $v0, 50
	la $a0, despedida
	syscall 
	beqz $a0, iniciar
	li $v0, 10
	syscall
