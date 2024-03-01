from db_controller import *
from orchestrator import *

if __name__ == "__main__":

    path_to_ddl = "db/postgres_db_structure.ddl"
    db_structure = get_ddl_content(path_to_ddl)
    db_config_file = "db/postgres_db_config.json"
    question= input("Enter your question: ")
    prompt=f"""
        given the following database structure in DDL format:
        {db_structure}
        write an sql code in postgres to answer the following question:
        {question}
        restrictions:
        1) give me just the sql code and no other text.
        2) always define columns indicating its respective table or alias.
        3) don't assume anything, if you need to use a table that's not in the list, its because it doesn't exit. In this case, just provide a null response.
        4) make sure to only use functions that really exist.
        5) for date operations, if needed, use Extract function.
        6) be very descriptive when naming columns. For example: 'total sales in 2024' instead of just 'total sales'. These names will be read by other systems and people who might not have the right context.
        7) always use the schema when declaring the tables.
    """
    orc = Orchestrator()
    response = orc.get_prompt_from_gemini(prompt)
    sql_code = format_sql(response)
    db_json_response = orc.execute_sql(db_config_file, sql_code)
    prompt = f"""
        format the following json string into a natural language format to answer the following question:
        here's the json string: {db_json_response}
        here's the question: '{question}
    """
    print("Answer: " + orc.get_prompt_from_gemini(prompt))