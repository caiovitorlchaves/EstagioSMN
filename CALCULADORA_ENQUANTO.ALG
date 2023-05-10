Algoritmo "Calculadora_Enquanto"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 25/01/2022
Var
// Seção de Declarações das variáveis 
numero1: real
numero2: real
op1: inteiro
op2: inteiro
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
escreval("==============Calculadora==============")
escreva("Deseja iniciar a calculadora? ")
leia(op1)
enquanto (op1 <> 0) e (op1 =1) faca
escreva("Digite o primeiro número:")
leia(numero1)
escreva("Digite o segundo número:")
leia(numero2)
limpatela()
escreval("==============Resultados==============")
escreval(numero1, " +" , numero2 , " =", numero1 + numero2)
escreval(numero1, " -" , numero2 , " =", numero1 - numero2)
escreval(numero1, " *" , numero2 , " =", numero1 * numero2)
escreval(numero1, " /" , numero2 , " =", numero1 / numero2)
escreva("Deseja continuar a calculadora? ")
leia(op1)
fimenquanto
se(op1 > 1)entao
escreva("Digite uma entrada valida: ")
leia(op1)
senao
escreva("A calculadora foi encerrada")
fimse
Fimalgoritmo
