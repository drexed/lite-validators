## SSN

#### Rules

```ruby
/^\A([\d]{3}\-[\d]{2}\-[\d]{4}|[\d]{9})\Z$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, ssn: true

end
```
