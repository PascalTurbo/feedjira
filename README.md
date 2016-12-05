# Feedjira [![Build Status][travis-badge]][travis] [![Code Climate][code-climate-badge]][code-climate]

[travis-badge]: https://travis-ci.org/feedjira/feedjira.png
[travis]: http://travis-ci.org/feedjira/feedjira
[code-climate-badge]: https://codeclimate.com/github/feedjira/feedjira.png
[code-climate]: https://codeclimate.com/github/feedjira/feedjira

Feedjira (formerly Feedzirra) is a Ruby library designed to fetch and parse
feeds as quickly as possible. Version 1.0 was recently released and with it an
[awesome new website][f].

[f]: http://feedjira.com

There you'll find documentation, examples, announcements and more.

## Usage

### Configuration

Feedjira Configuration Options could be set either by calling them directly via

```ruby
Feedjira.config.logger = Logger.new('foo.log')
```

or using a block

```ruby
Feedjira.configure do |config|
  config.logger = Logger.new('foo.log')
end
```

#### Logger

Per default Feedjira will log all messages to STDOUT. If you are using Feedjira in your own app you could pass your logger instance to Feedjira to use a single logger for the whole application.
Feedjira will always use 'Feedjira' as ProgName so you can identify specific Feedjira log entries. 

