import psycopg2
import json

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
