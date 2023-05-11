Algoritmo "Conversao"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 20/01/2022
Var
// Seção de Declarações das variáveis 
F : real
C : real
K : real
FforC : real
FforK : real
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("==============Conversor de Escalas==============")
escreval("=================de Temperatura=================")
escreva("Temperatura °F:")
leia(F)
FforC <- (F-32) / 1.8
FforK <- (F-32) * (5/9) + 273
escreval("Celsius: ", FforC  , "°C")
escreva("Kelvin: " , FforK , "°K" )


Fimalgoritmo