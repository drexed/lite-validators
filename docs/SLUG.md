## Slug

#### Rules

```ruby
/^[A-Za-z0-9_-]+$/i
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, slug: true

end
```
