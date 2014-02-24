#!/usr/bin/env ruby
# $ RAILS_ENV=development ruby tweet_timeline.rb timgushue
require 'rubygems'
require 'twitter'
require 'active_record'
require 'csv'
require 'yaml'
require 'debugger'


# set up database connection
DBCONFIG = YAML::load(File.open(File.join(File.dirname(__FILE__), "../db/config.yml")))
# Had to hardcode connection for now.
ActiveRecord::Base.establish_connection("adapter"=>"sqlite3", "database"=>"db/development.sqlite3", "pool"=>5, "timeout"=>5000)


class UserTimeline < ActiveRecord::Base
end


# twitter authentication 
CREDENTIALS = YAML::load(File.open(File.join(File.dirname(__FILE__), "../config/credentials.yml")))

client = Twitter::REST::Client.new do |config|
  config.consumer_key = CREDENTIALS['consumer_key']
  config.consumer_secret = CREDENTIALS['consumer_secret']
  config.access_token = CREDENTIALS['access_token']
  config.access_token_secret = CREDENTIALS['access_token_secret']
end


# store the <username> 
twitter_username =  String.new ARGV[0]

# collect last 10 tweets from <username>
timeline = client.user_timeline(twitter_username, :count => 10)

timeline.map { |t|
  UserTimeline.create(
    :id_str  => t.id.to_s,
    :text  => t.text,
    :retweet_count  => t.retweet_count ? t.retweet_count : "",
    :favorite_count  => t.favorite_count ? t.favorite_count : "",
    :favorited  => t.favorited,
    :retweeted  => t.retweeted,
    :lang  => t.lang
  )
}





