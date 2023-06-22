downloadExcel(): void {
    const worksheetName = 'Table Data';

const workbook = XLSX.utils.book_new();
const worksheet = XLSX.utils.aoa_to_sheet([['Name', 'Email', 'Phone'], ...this.pagedUsers.map(user => [user.name, user.email, user.phone])]);

XLSX.utils.book_append_sheet(workbook, worksheet, worksheetName);

const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });
const excelData = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
saveAs(excelData, 'table.xlsx');
