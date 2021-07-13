# Name

#### Rules

```ruby
# 1. Pattern
/^([A-Za-z0-9'-]+\s+){1,4}[A-Za-z0-9'-]*\z/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, name: true

end
```
