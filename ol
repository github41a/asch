import pandas as pd
import numpy as np

# Read the Excel file into a DataFrame
df = pd.read_excel('input.xlsx')

# Define the conditions for each column
conditions = {
    'SAP Account': [
        
    ],
    'Entity Group': [3],
    'Flex Balance': ['PlexRep', 'SAP'],
    'LINE_REF': ['L2-94'],
    'ELSE_col': ['A1-1']
}

# Apply the conditions to the DataFrame
satisfying_rows = np.ones(len(df), dtype=bool)

for column, allowed_values in conditions.items():
    # Get the column values
    column_values = df[column].values

    # Check if the column values are present in the allowed values
    satisfying_rows &= np.isin(column_values, allowed_values)

# Filter the DataFrame with satisfying rows
satisfying_df = df[satisfying_rows]

# Print the satisfying rows
for row in satisfying_df.itertuples(index=False):
    # Extract the row values (excluding the index)
    row_values = row[1:]
    print(f"Row: {row_values} satisfies the conditions.")

# Print the total count of rows satisfying the conditions
count = len(satisfying_df)
print(f"Total count of rows satisfying the conditions: {count}")
