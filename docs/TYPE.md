# Type

#### Rules

```ruby
# 1. Check
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
is | class | |
is_not | class | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, type: { is: Array }
  validates :input1, type: { is: Boolean }         #=> Checks both TrueClass and FalseClass
  validates :input2, type: { is: [Array, Hash] }
  validates :input3, type: { is_not: CustomKlass } #=> Any Class based objects
  validates :input4, type: { is_not: Integer }

end
```
