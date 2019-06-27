## Base64

#### Rules

```ruby
/^(?:[A-Za-z0-9+$]{4})*(?:[A-Za-z0-9+$]{2}==|[A-Za-z0-9+$]{3}=|[A-Za-z0-9+$]{4})$/
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, base64: true

end
```
