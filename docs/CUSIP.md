# CUSIP

#### Rules

```ruby
# 1. Pattern
/^[0-9A-Z]{9}$/

# 2. Checksum
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, cusip: true

end
```
