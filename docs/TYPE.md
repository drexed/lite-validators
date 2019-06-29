# Type

#### Rules

```ruby
# 1. Pattern
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
is | class | |
not | boolean | true, false | false

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, type: { is: Array }
  validates :input_1, type: { is: Boolean }     #=> Checks both TrueClass and FalseClass
  validates :input_2, type: { is: CustomKlass } #=> Any Class based objects
  validates :input_3, type: { is: [Array, Hash] }
  validates :input_4, type: { is: Integer, not: true }

end
```
