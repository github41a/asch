import pandas as pd
import sqlite3

# Function to check if a table exists in the database
def table_exists(conn, table_name):
    query = f"SELECT name FROM sqlite_master WHERE type='table' AND name='{table_name}';"
    cursor = conn.cursor()
    cursor.execute(query)
    result = cursor.fetchone()
    return result is not None

# Read the SQL file
def read_sql_file(sql_file):
    with open(sql_file, 'r') as file:
        sql_query = file.read()
    return sql_query

# Read the Excel file
def read_excel_file(excel_file):
    data = pd.read_excel(excel_file)
    return data

# Check if conditions are satisfied and get unsatisfied records
def check_conditions(sql_query, data):
    # Create an in-memory SQLite database
    conn = sqlite3.connect(':memory:')

    # Check if the data table exists in the database
    if not table_exists(conn, 'data'):
        data.to_sql('data', conn, index=False)

    # Execute the SQL query
    cursor = conn.cursor()
    cursor.execute(sql_query)

    # Fetch all the results
    results = cursor.fetchall()

    # Close the database connection
    conn.close()

    # Return the unsatisfied records
    return results

# Main script
def main():
    # Input files
    sql_file = 'input.sql'
    excel_file = 'input.xlsx'
    output_file = 'output.txt'

    # Read SQL query from file
    sql_query = read_sql_file(sql_file)

    # Read Excel data
    data = read_excel_file(excel_file)

    # Check if conditions are satisfied and get unsatisfied records
    unsatisfied_records = check_conditions(sql_query, data)

    # Write the records to the output file
    with open(output_file, 'w') as file:
        if unsatisfied_records:
            file.write("Records not satisfying the conditions:\n")
            for record in unsatisfied_records:
                file.write(str(record) + "\n")
            file.write("\n")

        satisfied_records = data[~data.isin(unsatisfied_records)].dropna()
        if not satisfied_records.empty:
            file.write("Records satisfying the conditions:\n")
            file.write(satisfied_records.to_string(index=False))
            file.write("\n")

    print("Records written to", output_file)

if __name__ == '__main__':
    main()
