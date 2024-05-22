from util import *
from orchestrator import *


def test_main():
    data = get_json_file("db/db_settings.json")    
    
    #postgress DB
    db_config_file = data['postgres_cl_studies_config']    
    ddl_file = data['cl_studies_ddl']    
    sql_function = run_sql_postgres

    orc = Orchestrator(db_config_file,ddl_file,sql_function)    
    question = "List of clinic locations"
    answer = orc.ask_question(question)
    print (answer)

if __name__ == '__main__':    
    test_main()