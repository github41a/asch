import pandas as pd

# Read the Excel file
data = pd.read_excel('input.xlsx')

# Apply the conditions to filter the data
filtered_data = data[
    (data['line_ref'] == 3) & 
    (data['entity'] == 'a1-1') & 
    (data['filter'] == 'l2-100')
]

# Check if any records satisfy all the conditions
if not filtered_data.empty:
    # Create a new text file
    with open('output.txt', 'w') as file:
        # Write the filtered records to the text file
        file.write(filtered_data.to_string(index=False))

        # Alternatively, if you want to write specific columns, you can do:
        # filtered_data[['col1', 'col2', 'col3']].to_string(index=False)

    print("Filtered data has been written to output.txt")
else:
    print("No records satisfy the specified conditions.")
