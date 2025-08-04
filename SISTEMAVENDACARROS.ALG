algoritmo "SistemaVendaCarros"
var
    // Variáveis para cadastro de carros
    modelos: vetor[1..100] de caractere
    anos: vetor[1..100] de inteiro
    precos: vetor[1..100] de real
    estoques: vetor[1..100] de inteiro
    totalCarros: inteiro

    // Variáveis para cliente
    nomeCliente: caractere
    cpfCliente: caractere
    emailCliente: caractere

    // Variáveis para compras
    carrosComprados: vetor[1..100] de inteiro
    quantidadesCompradas: vetor[1..100] de inteiro
    totalItensComprados: inteiro
    valorTotalBruto: real
    valorDescontos: real
    valorImpostos: real
    valorFinal: real

// Função para cadastrar carros
funcao cadastrarCarro()
var
    modelo: caractere
    ano, estoque: inteiro
    preco: real
    anoAtual: inteiro
inicio
    anoAtual <- 2024 // Pode ser obtido automaticamente

    escreva("Modelo do carro: ")
    leia(modelo)

    repita
        escreva("Ano (1990-", anoAtual, "): ")
        leia(ano)
        se ano < 1990 ou ano > anoAtual entao
            escreval("Ano inválido! Deve ser entre 1990 e ", anoAtual)
        fimse
    ate ano >= 1990 e ano <= anoAtual

    repita
        escreva("Preço (min R$10.000): R$ ")
        leia(preco)
        se preco < 10000 entao
            escreval("Preço inválido! Mínimo R$10.000")
        fimse
    ate preco >= 10000

    escreva("Estoque: ")
    leia(estoque)

    totalCarros <- totalCarros + 1
    modelos[totalCarros] <- modelo
    anos[totalCarros] <- ano
    precos[totalCarros] <- preco
    estoques[totalCarros] <- estoque

    escreval("Carro cadastrado com sucesso!")
fimfuncao

// Função para cadastrar cliente
funcao cadastrarCliente()
inicio
    repita
        escreva("Nome do cliente: ")
        leia(nomeCliente)
    ate compr(nomeCliente) > 0

    repita
        escreva("CPF (11 dígitos): ")
        leia(cpfCliente)
        se compr(cpfCliente) <> 11 entao
            escreval("CPF inválido! Deve ter 11 dígitos.")
        fimse
    ate compr(cpfCliente) = 11

    repita
        escreva("E-mail (deve conter @): ")
        leia(emailCliente)
        se pos("@", emailCliente) = 0 entao
            escreval("E-mail inválido! Deve conter @.")
        fimse
    ate pos("@", emailCliente) > 0

    escreval("Cliente cadastrado com sucesso!")
fimfuncao

// Função para registrar compra
funcao registrarCompra()
var
    opcao, indiceCarro, quantidade: inteiro
    precoItem, descontoItem: real
    anoAtual: inteiro
inicio
    anoAtual <- 2024
    totalItensComprados <- 0
    valorTotalBruto <- 0
    valorDescontos <- 0
    valorImpostos <- 0

    escreval("=== REGISTRAR COMPRA ===")

    repita
        escreval("\nCarros disponíveis:")
        para i de 1 ate totalCarros faca
            escreva(i, " - ", modelos[i], " (", anos[i], ") - R$ ", precos[i]:0:2)
            escreval(" - Estoque: ", estoques[i])
        fimpara

        escreva("\nEscolha um carro (0 para finalizar): ")
        leia(opcao)

        se opcao > 0 e opcao <= totalCarros entao
            escreva("Quantidade: ")
            leia(quantidade)

            se quantidade <= 0 entao
                escreval("Quantidade inválida!")
            senao se quantidade > estoques[opcao] entao
                escreval("Estoque insuficiente! Disponível: ", estoques[opcao])
            senao
                // Adiciona à compra
                totalItensComprados <- totalItensComprados + 1
                carrosComprados[totalItensComprados] <- opcao
                quantidadesCompradas[totalItensComprados] <- quantidade

                // Atualiza estoque
                estoques[opcao] <- estoques[opcao] - quantidade

                // Calcula valor bruto
                precoItem <- precos[opcao] * quantidade
                valorTotalBruto <- valorTotalBruto + precoItem

                // Aplica descontos
                descontoItem <- 0

                // Desconto de 5% se comprar mais de 2 carros
                se totalItensComprados > 2 entao
                    descontoItem <- descontoItem + (precoItem * 0.05)
                fimse

                // Desconto adicional de 10% se ano < atual
                se anos[opcao] < anoAtual entao
                    descontoItem <- descontoItem + (precoItem * 0.10)
                fimse

                valorDescontos <- valorDescontos + descontoItem

                escreval("Item adicionado à compra!")
            fimse
        senao se opcao <> 0 entao
            escreval("Opção inválida!")
        fimse
    ate opcao = 0

    // Aplica imposto de luxo (8%) se valor líquido > R$100.000
    valorFinal <- valorTotalBruto - valorDescontos
    se valorFinal > 100000 entao
        valorImpostos <- valorFinal * 0.08
        valorFinal <- valorFinal + valorImpostos
    fimse

    escreval("\nCompra registrada com sucesso!")
fimfuncao

// Função para gerar relatório
funcao gerarRelatorio()
var
    i, indiceCarro, maisCaro: inteiro
    precoMedio, maiorPreco: real
inicio
    se totalItensComprados = 0 entao
        escreval("Nenhuma compra registrada!")
        retorne
    fimse

    escreval("\n=== RELATÓRIO FINAL ===")
    escreval("Cliente: ", nomeCliente)
    escreval("CPF: ", cpfCliente)
    escreval("E-mail: ", emailCliente)
    escreval("----------------------")

    escreval("\nItens comprados:")
    para i de 1 ate totalItensComprados faca
        indiceCarro <- carrosComprados[i]
        escreva(modelos[indiceCarro], " (", anos[indiceCarro], ")")
        escreva(" - Quantidade: ", quantidadesCompradas[i])
        escreval(" - R$ ", precos[indiceCarro] * quantidadesCompradas[i]:0:2)
    fimpara

    escreval("\nResumo financeiro:")
    escreval("Valor Total Bruto: R$ ", valorTotalBruto:0:2)
    escreval("Descontos Aplicados: R$ ", valorDescontos:0:2)
    escreval("Imposto de Luxo (8%): R$ ", valorImpostos:0:2)
    escreval("VALOR FINAL A PAGAR: R$ ", valorFinal:0:2)

    // Encontra o carro mais caro
    maisCaro <- 1
    maiorPreco <- precos[carrosComprados[1]]
    para i de 2 ate totalItensComprados faca
        se precos[carrosComprados[i]] > maiorPreco entao
            maiorPreco <- precos[carrosComprados[i]]
            maisCaro <- i
        fimse
    fimpara
    escreval("\nCarro mais caro comprado: ", modelos[carrosComprados[maisCaro]], " - R$ ", maiorPreco:0:2)

    // Calcula média de preços
    precoMedio <- valorTotalBruto / totalItensComprados
    escreval("Média de preços: R$ ", precoMedio:0:2)
fimfuncao

// Menu principal
funcao exibirMenu(): inteiro
var
    opcao: inteiro
inicio
    escreval("\n=== SISTEMA DE VENDAS DE CARROS ===")
    escreval("1. Cadastrar Carro")
    escreval("2. Cadastrar Cliente")
    escreval("3. Registrar Compra")
    escreval("4. Gerar Relatório")
    escreval("0. Sair")
    escreva("Opção: ")
    leia(opcao)
    retorne opcao
fimfuncao

// Programa principal
inicio
    totalCarros <- 0
    totalItensComprados <- 0

    repita
        opcao <- exibirMenu()

        escolha opcao
            caso 1
                cadastrarCarro()
            caso 2
                cadastrarCliente()
            caso 3
                se totalCarros = 0 entao
                    escreval("Cadastre carros primeiro!")
                senao se compr(nomeCliente) = 0 entao
                    escreval("Cadastre um cliente primeiro!")
                senao
                    registrarCompra()
                fimse
            caso 4
                gerarRelatorio()
            caso 0
                escreval("Saindo do sistema...")
            outrocaso
                escreval("Opção inválida!")
        fimescolha
    ate opcao = 0
fimalgoritmo