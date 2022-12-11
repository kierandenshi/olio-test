# README

This is a [Ruby on Rails](https://guides.rubyonrails.org/index.html) application produced as a possible solution to the coding task described [here]('https://tech.olioex.com/rails-coding-task.html').

Please ensure your system has the proper prerequisites installed. These are:

- Ruby version 3.1.2
- SQLite3

### Getting started

1. Clone this repository, and switch to the new directory
```bash
$ git clone git@github.com:kierandenshi/test-app-rails.git
$ cd test-app-rails
```
2. Install required Ruby gems
```bash
$ bundle install
```
> This application uses the following additional gems to support testing and development:
[rspec-rails](https://rubygems.org/gems/rspec-rails),
[factory_bot_rails](https://rubygems.org/gems/factory_bot_rails),
[shoulda-matchers](https://rubygems.org/gems/shoulda-matchers),
[webmock](https://rubygems.org/gems/webmock),
[rubocop](https://rubygems.org/gems/rubocop),
[rubocop-performance](https://rubygems.org/gems/rubocop-performance),
[rubocop-rails](https://rubygems.org/gems/rubocop-rails),
[rubocop-rspec](https://rubygems.org/gems/rubocop-rspec).

3. Prepare the database
```bash
$ bundle exec rails db:create
$ bundle exec rails db:migrate
```
4. Start the application
```bash
$ bundle exec rails server
```
Then you can visit the application in a browser at `http://localhost:3000`. Rails will log output directly to the terminal. Use `ctrl+c` to stop the server at any time.
> Rails will bind to IP `127.0.0.1` and port `3000` by default. If these defaults do not suit your system, you can specify a different IP and port to bind to using the `-b` and `-p` switches - example: `bundle exec rails server -b=0.0.0.0 -p=4000`

### Application files
In keeping with the Rails principle of convention over configuration, the application's files live inside the `/app` directory. Following MVC, sub-directories of interest (for this application) are `controllers`, `models`, `services`, and `views`. Routes are defined in `/config/routes.rb`.

### Unit tests and linting
This application uses:
- [RSpec](https://rspec.info/) for unit tests.
  The files that contain unit tests can be found in the `/spec` directory.
```bash
$ bundle exec rspec
```


- [Rubocop](https://rubocop.org/) for linting.
```bash
$ bundle exec rubocop
```
> Some of the default rules relating to next line indentation have been disabled to suit personal preference. These can be re-enabled by updating the root level configuration file `.rubocop.yml`


### TODO / Improvements
#### Rate limit data fetching
Data required for functional display is persisted locally so it is not necessary to perform a fetch each time the application receives a request. Simple rate limiting could be implemented by locally storing and checking a timestamp value before performing fetches.
#### Refactor likes
The "like" functionality could be improved.
Using a dedicated controller and model could improve routing, and polymorphic associations would allow the like function to be used with additional models should the application grow. Full page reloads when using the "like" links could be avoided with use of Hotwire, or some client side Javascript.

#### Improve test coverage
- More/better unit testing, particularly controller tests.
- Automated browser testing to test actual page rendering and interactions.
