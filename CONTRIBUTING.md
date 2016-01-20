# Contributing

We love pull requests from everyone.

Fork, then clone the repo:

```bash
$ git clone git@github.com:your-username/Montreal.rb.git
```

Set up your machine ([read the appropriate README section](README.md#development-setup)):

```bash
$ bin/setup
```

Make sure the tests pass:

```bash
$ bin/rspec
```

Make your change. Add tests for your change. Make the tests pass:

```bash
$ bin/rspec
```

Push to your fork and [submit a pull request][pr].

At this point you're waiting on us. We like to at least comment on pull requests
within three business days (and, typically, one business day). We may suggest
some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Write tests.
* Follow our [project's standards](#style-guides).
* Write a [good commit message][commit].

## Style Guides

This codebase is using [houndci.com](https://houndci.com) a hosted service that
reviews GitHub pull requests for Ruby, CoffeeScript, and SCSS style guide violations.

For more information about the different style guides we try to enforce, please
check the list below.

1.  [Ruby](https://github.com/bbatsov/ruby-style-guide)
1.  [Rails](https://github.com/bbatsov/rails-style-guide)
1.  [Testing](https://github.com/thoughtbot/guides/tree/master/style/testing)
1.  [ERB Templating](http://www.stuartellis.eu/articles/erb/)
1.  [Bootstrap 3 - HTML, CSS, and JS Framework](http://getbootstrap.com/)
1.  [Sass - CSS Preprocessor](http://sass-lang.com/)
1.  [CoffeeScript](https://github.com/thoughtbot/guides/tree/master/style/coffeescript)
1.  [Markdown](http://www.cirosantilli.com/markdown-style-guide/)
1.  Interface text should be written subjectively instead of objectively. It should be the Montrealrb.com core team addressing a person. It should be written in present time and never use past tense (has been/was). For example instead of "prohibited this user from being saved due to the following errors:" the text should be "sorry, we could not create your account because:". Also these [excellent writing guidelines](https://github.com/NARKOZ/guides#writing).

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pr]: https://github.com/montrealrb/Montreal.rb/compare/
