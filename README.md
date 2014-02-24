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

