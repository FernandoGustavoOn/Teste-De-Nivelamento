-- analytical_queries.sql

-- Descrição: Esta query identifica as 10 operadoras de saúde com maiores despesas relacionadas a
-- "SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" 
-- durante o último trimestre de 2024 (1º de outubro a 31 de dezembro).
-- Seleciona os campos desejados:
-- o.Registro_ANS: Código do registro ANS da operadora.
-- o.Razao_Social: Nome oficial da operadora (razão social).
-- SUM(d.VL_Saldo_Final - d.VL_Saldo_Inicial): Total de despesas calculado como a soma 
-- da diferença entre o saldo final e o saldo inicial, agrupado por operadora.
SELECT 
    o.Registro_ANS, 
    o.Razao_Social, 
    SUM(d.VL_Saldo_Final - d.VL_Saldo_Inicial) AS Total_Despesas
FROM 
    operadoras o
-- Faz um JOIN para unir os dados de `operadoras` e `demonstracoes_contabeis` com base no campo `Registro_ANS`.
JOIN 
    demonstracoes_contabeis d
ON 
    o.Registro_ANS = d.Reg_ANS
WHERE 
    -- Filtra apenas os registros que mencionam "SINISTROS" e "ASSISTÊNCIA" na descrição.
    d.Descricao LIKE '%SINISTROS%'
    AND d.Descricao LIKE '%ASSISTÊNCIA%'
    -- Filtra os dados dentro do período do último trimestre de 2024.
    AND d.Data BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY 
    -- Agrupa os resultados por operadora, usando o Registro_ANS e Razao_Social como identificadores únicos.
    o.Registro_ANS, o.Razao_Social
ORDER BY 
    -- Ordena os resultados em ordem decrescente pelo total de despesas calculado.
    Total_Despesas DESC
LIMIT 10;
-- Retorna apenas os 10 primeiros resultados (as operadoras com maiores despesas).



-- Descrição: Esta query identifica as 10 operadoras de saúde com maiores despesas relacionadas a
-- "SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA À SAÚDE MÉDICO-HOSPITALAR" 
-- durante o ano inteiro de 2024.
-- Seleciona os campos desejados:
-- o.Registro_ANS: Código do registro ANS da operadora.
-- o.Razao_Social: Nome oficial da operadora (razão social).
-- SUM(d.VL_Saldo_Final - d.VL_Saldo_Inicial): Total de despesas, calculado como a soma da diferença
-- entre o saldo final e o saldo inicial ao longo do ano.
SELECT 
    o.Registro_ANS, 
    o.Razao_Social, 
    SUM(d.VL_Saldo_Final - d.VL_Saldo_Inicial) AS Total_Despesas_Anual
FROM 
    operadoras o
-- Faz um JOIN para unir os dados de `operadoras` e `demonstracoes_contabeis` com base no campo `Registro_ANS`.
JOIN 
    demonstracoes_contabeis d
ON 
    o.Registro_ANS = d.Reg_ANS
WHERE 
    -- Filtra apenas os registros cuja descrição menciona "SINISTROS" e "ASSISTÊNCIA".
    d.Descricao LIKE '%SINISTROS%'
    AND d.Descricao LIKE '%ASSISTÊNCIA%'
    -- Filtra apenas os registros referentes ao ano de 2024.
    AND YEAR(d.Data) = 2024
GROUP BY 
    -- Agrupa os resultados por operadora, identificada pelo Registro_ANS e Razao_Social.
    o.Registro_ANS, o.Razao_Social
ORDER BY 
    -- Ordena os resultados em ordem decrescente pelo total de despesas calculado.
    Total_Despesas_Anual DESC
LIMIT 10;
-- Retorna apenas os 10 primeiros resultados (as operadoras com maiores despesas anuais).