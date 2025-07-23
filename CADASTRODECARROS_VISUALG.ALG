algoritmo "CadastroDeCarros_VisuAlg"
// Autor: Dennis (Adaptado)
// Data: 23/07/2025
// Objetivo: Sistema de cadastro de múltiplos carros

var
   quantidade_carros: inteiro
   i: inteiro
   modelo: vetor[1..10000] de caractere
   ano: vetor[1..10000] de inteiro
   cor: vetor[1..10000] de caractere
   placa: vetor[1..10000] de caractere
   placa_valida: logico

inicio
   // --- Apresentação ---
   escreval("==========================")
   escreval("   SISTEMA DE CADASTRO DE CARROS   ")
   escreval("==========================")
   escreval("")

   // --- Definir Quantidade de Carros ---
   enquanto (quantidade_carros <= 0) ou (quantidade_carros > 10000) faca
      escreva("Quantos carros você deseja cadastrar ? ")
      leia(quantidade_carros)

      se (quantidade_carros <= 0) ou (quantidade_carros > 10000) entao
         escreval
         escreval("!!! ERRO: Quantidade inválida! Por favor, digite um número entre 1 e 100.")
         escreval
      fimse
   fimenquanto

   escreval("")
   escreval("--- Preencha os dados dos carros ---")

   // --- Entrada de Dados para Cada Carro ---
   para i de 1 ate quantidade_carros faca
      escreval("==========================")
      escreval("   DADOS DO CARRO ", i)
      escreval("==========================")

      escreva("Modelo: ")
      leia(modelo[i])

      enquanto (ano[i] < 1990) ou (ano[i] > 2025) faca // Validação de ano simples
         escreva("Ano (ex: 2023): ")
         leia(ano[i])
         se (ano[i] < 1900) ou (ano[i] > 2100) entao
            escreval("!!! ERRO: Ano inválido! Por favor, digite um ano entre 1900 e 2100.")
            escreval
         fimse
      fimenquanto

      escreva("Cor: ")
      leia(cor[i])

      // Validação simples da placa (apenas comprimento)
      placa_valida <- falso
      enquanto nao placa_valida faca
         escreva("Placa (7 caracteres - ex: ABC1234): ")
         leia(placa[i])

         se compr(placa[i]) = 7 entao
            placa_valida <- verdadeiro
         senao
            escreval("!!! ERRO: Placa inválida! A placa precisa ter EXATAMENTE 7 caracteres.")
            escreval
         fimse
      fimenquanto
      escreval("")
   fimpara

   // Limpa a tela para mostrar o resultado final
   limpatela

   // --- Exibição dos Dados Cadastrados ---
   escreval("==========================")
   escreval("   CARROS CADASTRADOS   ")
   escreval("==========================")
   escreval("")

   para i de 1 ate quantidade_carros faca
      escreval("--- Carro ", i, " ---")
      escreval("Modelo: ", modelo[i])
      escreval("Ano: ", ano[i])
      escreval("Cor: ", cor[i])
      escreval("Placa: ", placa[i])
      escreval("--------------------------")
      escreval("")
   fimpara

   escreval("Cadastro de carros concluído com sucesso!")

fimalgoritmo