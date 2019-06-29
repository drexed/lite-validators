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

  validates :input_0, type: { is: Array }
  validates :input_1, type: { is: Boolean }         #=> Checks both TrueClass and FalseClass
  validates :input_2, type: { is: [Array, Hash] }
  validates :input_3, type: { is_not: CustomKlass } #=> Any Class based objects
  validates :input_4, type: { is_not: Integer }

end
```
