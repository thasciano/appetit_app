# APPTIT

Uma plataforma de solicitação de pedidos em um café fictício.

## Demonstração

![Apptit Demo](demo/apptit.gif){:height="700px" width="400px"}
![Apptit login](demo/screen1.png){:height="700px" width="400px"}
![Apptit dashboard](demo/screen2.png){:height="700px" width="400px"}
![Apptit novo_pedido](demo/screen3.png){:height="700px" width="400px"}
![Apptit informacoes](demo/screen4.png){:height="700px" width="400px"}
![Apptit clientes](demo/screen5.png){:height="700px" width="400px"}
![Apptit finalizar](demo/screen6.png){:height="700px" width="400px"}
![Apptit voltar](demo/screen7.png){:height="700px" width="400px"}


## Instalação

* [Install Flutter](https://flutter.dev/get-started/)

## Principais técnicas utilizadas

* ***GlobalKey:*** Validação de campo vazio no formulário de *login*.
* **Padrão *Bloc*:** A maioria das interações de dados e alterações de campos na tela de novo pedido são realizadas com esse padrão.

## Páginas

1. **Login:** Entrar no sistema com validação de campos vazios.
2. **Histórico de pedidos:** Mostra o histórico de pedidos realizados com um pequeno resumo agrupado por data e com somatório das vendas.
3. **Novo Pedido:** Página em que será feito a escolha do pedido em três etapas.
   1. Escolher produto.
   2. Escolher cliente.
   3. Confirmar pagamento e data.
4. **Detalhes do pedido:** Escolhe o tipo se o produto tiver e a quantidade do mesmo.
5. **Finalizar o pedido:** Volta para a página de 'Histórico de pedidos' ou faz um novo pedido.
