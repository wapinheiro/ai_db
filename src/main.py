from flask import Flask, request, jsonify
from flask_cors import CORS
from orchestrator import *
from util import *
from db_controller import *


data = get_json_file("db/db_settings.json")


#postgress DB
db_config_file = data['postgres_cl_studies_config']
ddl_file = data['cl_studies_ddl']
sql_function = run_sql_postgres
metadata = "Postgre Database"#get_json_file("resources/metadata.json")["postgres_fin"] 

#SQLite DB
#db_config_file = ""
#ddl_file = data['sqlite_cl_studies_ddl']
#sql_function = run_sql_sqlite
#metadata = get_json_file("resources/metadata.json")["sqlite_cl_studies"]

orc = Orchestrator(db_config_file, ddl_file, sql_function)

app = Flask(__name__) #this is the web server
CORS(app)

@app.route('/ask_question', methods=['POST'])
def ask_question():
    data = request.get_json()
    question = data['question']    
    answer = orc.ask_question(question)
    prompt = orc.prompts
    sql_query = orc.sql_query
    metadata = orc.get_metadata()

    return jsonify({'answer': answer, 'prompt': prompt, 'sql_query': sql_query, 'metadata': metadata})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

