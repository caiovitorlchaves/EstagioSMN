Algoritmo "teste"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 25/01/2022
Var
// Seção de Declarações das variáveis 
per1: inteiro
per2: inteiro
per3: inteiro
per4: inteiro
per5: inteiro
rep1: inteiro
rep2: inteiro
contador : inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
rep1 <- 1
rep2 <- 0
escreva("Prefere  chuva(1) ou sol(0)?: ")
leia(per1)
escreva("Prefere frio(1) ou calor(0)?: ")
leia(per2)
escreva("Qual a melhor pessoa do trabalho, Emerson(1) ou Litle Lima?(0): ")
leia(per3)
contador <- per1 + per2 + per3
se (contador >= 2)entao
escreva("parabéns, você é uma pessoa normal.")
senao
escreva("Pessimo gosto companheiro.")
fimse

Fimalgoritmo