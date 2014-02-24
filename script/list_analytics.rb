#! /usr/bin/env ruby

require 'rubygems'


# check for the username
if ARGV.empty?
  puts "list_analytics.rb needs a twitter username for the first argument as folows: "
  puts "$ ruby ito_miner.rb <twitter_username> "
  exit
end

# store the username
twitter_username =  String.new ARGV[0]


# SYSTEM CALLS
# pull timeline into database
`ruby tweet_timeline.rb #{twitter_username} `

# all the analytical heavy lifting is done in R 
`R CMD BATCH --no-save --no-restore "--args #{twitter_username}" SOME-R-PROGRAM.r #{twitter_username}.Rout`

