const https = require('https');

let data = '';
https.get('https://dbdwvr6p7sskw.cloudfront.net/210/files/email_data_v2.js', (resp) => {
  let data = '';

  // A chunk of data has been received.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received.
  resp.on('end', () => {
    eval(data);
    mailCount(emailData); // Handle the data
  });

}).on('error', (err) => {
  console.log('Error: ' + err.message);
});

function getDateFromEmail(email) {
  let date = email.split('#/#')[2]
                  .replace("\nDate: ", '');

  return new Date(date);
}

function getDateRange(dates) {
  let sortedDates = [...dates].sort((a, b) => a - b);
  return `${sortedDates[0].toDateString()} - ${sortedDates.slice(-1)[0].toDateString()}`;
}

function mailCount(emailData) {
  let parsedDates = emailData.split('##||##').map(getDateFromEmail);
  let dateRange = getDateRange(parsedDates);
  console.log(`Count of Email: ${parsedDates.length}`)
  console.log('Date Range: ' + dateRange);
}
