twitter = require 'ntwitter'
config = require './config'
twit = new twitter config

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