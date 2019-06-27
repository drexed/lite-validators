## Name

#### Rules

```ruby
/^([A-Za-z'"-]+\s+){1,4}[A-Za-z'"-]*\z/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, name: true

end
```
