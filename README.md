# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- 2.6.5

* System dependencies
- Postgresql
- Redis

* Configuration

* Database creation
- bundle exec rails db:create

* Database initialization
- bundle exec rails db:seed
* How to run the test suite

- bundle exec rake db:test:prepare
- bundle exec rake spec
- SIMPLECOV=true bundle exec rake spec
- bundle exec brakeman --exit-on-warn

* Services (job queues, cache servers, search engines, etc.)
### sidekiq

- bundle exec sidekiq

* Deployment instructions

* Crawling the events from external site

Please run below command from rails console & sidekiq should be running.

- Crawler.new(WebResource.find(id)).call

# Please use cancel from calender for clearing the date range.
