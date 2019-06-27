## Currency

#### Rules

```ruby
/^\d*+(\.\d{1,2})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, currency: true

end
```
