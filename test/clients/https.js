const https = require('https');

const uri = process.argv[2]

const req = https.request(uri, (res) => {
  console.log('statusCode: %j', res.statusCode);
  console.log('headers: %j', res.headers);
  res.on('data', (d) => {
    process.stdout.write(d);
  });
});

req.on('error', (e) => {
  console.error(e);
});

req.end();
