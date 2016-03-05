# Montreal.rb website

[![Build Status](https://travis-ci.org/montrealrb/Montreal.rb.svg)](https://travis-ci.org/montrealrb/Montreal.rb)
[![Dependency Status](https://gemnasium.com/montrealrb/Montreal.rb.svg)](https://gemnasium.com/montrealrb/Montreal.rb)
[![Code Climate](https://codeclimate.com/github/montrealrb/Montreal.rb/badges/gpa.svg)](https://codeclimate.com/github/montrealrb/Montreal.rb)
[![Coverage Status](https://coveralls.io/repos/montrealrb/Montreal.rb/badge.svg?branch=master&service=github)](https://coveralls.io/github/montrealrb/Montreal.rb?branch=master)

## Description

This is the Montreal.rb organization's website. It is still in development stage so you are welcome to contribute.
You can join our [Slack Channel](https://montrealrb-slack.herokuapp.com/) if you have any question, need some help to get started or just hang around with friendly people.

## Requirements

### Runtime

- ruby 2.2.4
- Postgresql 9.3+

## Development Setup

Fork the repository and clone it to your machine. Then change directory to `Montreal.rb`

```bash
$ git clone <your_fork> && cd Montreal.rb
```

### Ruby & Bundler

You should have Ruby version `2.2.4` installed using your prefered Ruby version management tool (or by globally updating your system Ruby)

__Most Popular Ruby Version Managers__

- [rbenv](http://rbenv.org/)
- [rvm](https://rvm.io/)

You should also have [bundler](http://bundler.io/) (minimum `v1.10`) to help with tracking and installing the exact gems and versions that are needed.

### Database

Do you have Postgres installed?

```bash
$ postgres --version
Postgresql 9.3
```

For the next parts, you need Postgresql installed, configured and running and a
`.pgpass` file in your home directory. The content of that file should look like:

```
# hostname:port:database:username:password
localhost:5432:*:sdeziel:myverysecurepassword
```

#### Install Postgres

```bash
$ brew install postgresql
```

### Rails

> You should check out Ruby on Rails' guides if you are not familiar with the framework : http://guides.rubyonrails.org/

#### Setup your Project

```bash
$ bin/setup
```

__IMPORTANT: `pg` gem installation error__

If you experience an error during the execution of that script related to the installation of the `pg` gem,
you might want to try the following procedure:

```bash
$ sudo find / -name "pg_config"
# Use the most appropriate path found by the command above
$ gem install pg -- --with-pg-config=<your_pg_config_path>
$ bin/setup
```

Once successfully completed, this setup script will:

- install `bundler` for managing your gem dependencies
- install your project's required gems
- create and setup your database
- cleanup logs and temporary files

__Set environment variables__

Omniauth is used to allow users to log in to the site using GitHub accounts. To 
use the GitHub API, you must set environment variables for the GitHub 'key' and 
'secret.'

You can first obtain this key/secret [through your GitHub account](https://github.com/settings/applications/new).

Now you need to set the environment variables on your server. The procedure will
depend on your system.

On Unix-based systems using the bash shell, add the following to your `~/.bashrc` 
file, replacing the inside of the quotes with your key/secret:

```
export GITHUB_KEY="your_key"
export GITHUB_SECRET="your_secret"
```

If using Heroku, you can set the environment variables like this:

```
heroku config:add GITHUB_KEY=your_key GITHUB_SECRET=your_secret --app Montreal.rb
```

#### Start your Web Server

You should be ready to start your webserver using:

```bash
$ bin/rails server
```

By default, your application is accessible at [http://localhost:3000](http://localhost:3000) in your browser.

## Testing

RSpec is used to test the application. You can run all the tests using

```bash
$ bin/rspec
```

or you can run a specific test file (example 1), or a single test (example 2, 17 is the line number of your test)

```bash
$ bin/rspec spec/path/to/your/file.rb    # example 1

$ bin/rspec spec/path/to/your/file.rb:17 # example 2
```

You can also use guard to test automatically when you save a file

```bash
$ bundle exec guard
```

__PROTIP:__ install [ctags](http://ctags.sf.net) and guard will automatically generate an index (or tag) file
of language objects found in source files that allows these items to be quickly and easily located by a text editor.

- ex: macos `brew install ctags && sudo mv /usr/bin/ctags /usr/bin/ctags.bak`
- ex: ubuntu `sudo apt-get install exuberant-ctags`

## Deploy

This application is automatically deployed to __heroku__ after a successful [Travis CI](http://docs.travis-ci.com/user/deployment/heroku/) build of the *master* branch.

### URLs

- The heroku url is: [https://montreal-rb.herokuapp.com/](https://montreal-rb.herokuapp.com/)
- The official url is: [https://montrealrb.com/](https://montrealrb.com/)

## Bug Tracker

If you find any bug, please open an issue in the project's Github repository (https://github.com/montrealrb/Montreal.rb/issues)

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md).

Everyone interacting in Montrealrb.com and its sub-projects' codebases, issue trackers, chat rooms, and mailing lists is expected to follow our [code of conduct](CODE_OF_CONDUCT.md).

## License

*montrealrb.com* is released under the [MIT License](LICENSE).
