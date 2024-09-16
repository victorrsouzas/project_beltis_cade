# CAEd - Flutter Project

Este projeto Flutter foi desenvolvido para o CAEd, incorporando várias funcionalidades como autenticação, exibição de pacotes e detalhes de pacotes, integrados com APIs externas utilizando mock services para simulação.

## Funcionalidades

- **Autenticação**: Tela de login com validação e mensagens de erro em caso de falha no login.
- **Listagem de Pacotes**: Interface tabulada para exibir pacotes com barras de progresso para visualização do status de recebimento e devolução de pacotes.
- **Detalhes do Pacote**: Detalhamento do status do pacote exibido com uma linha do tempo de eventos, incluindo ícones e cores, dentro de um card.
- **Navegação com Tabs**: Alternância entre "Status" e "Dados" do pacote usando `TabBar` e `TabBarView`.
- **Mock API Integration**: Integração com a [API Mocky](https://run.mocky.io/v3/93c13f2a-1ecd-41fb-8dd8-462c69797f2c) para simulação de dados de pacotes e eventos.
- **Bottom Navigation Bar**: Navegação inferior com três abas ("Início", "Opções", "Tutoriais").

## Estrutura de Pastas

```
lib/
│
├── models/
│   └── details_package.dart       # Modelos de dados para os eventos do pacote
│   └── package.dart               # Modelo de dados para listagem
│
├── providers/
│   ├── list_state_notifier.dart   # Provider para o estado da listagem de pacotes
│   └── detail_state_notifier.dart # Provider para o estado dos detalhes do pacote
│   └── login_state_notifier.dart  # Provider para o estado do login
│
├── screens/
│   ├── login_page.dart            # Tela de login
│   ├── list_page.dart             # Tela de listagem de pacotes
│   └── detail_page.dart           # Tela de detalhes do pacote
│
├── utils/
│   ├── servico_navegacao.dart            # Chave global de navegação
|
├── widgets/
│   ├── status_card.dart               # Widget para exibir status de pacotes com barras de progresso
│   └── package_list.dart              # Widget para exibir lista de pacotes
│   └── details_status.dart            # Widget para exibir detalhes do pacote
│   └── details_status_timeline.dart   # Widget para exibir timeline do pacote
└── main.dart                      # Arquivo principal de inicialização
```

## Configurações de Ambiente

Certifique-se de ter o Flutter instalado e configurado corretamente. Para verificar sua instalação do Flutter, execute:

```bash
flutter doctor
```

### Dependências

Este projeto utiliza algumas dependências importantes, como:

- `flutter_riverpod`: Para gerenciar o estado dos pacotes e da autenticação.
- `http`: Para realizar chamadas HTTP e se conectar às APIs externas.
- `mocky`: API simulada para fornecimento de dados mock.

Instale todas as dependências executando:

```bash
flutter pub get
```

## Executando o Projeto

Para executar o projeto, use o seguinte comando:

```bash
flutter run
```

Você pode utilizar emuladores ou dispositivos físicos para testar o aplicativo.

## Usuário e Senha

Para executar o projeto, use o seguinte comando:

```bash
usuario: teste@teste.com
senha: 123456
```

## Integração com API

O projeto utiliza a [Mocky API](https://run.mocky.io/) para simular dados de pacotes e seus eventos de status. A integração com a API foi feita no arquivo `detail_state_notifier.dart`, onde os dados da API são buscados e exibidos na tela de detalhes do pacote.

Exemplo de chamada API:

```dart
final response = await http.get(
  Uri.parse('https://run.mocky.io/v3/93c13f2a-1ecd-41fb-8dd8-462c69797f2c'),
);
```

## Exemplo de Telas

### Tela de Login
- Usuário insere suas credenciais (email e senha).
- Validação em tempo real e tratamento de erros.

### Tela de Listagem de Pacotes
- Exibe pacotes com status de "Recebido" e "Devolução" usando barras de progresso.
- Permite navegação para a página de detalhes de cada pacote.

### Tela de Detalhes do Pacote
- Exibe uma linha do tempo de eventos sobre o pacote, com ícones e cores diferenciando os eventos de recebimento e devolução.
- A navegação entre "Status" e "Dados" é feita através de abas.

### Versão APK para baixar
[APK](https://drive.google.com/file/d/1j_MLxNIPIB4-KILmL2mwXByWBiQ-qYe2/view?usp=sharing)

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contribuindo

Contribuições são bem-vindas! Se você encontrar problemas ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request.