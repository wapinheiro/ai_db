import os
import json
from llm_interface import *
from util import *
from db_controller import *


class Orchestrator():
    def __init__(self) -> None:
        pass
    def get_prompt_from_gemini(prompt):
        # Model setup
        gem_model_name = "gemini-1.0-pro"
        key_file_path = "resources/gemini_api_key.json"
        if not os.path.exists(key_file_path):
            raise FileNotFoundError(f"JSON file not found at: {key_file_path}")
            
        with open(key_file_path, "r") as f:
            data = json.load(f)
        api_key =  data["key"]
        gem_interface = GeminiInterface(key=api_key, model_name=gem_model_name)
        
        return gem_interface.get_prompt(prompt)
    
    def execute_sql(db_config_file, sql_query):
        data = get_json_file(db_config_file)
        database_name = data['database_name']
        user = data['user']
        password = data['password']
        host = data['host']
        port = data['port']
        
        connection = connect_to_database(database_name, user, password, host, port)
        if connection:
            json_result = execute_query_and_get_json(connection, sql_query)
            #if json_result: print("Here's the json result from the DB: " + json_result)
            connection.close()
        
        if json_result == None: 
            print("There was an error. Please try again")
            quit()
        return json_result
    



