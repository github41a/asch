<div class="w-full h-screen bg-slate-100 p-10">
  <form class="p-4" (submit)="createChart()">
    <label for="report-type">Report Type</label>
    <select id="report-type" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-sm focus:ring-blue-500">
      <option value="Release Frequency Distribution">Release Frequency Distribution</option>
      <option value="Release Frequency Not Available">Release Frequency Not Available</option>
    </select>

    <label for="date">Select Date</label>
    <select id="date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-sm focus:ring-blue-500">
      <option value="">-- Select Date --</option>
      <option value="December 2022">December 2022</option>
      <option value="November 2022">November 2022</option>
      <option value="October 2022">October 2022</option>
      <option value="September 2022">September 2022</option>
      <!-- Add other date options as needed -->
    </select>

    <button class="bg-blue-500 px-2 py-1 text-white rounded-sm" type="submit">Submit</button>
  </form>

  <canvas id="piechart" width="250" height="250"></canvas>

  <div class="container">
    <canvas id="myChart" width="250" height="250"></canvas>
  </div>

  <table>
    <thead>
      <tr>
        <th>CIO</th>
        <th>0-50</th>
        <th>51-99</th>
        <th>Equal to 100</th>
        <th>Not Available</th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody>
      <!-- Add table data as needed -->
    </tbody>
  </table>
</div>
