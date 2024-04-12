import json
import os


def get_json_file(path):
    if not os.path.exists(path):
        raise FileNotFoundError(f"JSON file not found at: {path}")
        
    with open(path, "r") as f:
        return json.load(f)
    

import psycopg2

def pg_connection_test(conn_info):
    """
    Tests a PostgreSQL connection using provided connection information.

    Args:
        conn_info (dict): A dictionary containing the following keys:
            * host (str): The database server hostname or IP address.
            * port (int): The database server port.
            * database (str): The database name.
            * user (str): The database username.
            * password (str): The database password.

    Returns:
        bool: True if the connection was successful, False otherwise.
    """

    try:
        with psycopg2.connect(**conn_info) as conn:
            cursor = conn.cursor()  # Test by obtaining a cursor
            cursor.execute("SELECT 1")  # Execute a simple query
            return True  # Connection successful
    except psycopg2.Error as e:
        print(f"Connection error: {e}")
        return False



def test_pg_connection_test():
    connection_info = {
    'host': 'localhost',
    'port': 5432,
    'database': 'cl_studies',
    'user': 'postgres',
    'password': 'Getinthere1980'
}

    if pg_connection_test(connection_info):
        print("Database connection successful!")
    else:
        print("Database connection failed.")

if __name__ == '__main__':
    test_pg_connection_test()
    
        
