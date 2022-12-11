# README

This is a Ruby on Rails application produced as a possible solution to the coding task described [here]('https://tech.olioex.com/rails-coding-task.html')

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
3. Prepare the database
```bash
$ bundle exec rails db:migrate
```
4. Start the application
```bash
$ bundle exec rails server
```
Then you can visit the application in a browser at `http://localhost:3000`. Rails will log output directly to the terminal. Use `ctrl+c` to stop the server at any time.
> Rails will bind to IP `127.0.0.1` and port `3000` by default. If these defaults do not suit your system, you can specify a different IP and port to bind to using the `-b` and `-p` switches - example: `bundle exec rails server -b=0.0.0.0 -p=4000`

### Unit tests and linting
This application uses:
- [RSpec](https://rspec.info/) for unit tests
```bash
$ bundle exec rspec
```

- [Rubocop](https://rubocop.org/) for linting
```bash
$ bundle exec rubocop
```


### Additional Ruby gems
This application uses the following additional gems to support testing and development:
- [rspec-rails](https://rubygems.org/gems/rspec-rails)
- [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails)
- [shoulda-matchers](https://rubygems.org/gems/shoulda-matchers)
- [webmock](https://rubygems.org/gems/webmock)
- [rubocop](https://rubygems.org/gems/rubocop)
- [rubocop-performance](https://rubygems.org/gems/rubocop-performance)
- [rubocop-rails](https://rubygems.org/gems/rubocop-rails)
- [rubocop-rspec](https://rubygems.org/gems/rubocop-rspec)


### TODO / Improvements
#### Refactor likes
The "like" functionality could be improved.
- Create a dedicated Model with polymorphic associations so the function can be shared across concerns.
- Create a dedicated Controller and tidy up the routing.
- Avoid full page reloads when following "like" links (use Hotwire and/or JS)

The test coverage could be improved.
- More/better unit testing, particularly controller tests.
- Automated browser testing to test actual page rendering and interactions.
