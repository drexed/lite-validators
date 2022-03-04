# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.6.0] - 2022-02-17
### Changed
- Added List validator
- Update to use public_send instead of send

## [1.5.0] - 2022-02-17
### Changed
- Added `include_address` to ip_address validator
- Added `exclude_address` to ip_address validator

## [1.4.0] - 2022-02-11
### Changed
- Added `include_host` to url validator
- Added `exclude_host` to url validator

## [1.3.2] - 2021-07-22
### Changed
- Improved setup

## [1.3.1] - 2021-07-21
### Changed
- Improved Railtie support

## [1.3.0] - 2021-07-19
### Added
- Added Ruby 3.0 support

## [1.2.0] - 2021-07-13
### Updated
- Update name validator to accept numeric values and remove double quotes

## [1.1.2] - 2021-07-05
### Updated
- Improve array build performance

## [1.1.1] - 2020-06-06
### Updated
- Improve mac address regex

## [1.1.0] - 2020-09-04
### Updated
- Updated username regex

## [1.0.7] - 2020-07-03
### Added
- Added Ruby 2.7 support

## [1.0.6] - 2019-09-18
### Added
- Added true and false only checks to boolean validator

## [1.0.5] - 2019-08-09
### Added
- Added length check to Url validator

## [1.0.4] - 2019-08-09
### Added
- Added more boolean value checks

## [1.0.3] - 2019-07-08
### Added
- Require rails/railtie in railtie

## [1.0.2] - 2019-07-01
### Added
- Add railtie

## [1.0.1] - 2019-07-01
### Added
- Add EIN validator
- Add port section to docs

### Changed
- Remove duplicate 0 from isbn characters constant

## [1.0.0] - 2019-06-29
### Added
- Initial project version
