# Username

#### Rules

```ruby
# 1. Pattern
/^[A-Za-z0-9._-]{1,255}$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, username: true

end
```
