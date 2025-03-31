-- ..\BancoDeDados\dados
LOAD DATA INFILE 'C:/../BancoDeDados/dados/2024/1T2023.csv' -- so ir mudando "1T2023.csv" pra "2T2024.csv"... até chegar no 2024/4T2024.csv
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Data, Reg_ANS, CD_Conta_Contabil, Descricao, VL_Saldo_Inicial, VL_Saldo_Final);

-- SE DE ERRO NA DATA QUANDO FOR EXECUTAR O IMPORT EXECUTE ESSE SCRIPT ELE CORRIGE A DATA
LOAD DATA INFILE 'C:/../BancoDeDados/dados/2024/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Data, Reg_ANS, CD_Conta_Contabil, Descricao, VL_Saldo_Inicial, VL_Saldo_Final)
SET Data = STR_TO_DATE(@Data, '%d/%m/%Y');

-- importar arquivo relatorio_cadop.csv para o MySql
LOAD DATA INFILE 'C:/../BancoDeDados/dados/relatorio_cadop.csv'
INTO TABLE operadoras
CHARACTER SET utf8mb4 -- encoding correto
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Esta consulta realiza uma junção entre as tabelas 'operadoras' (aliás 'o') e 'demonstracoes_contabeis' (aliás 'd').
-- A junção é feita com base no relacionamento entre o campo 'Registro_ANS' na tabela 'operadoras' 
-- e o campo 'Reg_ANS' na tabela 'demonstracoes_contabeis'.
-- Ela retorna os seguintes dados: Registro_ANS e Razao_Social de 'operadoras', 
-- além de Descricao, Data, VL_Saldo_Final e VL_Saldo_Inicial de 'demonstracoes_contabeis'.
SELECT o.Registro_ANS, o.Razao_Social, d.Descricao, d.Data, d.VL_Saldo_Final, d.VL_Saldo_Inicial
FROM operadoras o
JOIN demonstracoes_contabeis d
ON o.Registro_ANS = d.Reg_ANS;