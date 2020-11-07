# Phone number

#### Rules

```ruby
# 1. Pattern
/^[0-9+\(\)#\.\s\/ext-]+$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, phone_number: true

end
```
