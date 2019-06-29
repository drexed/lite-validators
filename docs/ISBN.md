# ISBN

#### Rules

```ruby
# 1. Length
# 2. Pattern
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, isbn: true

end
```
