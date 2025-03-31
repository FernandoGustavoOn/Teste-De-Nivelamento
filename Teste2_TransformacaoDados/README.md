# WebScraping

Este repositório contém o código e os arquivos gerados durante a execução do **Teste de Web Scraping**, solicitado no teste de nivelamento técnico. O objetivo deste projeto é realizar o download dos anexos I e II do site da ANS e compactar os arquivos em um único arquivo `.zip`.

---

## Descrição do Projeto

O projeto executa as seguintes etapas:
1. Acessa o site oficial da ANS.
   - [Link para o site](https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos)
2. Baixa os PDFs dos anexos I e II.
3. Compacta os dois arquivos PDF em um único arquivo `.zip`.

---

## Estrutura dos Arquivos

- **`scraping.py`:** Código Python que realiza todas as etapas descritas acima.
- **`anexos/`:** Pasta onde os PDFs baixados são armazenados.
  - `Anexo_I.pdf`: Primeiro anexo baixado do site.
  - `Anexo_II.pdf`: Segundo anexo baixado do site.
- **`compactado.zip`:** Arquivo `.zip` contendo os dois PDFs compactados.
- **`README.md`:** Documentação do projeto.

---

## Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:
- **Python 3.7 ou superior**
- Bibliotecas necessárias:
  - `requests` para realizar o download dos arquivos.
  - `beautifulsoup4` para analisar o HTML.
  - `wget` para baixar os arquivos.
  - `shutil` (já incluída no Python) para compactação.

Para instalar as dependências, execute:
```bash
pip install -r requirements.txt
```

Caso o arquivo `requirements.txt` não esteja presente, instale manualmente com:
```bash
pip install requests beautifulsoup4 wget
```

---

## Como Executar

1. Clone este repositório:
```bash
git clone https://github.com/FernandoGustavoOn/Teste-De-Nivelamento.git
```

2. Acesse a pasta do projeto:
```bash
cd Teste-De-Nivelamento/Teste2_TransformacaoDados
```

3. Execute o script:
```bash
python scraping.py
```

Após a execução, os PDFs baixados estarão na pasta `pdfs/`, e o arquivo compactado será gerado como `PDFs_compactados.zip`.

Se desejar executar em um ambiente virtual:
```bash
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate  # Windows
pip install -r requirements.txt
python scraping.py
```

---

## Observações

- Certifique-se de estar conectado à internet para que o script possa acessar o site da ANS.
- Caso os arquivos não sejam baixados corretamente, verifique se o site da ANS está acessível e se os links dos anexos não foram alterados.
- O script pode ser adaptado para baixar outros documentos, bastando modificar os critérios de filtragem dos links.

---

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

