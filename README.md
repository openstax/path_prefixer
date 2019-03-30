# OpenStax Path Prefixer

[![Build Status](https://travis-ci.org/openstax/path_prefixer.svg?branch=master)](https://travis-ci.org/openstax/path_prefixer)

This gem lets all routes in your app be accessed with an optional path prefix.


To use the gem, simply add it to your Gemfile:

```rb
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
...
gem 'openstax_path_prefixer', github: 'openstax/keyword_search', ref: 'some_sha_here'
```

Then configure your app with the prefix you want (e.g. in your `config/initializers/openstax_path_prefixer.rb`):

```rb
OpenStax::PathPrefixer.configure do |config|
  config.prefix = "a_prefix"
end
```
