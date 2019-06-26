# Boolean

#### Rules

```ruby
'true_values'   => [true, 1, '1', 't', 'T', 'true', 'TRUE']
'false values'  => [false, 0, '0', 'f', 'F', 'false', 'FALSE']
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input, boolean: true

end
```
