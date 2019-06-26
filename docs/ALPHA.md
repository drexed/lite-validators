## Alpha

**Rules:**

```ruby
case:
  any:   A-Za-z
  lower: a-z
  upper: A-Z
```

**Options:**

```ruby
case:         symbol    (default: any)
allow_space:  boolean   (default: false)
message:      string
```

**Usage:**

```ruby
class User < ActiveRecord::Base

  validates :input_1, alpha: true
  validates :input_2, alpha: { case: :lower, allow_space: true }

end
```
