# Slug

#### Rules

```ruby
# 1. Pattern
/^[A-Za-z0-9_-]+$/i
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, slug: true

end
```
