## Username

#### Rules

```ruby
/^[a-z0-9_-]{1,255}$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, username: true

end
```
