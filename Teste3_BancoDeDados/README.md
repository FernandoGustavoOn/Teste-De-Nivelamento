# Banco de Dados

Este repositório contém os scripts SQL e os arquivos necessários para o **Teste de Banco de Dados**. O objetivo é criar, estruturar e importar dados em tabelas compatíveis com MySQL 8.0, bem como realizar consultas analíticas.

---

## Objetivos do Projeto

O projeto realiza as seguintes etapas:
1. **Criação de tabelas no banco de dados:**
   - `operadoras`: Contém dados cadastrais das operadoras.
   - `demonstracoes_contabeis`: Armazena as demonstrações contábeis dos últimos dois anos.
2. **Importação de dados:**
   - Importa dados dos arquivos `relatorio_cadop.csv` e dos arquivos trimestrais contábeis (`1T2024.csv` até `4T2024.csv`).
3. **Consultas analíticas:**
   - Calcula as 10 operadoras com maiores despesas em "SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" no último trimestre.
   - Calcula as 10 operadoras com maiores despesas na mesma categoria no último ano.

---

## Estrutura dos Arquivos

### **scripts/**
- **`create_tables.sql`:** Script para criar as tabelas `operadoras` e `demonstracoes_contabeis`.
- **`import_data.sql`:** Script para importar os dados dos arquivos CSV para as tabelas criadas.
- **`analytical_queries.sql`:** Contém as queries analíticas para responder às questões do teste.

### **dados/**
- **`relatorio_cadop.csv`:** Dados cadastrais das operadoras.
- **`demonstracoes_contabeis/`:** Arquivos trimestrais de demonstrações contábeis (1T2024 até 4T2024).

---

## Como Executar

Para executar o projeto, siga a sequência abaixo:

1. **Criação do Banco de Dados e Tabelas**  
   Execute o script `create_tables.sql` para criar as tabelas `operadoras` e `demonstracoes_contabeis`.

2. **Importação de Dados**  
   Execute o script `import_data.sql` para importar os dados dos arquivos CSV (`relatorio_cadop.csv` e arquivos trimestrais de 2023 e 2024) para o banco de dados.

3. **Correção da Data (se necessário)**  
   Se ocorrer erro ao importar os dados devido ao formato da data, execute o script para corrigir a formatação da data.

4. **Execução das Consultas Analíticas**  
   Execute o script `analytical_queries.sql` para calcular as 10 operadoras com maiores despesas nos períodos especificados (último trimestre e último ano de 2024).

5. **Consultas Personalizadas**  
   Após a importação, você pode realizar consultas adicionais diretamente no banco de dados para combinar dados das tabelas `operadoras` e `demonstracoes_contabeis`.

Siga essa sequência para configurar e executar o projeto corretamente.


## Pré-requisitos

Antes de executar o projeto, certifique-se de:
1. Instalar o MySQL versão 8.0 ou superior.
2. Configurar o banco de dados com permissões para carregar arquivos usando `LOAD DATA INFILE`.

### Configuração do MySQL:
1. **Ativar a opção de carregar arquivos locais:**
   ```sql
   SET GLOBAL local_infile = 1;
