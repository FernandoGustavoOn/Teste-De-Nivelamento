from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd

app = Flask(__name__)
CORS(app)  # Permite acesso do front-end

# Carregar o CSV (certifique-se de que o arquivo está na mesma pasta do app.py)
df = pd.read_csv("relatorio_cadop.csv", delimiter=";")
print(df.head())

@app.route('/buscar', methods=['GET'])
def buscar_operadoras():
    print("Rota /buscar acessada!")  # Log para verificar
    termo = request.args.get('termo', '').lower()
    
    # Filtrar por Razão Social ou Nome Fantasia
    resultados = df[df.apply(lambda x: termo in str(x['Razao_Social']).lower() or termo in str(x['Nome_Fantasia']).lower(), axis=1)]
    
    # Garantir que valores não válidos sejam substituídos
    resultados = resultados.fillna("Indisponível")  # Substituir NaN por "Indisponível"
    if resultados.empty:
        return jsonify({"mensagem": "Nenhum resultado encontrado para o termo pesquisado."})
    else:
        return jsonify(resultados.to_dict(orient="records"))


if __name__ == '__main__':
    app.run(debug=True)
