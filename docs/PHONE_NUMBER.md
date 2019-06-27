## Phone Number

#### Rules

```ruby
/^[0-9+\(\)#\.\s\/ext-]+$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, phone_number: true

end
```
