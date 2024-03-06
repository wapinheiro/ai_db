import psycopg2
import json
import re
import sqlite3
from util import *

def connect_to_database(database_name, user, password, host, port):
    """Establishes a connection to the PostgreSQL database"""
    try:
        conn = psycopg2.connect(
            database=database_name,
            user=user,
            password=password,
            host=host,
            port=port
        )
        return conn
    except (Exception, psycopg2.Error) as error:
        print("Error connecting to PostgreSQL database:", error)
        return None

def execute_query_and_get_json(conn, sql_query):
    """Executes a SQL query and returns results as JSON"""
    try:
        with conn.cursor() as cursor:
            cursor.execute(sql_query)
            columns = [desc[0] for desc in cursor.description]  # Get column names
            data = cursor.fetchall()

            # Create list of dictionaries for JSON conversion
            result = []
            for row in data:
                result.append(dict(zip(columns, row)))

            return json.dumps(result)

    except (Exception, psycopg2.Error) as error:        
        print("Error executing query:", error)                
        return None
    
def get_ddl_content(path):
    with open(path, 'r') as file:
        return file.read()
    
def format_sql(query_text):
    sql_pattern = r'`sql\s+(.*)\s+`'
    match = re.search(sql_pattern, query_text, re.DOTALL)  

    if match:
        sql_code = match.group(1).strip()          
    else:
        sql_code =  query_text

    return sql_code

import json
import sqlite3

def run_sql_sqlite(query):
  """
  Runs an SQL query on a SQLite database and returns the results in JSON format.

  Args:
    query: The SQL query to run.

  Returns:
    A JSON string containing the results of the query, or None if an error occurs.
  """

  database_file = "mydatabase.db" 
  try:
    conn = sqlite3.connect(database_file)

    # Enable JSON functions if your SQLite version supports them
    conn.row_factory = sqlite3.Row  # Access results by column name 

    cursor = conn.cursor()
    cursor.execute(query)

    # Construct JSON
    data = [dict(row) for row in cursor.fetchall()]
    json_string = json.dumps(data)

    return json_string

  except sqlite3.Error as error:
    print("Error executing query:", error)
    return None

  finally:
    if conn:
      conn.close()


def run_sql_postgres(sql_query):
    # db_settings = get_json_file("db/db_settings.json")
    # postgres_config_file = get_json_file(db_settings['postgres_fin_config'])
    postgres_config_file = "db/postgres_db_config.json"
    data = get_json_file(postgres_config_file)
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


# *****  Example Usage *****
if __name__ == "__main__":
    # database credentials
    database_name = "ai-db"
    user = "postgres"
    password = "Getinthere1980"
    host = "localhost"
    port = "5432"  # Default PostgreSQL port

    connection = connect_to_database(database_name, user, password, host, port)

    if connection:
        sql_query = "SELECT * FROM fin.tbl_stores"  # Replace with your SQL query
        sql_query = "select p.product_name, SUM(t.trans_qtd) AS total_sales from fin.tbl_transactions t INNER JOIN fin.tbl_products p ON t.product_id = p.product_id GROUP BY  p.product_name ORDER BY   total_sales desc LIMIT 1;"
        json_result = execute_query_and_get_json(connection, sql_query)
        if json_result:
            print(json_result)
        connection.close() 
