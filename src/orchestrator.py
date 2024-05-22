import os
import json
from llm_interface import *
from util import *
from db_controller import *


class Orchestrator:
    def __init__(self, db_config_file, ddl_file, sql_function) -> None:
        self.db_config_file = db_config_file
        self.ddl_file = ddl_file     
        self.sql_function = sql_function
        #get api key    
        key_file_path = "resources/gemini_api_key.json"        
        data = get_json_file(key_file_path)
        self.api_key =  data["key"]
        self.prompts = ""
        self.sql_query = ""
        self.llm = ""
        self.database = ""
        self.llm_model = ""

    def get_prompt_from_gemini(self, prompt):
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

    def exectue_sql_function(self, sql_function, query):
        return sql_function(query)
    
    def execute_sql(self,db_config_file, sql_query):
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
    
    
    def ask_question(self, question):
        #get first part of prompt
        self.prompts = "" #clear previous prompts
        path = "resources/prompts.json" #path to prompts file
        resp = get_json_file(path)
        prompt_part =  (resp['prompt_1']) #get first part of prompt

        #get prompt restrictions    
        path = "resources/restrictions.json" #path to prompt restrictions
        resp = get_json_file(path)
        restrictions = resp['restrictions_postgres']

        #get the DDL file        
        db_structure = get_ddl_content(self.ddl_file) #this file is defined whent he object is instanciated.

        #setup first prompt
        prompt = f"""{prompt_part}. 
                    Here's the DLL info: \n{db_structure}. 
                    Here's the question: {question}.
                    Here are the restrictions: \n{restrictions}"""        
        
        self.prompts =  prompt 
        
        #get results from first prompt              
        prompt_result = self.get_prompt_from_gemini(prompt)        

        #parse result to extract only the sql part
        sql_query = format_sql(prompt_result)   
        self.sql_query = sql_query 
        #print("Orchestrator.ask_question()[line89]: Here's is the SQL query: " + sql_query)
        # execute sql code          
        # db_json_result = self.execute_sql(self.db_config_file, sql_query)
        # function_name = run_sql_postgres
        db_json_result = self.exectue_sql_function(self.sql_function, sql_query)

        #prompt 2
        path = "resources/prompts.json"
        resp = get_json_file(path)
        prompt_part =  (resp['prompt_2'])
        prompt = f"""{prompt_part}.
                Here's the json text: {db_json_result}
                Here's the question: {question}    
        """
        self.prompts = self.prompts + "\n\n" + prompt #storing all prompts

        #print("Here's the prompt: " + prompt)        
        return self.get_prompt_from_gemini(prompt)
    def get_metadata(self):
        data = {
            "LLM": "Google Gemini",
            "Database": "Postgres",
            "LLM model": "gemini-1.0-pro"
        }
        return data
    def get_prompt(self):
        pass
    def get_sql_query(self):
        pass

    



