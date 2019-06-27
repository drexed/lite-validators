## HEX

#### Rules

```ruby
/^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, hex: true

end
```
