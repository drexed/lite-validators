# HEX

#### Rules

```ruby
# 1. Pattern
/^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, hex: true

end
```
