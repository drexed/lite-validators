## AlphaNumeric

#### Rules

```ruby
'any_with_space'      => /^[A-Za-z0-9 ]+$/
'any_without_space'   => /^[A-Za-z0-9]+$/
'lower_with_space'    => /^[a-z0-9 ]+$/
'lower_without_space' => /^[a-z0-9]+$/
'upper_with_space'    => /^[A-Z0-9 ]+$/
'upper_without_space' => /^[A-Z0-9]+$/
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
case | symbol | any, lower, upper | any
allow_space | boolean | true, false | false

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_1, alpha_numeric: true
  validates :input_2, alpha_numeric: { case: :lower, allow_space: true }

end
```
