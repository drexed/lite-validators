# SEDOL

#### Rules

```ruby
# 1. Pattern
/^([A-Z0-9]{6})(\d{1})$/

# 2. Checksum
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, sedol: true

end
```
