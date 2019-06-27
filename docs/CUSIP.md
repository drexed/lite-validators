## CUSIP

#### Rules

```ruby
/^[0-9A-Z]{9}$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, cusip: true

end
```
