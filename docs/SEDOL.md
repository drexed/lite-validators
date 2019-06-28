## SEDOL

#### Rules

```ruby
/^([A-Z0-9]{6})(\d{1})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, sedol: true

end
```
