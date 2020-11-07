# Name

#### Rules

```ruby
# 1. Pattern
/^([A-Za-z'"-]+\s+){1,4}[A-Za-z'"-]*\z/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, name: true

end
```
