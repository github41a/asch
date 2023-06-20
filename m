import sqlite3

# Establish a connection to the database or create a new one
conn = sqlite3.connect('your_database.db')

# Create a cursor object to execute SQL commands
cursor = conn.cursor()

# Create a table in the database
create_table_query = '''
    CREATE TABLE YourTableName (
        ProductName TEXT,
        SAP_ACCOUNT INTEGER,
        FLEX_BALANCE REAL,
        BalanceStatus TEXT,
        AnotherCase TEXT,
        NullCheck TEXT,
        LINE_REF INTEGER,
        ENTITY TEXT
    )
'''
cursor.execute(create_table_query)

# Insert data into the table using CASE expressions
insert_data_query = '''
    INSERT INTO YourTableName (
        ProductName,
        SAP_ACCOUNT,
        FLEX_BALANCE,
        BalanceStatus,
        AnotherCase,
        NullCheck,
        LINE_REF,
        ENTITY
    )
    SELECT
        ProductName,
        SAP_ACCOUNT,
        FLEX_BALANCE,
        CASE
            WHEN FLEX_BALANCE > 0 THEN 'Positive'
            WHEN FLEX_BALANCE < 0 THEN 'Negative'
            ELSE 'Zero'
        END AS BalanceStatus,
        CASE
            WHEN COLUMN_A = 'Value1' THEN 'Case1'
            WHEN COLUMN_A = 'Value2' THEN 'Case2'
            ELSE 'Other'
        END AS AnotherCase,
        CASE
            WHEN COLUMN_B IS NULL THEN 'Null'
            ELSE 'Not Null'
        END AS NullCheck,
        LINE_REF,
        ENTITY
    FROM
        YourSourceTable
'''
cursor.execute(insert_data_query)

# Commit the changes and close the connection
conn.commit()
conn.close()








import pandas as pd
import sqlite3  # Replace with your preferred database library

# Establish a connection to your database
conn = sqlite3.connect('your_database.db')  # Replace with your database connection details

# Define the SQL query with multiple CASE expressions
query = '''
    SELECT
        ProductName,
        SAP_ACCOUNT,
        CASE
            WHEN FLEX_BALANCE > 0 THEN 'Positive'
            WHEN FLEX_BALANCE < 0 THEN 'Negative'
            ELSE 'Zero'
        END AS BalanceStatus,
        CASE
            WHEN COLUMN_A = 'Value1' THEN 'Case1'
            WHEN COLUMN_A = 'Value2' THEN 'Case2'
            ELSE 'Other'
        END AS AnotherCase,
        CASE
            WHEN COLUMN_B IS NULL THEN 'Null'
            ELSE 'Not Null'
        END AS NullCheck,
        LINE_REF,
        ENTITY
    FROM
        YourTableName
    '''

# Execute the query and fetch the results into a DataFrame
df = pd.read_sql_query(query, conn)

# Export DataFrame to an Excel file
df.to_excel('output.xlsx', index=False)
