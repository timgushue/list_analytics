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
ActiveRecord::Base.establish_connection("adapter"=>"sqlite3", "database"=>"../db/development.sqlite3", "pool"=>5, "timeout"=>5000)


class UserTimeline < ActiveRecord::Base
end
class UserList < ActiveRecord::Base
end

# twitter authentication 
CREDENTIALS = YAML::load(File.open(File.join(File.dirname(__FILE__), "../config/credentials.yml")))

restClient = Twitter::REST::Client.new do |config|
  config.consumer_key = CREDENTIALS['consumer_key']
  config.consumer_secret = CREDENTIALS['consumer_secret']
  config.access_token = CREDENTIALS['access_token']
  config.access_token_secret = CREDENTIALS['access_token_secret']
end

streamClient = Twitter::Streaming::Client.new do |config|
  config.consumer_key = CREDENTIALS['consumer_key']
  config.consumer_secret = CREDENTIALS['consumer_secret']
  config.access_token = CREDENTIALS['access_token']
  config.access_token_secret = CREDENTIALS['access_token_secret']
end


# # store the <username> 
# twitter_username =  String.new ARGV[0]

# # collect last 10 tweets from <username>
# timeline = restClient.user_timeline(twitter_username, :count => 10)

# timeline.map { |t|
#   UserTimeline.create(
#     :id_str  => t.id.to_s,
#     :text  => t.text,
#     :retweet_count  => t.retweet_count ? t.retweet_count : "",
#     :favorite_count  => t.favorite_count ? t.favorite_count : "",
#     :favorited  => t.favorited,
#     :retweeted  => t.retweeted,
#     :lang  => t.lang
#   )
# }

# screen_name = "kitson"
# list_name = "thought-leaders"

# lists = restClient.list(screen_name, list_name)
# lists.map { |t|
#   p t
#   # UserList.create(
#   #   :owner_id => t.['users']['owner_id'],
#   #   :owner_id_str => t.user.owner_id_str,
#   #   :slug => t.slug,
#   #   :name => t.name,
#   #   :uri => t.uri,
#   #   :created_at => t.created_at,
#   #   :id_str => t.id_str,
#   #   :subscriber_count => t.subscriber_count,
#   #   :member_count => t.member_count,
#   #   :mode => t.mode,
#   #   :id => t.id,
#   #   :full_name => t.full_name,
#   #   :description => t.description
#   # )
# }



# topics = ["531765009", "2477427636"]
# streamClient.filter(:follow => topics.join(",")) do |object|
#   puts object.text
#   UserTimeline.create(
#     :id_str         => object.id.to_s,
#     :text           => object.text,
#     :retweet_count  => object.retweet_count ? object.retweet_count : "",
#     :favorite_count => object.favorite_count ? object.favorite_count : "",
#     :favorited      => object.favorited,
#     :retweeted      => object.retweeted,
#     :lang           => object.lang
#   )
# end

topics = ["twitter", "awesome"]
streamClient.filter(:track => topics.join(",")) do |object|
  puts object.user.id
end
# list_members = restClient.list_members(screen_name, list_name)

# debugger
# list_members.map { |t|
#   p t
#   # UserList.create(
#   #   :owner_id => t.['users']['owner_id'],
#   #   :owner_id_str => t.user.owner_id_str,
#   #   :slug => t.slug,
#   #   :name => t.name,
#   #   :uri => t.uri,
#   #   :created_at => t.created_at,
#   #   :id_str => t.id_str,
#   #   :subscriber_count => t.subscriber_count,
#   #   :member_count => t.member_count,
#   #   :mode => t.mode,
#   #   :id => t.id,
#   #   :full_name => t.full_name,
#   #   :description => t.description
#   # )
# }





