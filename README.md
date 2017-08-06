# Rails 5 Skeleton

Base skeleton is from Thoughtbot's open source [Suspenders](https://github.com/thoughtbot/suspenders) template. Additional boilerplate includes minor adjustments to file structure, additional RSpec and Capybara documentation, and models for User and Session.

### Prerequisites

* Ruby version 2.4.1
* PostgreSQL

### Installing

Clone the repo:
`git clone https://github.com/bisonhubert/rails-skeleton.git`

Move into the cloned directory and bundle install
`cd rails-skeleton && bundle install`

Create the database and run pending migrations
`rake db:create && rake db:migrate`