Algoritmo "Controle_de_Estoque"
Var
    // Vetores para armazenar os dados dos produtos (capacidade maxima de 50)
    nome_produto : vetor[1..50] de caracter
    preco_produto : vetor[1..50] de real
    quantidade_estoque : vetor[1..50] de inteiro

    // Variaveis de controle
    opcao : inteiro
    total_produtos : inteiro
    i, codigo_venda, quantidade_venda : inteiro

Inicio
    // Inicializa o contador de produtos cadastrados
    total_produtos <- 0

    repita
        // Exibe o menu principal
        escreval("--- SISTEMA DE ESTOQUE ---")
        escreval("1. Cadastrar novo produto")
        escreval("2. Listar produtos em estoque")
        escreval("3. Realizar venda")
        escreval("4. Sair")
        escreval("--------------------------")
        escreva("Digite sua opcao: ")
        leia(opcao)

        escreval("")

        escolha opcao
        caso 1
            se total_produtos < 50 entao
                total_produtos <- total_produtos + 1
                escreval("--- Cadastro de Produto ---")
                escreva("Nome do produto: ")
                leia(nome_produto[total_produtos])
                escreva("Preco unitario: R$")
                leia(preco_produto[total_produtos])
                escreva("Quantidade inicial: ")
                leia(quantidade_estoque[total_produtos])
                escreval("Produto cadastrado com sucesso!")
            senao
                escreval("Estoque cheio! Nao e possivel cadastrar mais produtos.")
            fimse

        caso 2
            se total_produtos > 0 entao
                escreval("--- Produtos em Estoque ---")
                escreval("---------------------------------------------------------")
                escreval("Cod | Nome                | Preco (R$) | Quantidade")
                escreval("---------------------------------------------------------")
                para i de 1 ate total_produtos faca
                    escreval(i, "   | ", nome_produto[i], " | ", preco_produto[i]:2:2, " | ", quantidade_estoque[i])
                fimpara
                escreval("---------------------------------------------------------")
            senao
                escreval("Nao ha produtos cadastrados no estoque.")
            fimse

        caso 3
            se total_produtos > 0 entao
                escreval("--- Realizar Venda ---")
                escreva("Digite o codigo do produto a ser vendido: ")
                leia(codigo_venda)


                se (codigo_venda >= 1) e (codigo_venda <= total_produtos) entao
                    escreval("Produto selecionado: ", nome_produto[codigo_venda])
                    escreva("Digite a quantidade a ser vendida: ")
                    leia(quantidade_venda)


                    se quantidade_venda <= quantidade_estoque[codigo_venda] entao
                        quantidade_estoque[codigo_venda] <- quantidade_estoque[codigo_venda] - quantidade_venda
                        escreval("Venda realizada com sucesso!")
                        escreval("Novo estoque de ", nome_produto[codigo_venda], ": ", quantidade_estoque[codigo_venda])
                    senao
                        escreval("ERRO: Quantidade em estoque insuficiente.")
                        escreval("Estoque atual: ", quantidade_estoque[codigo_venda])
                    fimse
                senao
                    escreval("Codigo de produto invalido.")
                fimse
            senao
                escreval("Nao ha produtos para vender.")
            fimse

        caso 4
            escreval("Encerrando o sistema. Ate mais!")

        outrocaso
            escreval("Opcao invalida. Por favor, tente novamente.")

        fimescolha

        escreval("")
        // Pausa o programa para o usuario ver o resultado antes de voltar ao menu
        se opcao <> 4 entao
            escreva("Pressione ENTER para continuar...")
            leia(i) // 'i' eh uma variavel auxiliar para a pausa
        fimse

    ate opcao = 4
Fimalgoritmo