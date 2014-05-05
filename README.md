Pull the timelines from a Twitter List into a database for mining

## Quick Start Guide

First, register your application with Twitter.

Then, create a credentials.yml like the example.

Creating and migrating databases:
```ruby
rake db:new_migration name=CreateUserTimeline
rake db:migrate VERSION=20140223214331
```

To run (from root directory):
```ruby
RAILS_ENV=development ruby script/tweet_timeline.rb <username>
```

Look at:
https://github.com/sferik/twitter/blob/master/lib/twitter/streaming/client.rb
https://dev.twitter.com/discussions/399

TODO:
- Break rest api into seperate process that updates lists (maybe statuses?)
  * catch 420 exceptions and pause for 15-30 min
- Create seperate process for brute curling all statuses to get favorite/retweet counts (daily ?)
- Maybe wrap these up in a rails or sinatra app to monitor/relaunch on a remote box
- Work on front-end data mining tools (Rstudio shiny or d3)