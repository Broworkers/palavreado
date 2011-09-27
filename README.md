# Palavreado.com

O **Palavreado.com** busca expandir o vocabulário de falantes de Português do Brasil, com explicações objetivas e exemplos simples de palavras de uso não muito freqüente.

Cada palavra é apresentada com sua divisão silábica e um destaque para a sílaba tônica.

O site não tem a intenção de substituir o dicionário.


## Expandindo o Palavreado.com

Você pode ajudar o **Palavreado.com** de diversas maneiras:

- expandindo o número de palavras
- corrigindo um erro em uma palavra
- corrigindo ou melhorando a programação

É necessário conhecimento básico de Git e Ruby para propor melhorias na programação. Para propor melhorias nas palavras, você pode entrar em contato direto com os desenvolvedores através dos e-mails daniellibanori@gmail.com ou rafaelmasoni@gmail.com.


## Testando o Palavreado.com

Você pode testar a integridade básica do Palavreado.com utilizando _bacon_. A suite de teste é bastante reduzida, então recomendamos você ampliar a suite ou testar manualmente suas alterações.

  $ bacon spec/palavreado\_spec.rb


## Testando o dicionário

O arquivo check.rb é uma pequena aplicação ruby que verifica se o arquivo dicinário está bem formado, dando OK se não houver erros ou ERRO e informando a palavra caso haja problemas no arquivo. Você pode executar a aplicação deste modo:

  $ ruby check.rb words.yml

O status code será 0 caso não haja erro, ou 1 em caso de falha.

## Cógido fonte

O código fonte do **Palavreado.com** está disponível gratuitamente em https://github.com/dlibanori/palavreado através de licença MIT.

- Gemfile: dependências da aplicação
- Gemfile.lock: dependências da aplicação e suas respectivas versões
- README.md: este arquivo
- TODO.md: lista de coisas a serem feitas
- check.rb: arquivo que checa validade do dicionário
- config.ru: configuração do Rack
- license.txt: licença de uso
- palavreado.rb: ações do Sinatra
- public/:
  - images/: imagens estáticas
  - stylesheets/:
    - reset.css: remove o CSS padrão do browser
    - application.css: CSS da aplicação
- spec/:
  - bad.yml: dicionário para testes mal formado
  - palavreado\_spec.rb: especificação do Palavreado.com
  - words.yml: dicionário para testes bem formado
- views/:
  - layout.slim: arquivo de layout
  - word.slim: definição de uma palavra
  - about.slim: sobre o site
- words.yml: base de dados de palavras


## Licença

**Palavreado.com** é distribuído através de licença MIT.
