CREATE DATABASE dados;
USE dados;
CREATE TABLE operadoras (
    Registro_ANS VARCHAR(255),
    CNPJ VARCHAR(14) NOT NULL,
    Razao_Social VARCHAR(255) NOT NULL,
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(100),
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(255),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(8),
    DDD CHAR(2),
    Telefone VARCHAR(15),
    Fax VARCHAR(15),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(255),
    Regiao_de_Comercializacao INT,
    Data_Registro_ANS DATE
);

-- Tabela dos arquivos contabeis
CREATE TABLE demonstracoes_contabeis (
    Data DATE NOT NULL, -- Data da operação no formato AAAA-MM-DD
    Reg_ANS INT NOT NULL, -- Código do registro ANS da operadora
    CD_Conta_Contabil VARCHAR(20) NOT NULL, -- Código da conta contábil
    Descricao VARCHAR(255) NOT NULL, -- Descrição da conta contábil
    VL_Saldo_Inicial VARCHAR(255),
    VL_Saldo_Final VARCHAR(255)
);