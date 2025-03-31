# API
Interface web em Vue.js e servidor em Python para buscas em dados de operadoras 🚀.

# Teste de API

Este repositório contém o código para o **Teste de API**, parte do teste de nivelamento técnico. O projeto consiste em uma interface web desenvolvida com Vue.js que interage com um servidor Python (Flask) para realizar buscas textuais no arquivo CSV de cadastros de operadoras.

---

## Objetivos do Projeto

1. Criar um servidor Flask que realiza buscas textuais no arquivo `operadoras.csv` e retorna os resultados mais relevantes.
2. Desenvolver uma interface em Vue.js para exibir e interagir com os dados.
3. Demonstrar os resultados do servidor através de uma coleção no Postman.

---

## Estrutura do Projeto

- **backend/**: Código do servidor Python e o arquivo de dados (`operadoras.csv`).
- **frontend/**: Interface do usuário construída em Vue.js.
- **postman/**: Coleção para testar o servidor no Postman.
- **README.md**: Documentação do projeto.

---

## Pré-requisitos

Antes de rodar o projeto, certifique-se de ter as seguintes ferramentas instaladas:
- **Python 3.7 ou superior**
- **Node.js** (para o frontend)
- **Postman** (para testar a API)

---

## Como Executar

### 1. Rodar o Backend (Flask)

1.  Acesse a pasta `backend/`:

    ```bash
    cd backend
    ```
    
2.  Instale as dependências do Python:

    ```bash
    pip install -r requirements.txt
    ```

3.  Execute o servidor Flask:

    ```bash
    python app.py
    ```

    Normalmente o servidor estará rodando em `http://127.0.0.1:5000/`.

### 2. Rodar o Frontend (Vue.js)

1.  Acesse a pasta `frontend/`:

    ```bash
    cd frontend
    ```

2.  Instale as dependências do Node.js:

    ```bash
    npm install
    ```

3.  Execute o servidor de desenvolvimento do Vue.js:

    ```bash
    npm run serve
    ```

    O frontend estará rodando em `http://localhost:8080/`.

### 3. Usando o Postman (opcional)

1.  Importe a coleção do Postman (se fornecida) para testar os endpoints da API.
2.  Envie uma requisição GET para `http://127.0.0.1:5000/buscar?termo=${this.termo}` para buscar operadoras.
3.  (${this.termo} = seu_termo_de_busca)
4.  Verifique a resposta da API em formato JSON.

---

## Observações

-   Certifique-se de que o arquivo `relatorio_cadop.csv` esteja na mesma pasta que o arquivo `app.py` no diretório `backend/`.
-   O frontend fará requisições para o backend no endereço `http://127.0.0.1:5000/buscar`. Certifique-se de que o backend esteja rodando antes de usar o frontend.
-   O arquivo csv precisa está dentro da pasta backend.
-   O arquivo csv precisa estar com o delimitador ";"
-   Para o front-end funcionar será necessario que o back-end esteja rodando.
-   O front-end usa o arquivo BuscaOperadora.vue para renderizar os dados e ali é onde fica a parte de requisições.


---
