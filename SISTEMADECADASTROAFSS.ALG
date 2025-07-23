algoritmo "SistemaDeCadastro_VisuAlg"
// Autor: Dennis
// Data: 23/07/2025
// Objetivo: Sistema de cadastro

var
   nome, nome_usuario, senha, email, cpf: caractere
   contem_arroba: logico
   i: inteiro

inicio
   // --- Apresentação ---
   escreval("==========================")
   escreval("    SISTEMA DE CADASTRO     ")
   escreval("==========================")
   escreval("")

   // --- Entrada de Dados ---
   escreva("Digite seu nome completo: ")
   leia(nome)

   escreva("Digite um nome de usuário: ")
   leia(nome_usuario)

   escreva("Digite sua senha: ")
   leia(senha)

   // --- Validação do E-mail ---
   contem_arroba <- falso
   enquanto nao contem_arroba faca
      escreva("Digite seu e-mail: ")
      leia(email)

      para i de 1 ate compr(email) faca
         se (copia(email, i, 1) = "@") entao
            contem_arroba <- verdadeiro
         fimse
      fimpara

      se nao contem_arroba entao
         escreval
         escreval("!!! ERRO: E-mail inválido! O e-mail precisa ter o caractere '@'.")
         escreval
      fimse
   fimenquanto

   // --- Validação do CPF ---

   enquanto (compr(cpf) <> 11) faca
      escreva("Digite seu CPF (apenas 11 números): ")
      leia(cpf)

      se (compr(cpf) <> 11) entao
         escreval
         escreval("!!! ERRO: CPF inválido! O CPF precisa ter EXATAMENTE 11 números.")
         escreval
      fimse
   fimenquanto

   // Limpa a tela para mostrar o resultado final
   limpatela

   // --- Exibição dos Dados Cadastrados ---
   escreval("  CADASTRO REALIZADO COM SUCESSO!  ")
   escreval("Nome: ", nome)
   escreval("Nome de Usuário: ", nome_usuario)
   escreval("Senha: ", senha)
   escreval("E-mail: ", email)
   escreval("CPF: ", cpf)
fimalgoritmo