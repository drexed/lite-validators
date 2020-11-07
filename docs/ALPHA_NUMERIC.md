# Alpha numeric

#### Rules

```ruby
# 1. Pattern
:any   => /^[A-Za-z0-9]+$/
:lower => /^[a-z0-9]+$/
:upper => /^[A-Z0-9]+$/
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
case | symbol | any, lower, upper | any
allow_space | boolean | true, false | false

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, alpha_numeric: true
  validates :input1, alpha_numeric: { case: :lower }
  validates :input2, alpha_numeric: { allow_space: true }

end
```
