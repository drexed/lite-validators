# Currency

#### Rules

```ruby
# 1. Pattern
/^\d*+(\.\d{1,2})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, currency: true

end
```
