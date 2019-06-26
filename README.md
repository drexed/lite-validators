# Lite::Validators

[![Gem Version](https://badge.fury.io/rb/lite-validators.svg)](http://badge.fury.io/rb/lite-validators)
[![Build Status](https://travis-ci.org/drexed/lite-validators.svg?branch=master)](https://travis-ci.org/drexed/lite-validators)

Lite::Validators is a collection of validators useful for any Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-validators'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-validators

## Table of Contents

* [Validators](#validators)
* [3rd-party](#3rd-party)

## Validators

* [Alpha](https://github.com/drexed/lite-validators/blob/master/docs/ALPHA.md)
* [AlphaNumeric](https://github.com/drexed/lite-validators/blob/master/docs/ALPHA_NUMERIC.md)
* [Base64](https://github.com/drexed/lite-validators/blob/master/docs/BASE64.md)
* [Boolean](#booleanvalidator)
* [Coordinates](#coordinatesvalidator)
* [Credit Card](#creditcardvalidator)
* [Csv](#csvvalidator)
* [Currency](#currencyvalidator)
* [CUSIP](#cusipvalidator)
* [Email](#emailvalidator)
* [Equality](#equalityvalidator)
* [FileSize](#filesizevalidator)
* [Hex](#hexvalidator)
* [IMEI](#imeivalidator)
* [IP](#ipvalidator)
* [ISBN](#isbnvalidator)
* [ISIN](#isinvalidator)
* [MAC Address](#macaddressvalidator)
* [Name](#namevalidator)
* [Password](#passwordvalidator)
* [Phone](#phonevalidator)
* [SEDOL](#sedolvalidator)
* [Slug](#slugvalidator)
* [SSN](#ssnvalidator)
* [Time Zone](#timezonevalidator)
* [Tracking Number](#trackingnumbervalidator)
* [Type](#typevalidator)
* [URL](#urlvalidator)
* [Username](#usernamevalidator)
* [UUID](#uuidvalidator)

## 3rd-party

The following are highly recommended 3rd party validators to supplement your workflow:

* **DateTime:** Validates Timeliness - https://github.com/adzap/validates_timeliness
* **Existence:** Validates Existence - https://github.com/perfectline/validates_existence
* **Group:** Group Validations - https://github.com/adzap/grouped_validations
* **Overlap:** Validates Overlap - https://github.com/robinbortlik/validates_overlap

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-validators. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Validators project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-validators/blob/master/CODE_OF_CONDUCT.md).
