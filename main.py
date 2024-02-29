from llm_interface import *
from db_controller import *
import re

if __name__ == "__main__":

    # Model setup
    key_file_path = "resources/gemini_api_key.json"
    if not os.path.exists(key_file_path):
        raise FileNotFoundError(f"JSON file not found at: {key_file_path}")
        
    with open(key_file_path, "r") as f:
        data = json.load(f)

    api_key =  data["key"]
    gem_model_name = "gemini-1.0-pro"

    question = input("Ask your question: ")


    prompt = f"""given the following database structure in DDL format:
                CREATE TABLE fin.tbl_stores (
                    store_id INT PRIMARY KEY,
                    store_name VARCHAR(100) NOT NULL,
                    store_address VARCHAR(255)                    
                );

                CREATE TABLE fin.tbl_products (
                    product_id INT PRIMARY KEY,
                    product_name VARCHAR(100) NOT NULL,
                    unit_price FLOAT NOT NULL
                );

                CREATE TABLE fin.tbl_transactions (
                    trans_id INT PRIMARY KEY,
                    trans_date DATE NOT NULL,
                    store_id INT REFERENCES fin.tbl_stores(store_id),
                    product_id INT REFERENCES fin.tbl_products(product_id),
                    trans_qtd INT 
                );
                
                write an sql code in postgres to answer the following question:                
                '{question}'
                notes:
                1) give me just the sql code and no other text.
                2) always define columns indicating its respective table or alias.
                3) don't assume anything, if you need to use a table that's not in the list, its because it doesn't exit. In this case, just provide a null response.
                4) make sure to only use functions that really exist.
                5) for date operations, if needed, use Extract function.
                6) be very descriptive when naming columns. For example: 'total sales in 2024' instead of just 'total sales'. These names will be read by other systems and people who might not have the right context.
                7) always use the schema when declaring the tables."""
    
    
    gem_interface = GeminiInterface(key=api_key, model_name=gem_model_name)
    
    #prompt 1    
    prompt_result = gem_interface.get_prompt(prompt)
    #print("Here's the prompt 1 result: " + prompt_result)

    #parse result to extract only the sql part
    sql_pattern = r'`sql\s+(.*)\s+`'  # Modified pattern
    match = re.search(sql_pattern, prompt_result, re.DOTALL)  

    if match:
        sql_code = match.group(1).strip()          
    else:
        sql_code =  prompt_result

    #print("Here's the sql code:  " + sql_code)

    

    # database credentials & connection
    database_name = "ai-db"
    user = "postgres"
    password = "Getinthere1980"
    host = "localhost"
    port = "5432"  # Default PostgreSQL port

    connection = connect_to_database(database_name, user, password, host, port)

    if connection:
        sql_query = sql_code
        json_result = execute_query_and_get_json(connection, sql_query)
        #if json_result: print("Here's the json result from the DB: " + json_result)
        connection.close()
    
    if json_result == None: 
        print("There was an error. Please try again")
        quit()
    
    #prompt 2
    prompt = f"""format the following json string into a natural language format to answer the following question:
                here's the json string: {json_result}
                here's the question: '{question}'"""   
    #print("Here's the prompt: " + prompt)
    
    print("Answer: " + gem_interface.get_prompt(prompt))

    