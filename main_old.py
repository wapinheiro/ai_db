from orchestrator import *

db_config_file = "db/postgres_db_config.json"
ddl_file = "db/postgres_db_structure.ddl"
orc = Orchestrator(db_config_file, ddl_file)
answer = orc.ask_question(input("Enter your question: "))
print("Answer: " + answer)

""" resp = input("Do you want to see the prompts?")
if resp == 'Yes':
    print(orc.prompts)
 """