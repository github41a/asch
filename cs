downloadCSV(): void {
    const csvContent = this.convertToCSV(this.pagedUsers);
    this.downloadFile(csvContent, 'table.csv', 'text/csv');
  }
  
  // downloadImage(): void {
  //   if (this.table) {
  //     const tableHtml = this.table.nativeElement.outerHTML;
  //     const image = new Image();
  //     const canvas = document.createElement('canvas');

  //     // Wait for the image to load before performing the canvas operations
  //     image.onload = () => {
  //       canvas.width = image.width;
  //       canvas.height = image.height;

  //       const context = canvas.getContext('2d');
  //       if (context) {
  //         context.drawImage(image, 0, 0);

  //         // Convert the canvas to a data URL and trigger the file download
  //         canvas.toBlob((blob) => {
  //           if (blob) {
  //             const url = URL.createObjectURL(blob);
  //             const link = document.createElement('a');
  //             link.href = url;
  //             link.download = 'table.png';
  //             link.click();
  //             URL.revokeObjectURL(url);
  //           } else {
  //             console.error('Failed to generate the image blob.');
  //           }
  //         }, 'image/png');
  //       }
  //     };

  //     image.src = 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(tableHtml)));
  //   }
  //}

  convertToCSV(data: any[]): string {
    const headers = Object.keys(data[0]);
    const rows = data.map((item) => headers.map((header) => item[header]));
    const csvArray = [headers.join(',')].concat(rows.map((row) => row.join(',')));
    return csvArray.join('\n');
  }

  downloadFile(content: string, fileName: string, mimeType: string): void {
    const blob = new Blob([content], { type: mimeType });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = fileName;
    link.click();
    URL.revokeObjectURL(url);
  }








