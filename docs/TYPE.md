## Type

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, type: { is: Array }
  validates :input_0, type: { is: Boolean }     #=> Checks both TrueClass and FalseClass
  validates :input_0, type: { is: CustomKlass } #=> An class you supply

end
```
