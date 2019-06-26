# Alpha

## Rules

REGEXP:

```ruby
'any_with_space'      => /^[A-Za-z ]+$/
'any_without_space'   => /^[A-Za-z]+$/
'lower_with_space'    => /^[a-z ]+$/
'lower_without_space' => /^[a-z]+$/
'upper_with_space'    => /^[A-Z ]+$/
'upper_without_space' => /^[A-Z]+$/
```

## Options

Option | Type | Available | Default
--- | --- | --- | ---
case | symbol | any, lower, upper | any
allow_space | boolean | true, false | false

## Usage

```ruby
class User < ActiveRecord::Base

  validates :input_1, alpha: true
  validates :input_2, alpha: { case: :lower, allow_space: true }

end
```
