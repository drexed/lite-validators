# MAC address

#### Rules

```ruby
# 1. Pattern
'2/5/2' => /^([\h]{2}[-|\.:|\s]){5}[\h]{2}?$/i
'4/2/4' => /^([\h]{4}[-|\.:|\s]){2}[\h]{4}?$/i
'6/6'   => /^([\h]{6}[-|\.:|\s])[\h]{6}?$/i
'12'    => /^[\h]{12}?$/i
```

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, mac_address: true

end
```
