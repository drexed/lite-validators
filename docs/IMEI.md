# IMEI

#### Rules

```ruby
# 1. Pattern
/\A[\d\.\:\-\s]+\z/i

# 2. Checksum
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, imei: true

end
```
