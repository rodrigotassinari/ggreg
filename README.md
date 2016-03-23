# ggreg

Aggregates several public stuff you post online in a single searchable and subscribable (via RSS) timeline.

[![Code Climate](https://codeclimate.com/github/rodrigotassinari/ggreg.png)](https://codeclimate.com/github/rodrigotassinari/ggreg)
[![Build Status](https://travis-ci.org/rodrigotassinari/ggreg.png?branch=master)](https://travis-ci.org/rodrigotassinari/ggreg)
[![Coverage Status](https://coveralls.io/repos/rodrigotassinari/ggreg/badge.png?branch=master)](https://coveralls.io/r/rodrigotassinari/ggreg)

**EXTREMELY ALPHA SOFTWARE!**, work in progress.

## Running on development

You will need:

- Ruby 2.3+
- PostgreSQL 9.4+
- Redis 2.8+

Clone the repo and create a `.env` file with values for your environment (use `.env.example` as a starting point, changing the values where needed).

Next run the standard Rails app setup:

```
$ bundle install
$ bundle exec rake db:setup
```

To start the app, run:

```
$ bin/foreman start
```

## Testing

Simply run:

```
$ bin/rspec
```

## Contributing

Fork this repo, make your changes on your fork in a topic branch and submit a pull request against this repo's master branch.

Please write all code, comments, tests and commit messages in english. Use 2 spaces to indent code and follow idiomatic Ruby as close as possible. No CoffeeScript, please.

## License

This project is open source and licensed under the terms of the MIT License. See `LICENSE` for more information.
