# OpenStax Path Prefixer

[![Build Status](https://travis-ci.org/openstax/path_prefixer.svg?branch=master)](https://travis-ci.org/openstax/path_prefixer)

This gem lets all routes in your app be accessed with an optional path prefix.
When the app is accessed with this prefix, redirects and url/path helpers will also
use the prefix.

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

This gem can also help to prefix assets.  This has only been shown to work when assets are precompiled, e.g. in production, so
a configuration like the following is recommended:

```rb
OpenStax::PathPrefixer.configure do |config|
  config.prefix_assets = Rails.env.production?
end
```
