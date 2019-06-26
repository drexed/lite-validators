## Currency

#### Rules

```ruby
/^\d*+(\.\d{1,2})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input, currency: true

end
```
