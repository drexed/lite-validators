# Alpha

#### Rules

```ruby
# 1. Pattern
:any   => /^[A-Za-z]+$/
:lower => /^[a-z]+$/
:upper => /^[A-Z]+$/
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
case | symbol | any, lower, upper | any
allow_space | boolean | true, false | false

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, alpha: true
  validates :input_1, alpha: { case: :lower }
  validates :input_2, alpha: { allow_space: true }

end
```
