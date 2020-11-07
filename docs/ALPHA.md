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

  validates :input0, alpha: true
  validates :input1, alpha: { case: :lower }
  validates :input2, alpha: { allow_space: true }

end
```
