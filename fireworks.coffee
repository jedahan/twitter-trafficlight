twitter = require 'ntwitter'

twit = new twitter {
  consumer_key: 'TIcyT8z7yV3aeSiGUV0xhg',
  consumer_secret: 'O67bqFFuJLKoAWGImNKD3jgUzW2RGEiMNHXmSCL8gA',
  access_token_key: '14417425-u99mAJwnqwxmanRtxNt8uK6lP6uvlQddzpBvJrP3E',
  access_token_secret: 'ISjmFijrSyLUT7Z3nAQ9qESGW8tM8NtsOTrmvES4'
}

minutes = 0.2
the_interval = minutes * 60 * 1000
tweetcount = []

setInterval ->
  count_tweets()
  console.log "#{tweetcount[tweetcount.length-1]} new tweets"
  change_light()
, the_interval

count_tweets = ->
  twit
    .verifyCredentials (err, data) ->
      console.log 'ERROR' if err
    .search 'fireworks', {'locations':'-74,40,-73,41'}, (err, data) ->
      tweetcount.push data.results.length

change_light = ->
  console.log tweetcount