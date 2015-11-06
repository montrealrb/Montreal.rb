# Montreal.rb website

[![Build Status](https://travis-ci.org/montrealrb/Montreal.rb.svg)](https://travis-ci.org/montrealrb/Montreal.rb)

## Description

This is the Montreal.rb organization's website. It is still in development stage so you are welcome to contribute.

## Requirements

### Runtime

```
$ ruby --version
ruby 2.2.3

# Install it with the tool you prefer

gem install bundler # if not automatically installed with ruby
```

### Database

```
$ postgres --version
Postgresql 9.3

$ brew install postgresql # to install.
```

You should check out Ruby on Rails' guides if you are not familiar with the framework : http://guides.rubyonrails.org/

## Development Setup

Fork the repository and clone it to your machine. Then change directory to `Montreal.rb`

```
git clone <your_fork>
cd Montreal.rb
```

You should have Ruby version 2.2.3 installed using your prefered Ruby version tool (or udate your systems' Ruby)

Install all the project's dependencies:

```
bundle install
```

For the next parts, you need Postgresql installed, configured and running and a
`.pgpass` file in your home directory. The content of that file should look like:

```
# hostname:port:database:username:password
localhost:5432:*:sdeziel:myverysecurepassword
```

If everything is set up properly, running the next command should create your development database, load it's schema and load seed data:

```
rake db:setup
```

You should be ready to start your webserver using:

```
rails server # by default your application is accessible typing localhost:3000 in your browser.
```


## Testing

RSpec is used to test the application. You can run all the tests using

```
rspec .
```

or you can run a specific test file (example 1), or a single test (example 2, 17 is the line number of your test)

```
rspec spec/path/to/your/file.rb    # example 1

rspec spec/path/to/your/file.rb:17 # example 2
```

You can also use guard to test automatically when you save a file

```
bundle exec guard
```

## Deploy

The application does not have any deploy environment since it it still in development.

## Bug Tracker

If you find any bug, please open an issue in the project's Github repository (https://github.com/montrealrb/Montreal.rb/issues)

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT
