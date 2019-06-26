## CUSIP

#### Rules

```ruby
/^[0-9A-Z]{9}$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input, cusip: true

end
```
