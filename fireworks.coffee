config = require './config'
twitter = require 'ntwitter'
twit = new twitter config

serialport = require('serialport').SerialPort
arduino = new serialport '/dev/ttyUSB0', {baudrate: 115200}

minutes = 0.2
the_interval = minutes * 60 * 1000
tweetcount = []
maxtweets = 0

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
      maxtweets = data.results.length if data.results.length > maxtweets

change_light = ->
  console.log tweetcount
  lastcount = tweetcount[tweetcount.length-1]
  arduino.write 'R0Y0G0'
  arduino.write 'R1' if lastcount > (2/3)*lastcount
  arduino.write 'Y1' if lastcount > (1/3)*lastcount
  arduino.write 'G1' if lastcount > 0
