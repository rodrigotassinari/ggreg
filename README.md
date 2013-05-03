# ggreg

[![Code Climate](https://codeclimate.com/github/rtopitt/ggreg.png)](https://codeclimate.com/github/rtopitt/ggreg)
[![Build Status](https://travis-ci.org/rtopitt/ggreg.png?branch=master)](https://travis-ci.org/rtopitt/ggreg)
[![Coverage Status](https://coveralls.io/repos/rtopitt/ggreg/badge.png?branch=master)](https://coveralls.io/r/rtopitt/ggreg)

Aggregates several public stuff you post online in a single searchable and subscribable timeline.

**EXTREMELY ALPHA SOFTWARE!**

## Before running:

```
$ cp config/application.example.yml config/application.yml
```

* Register your app with Twitter at https://dev.twitter.com/apps/new (Read only access is fine) and then setup your OAuth credentials in `config/application.yml`

## To run:

```
$ bundle
$ rake db:setup
$ foreman start
```
