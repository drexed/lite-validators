## IMEI

#### Rules

```ruby
/\A[\d\.\:\-\s]+\z/i
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, imei: true

end
```
