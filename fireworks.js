var twitter = require('ntwitter');

var twit = new twitter({
  consumer_key: 'TIcyT8z7yV3aeSiGUV0xhg',
  consumer_secret: 'O67bqFFuJLKoAWGImNKD3jgUzW2RGEiMNHXmSCL8gA',
  access_token_key: '14417425-u99mAJwnqwxmanRtxNt8uK6lP6uvlQddzpBvJrP3E',
  access_token_secret: 'ISjmFijrSyLUT7Z3nAQ9qESGW8tM8NtsOTrmvES4'
});

twit.stream('statuses/filter', {track:'nodejs'}, {'locations':'-74,40,-73,41'}, function(stream) {
  stream.on('data', function (data) {
    console.log(data);
  });
});