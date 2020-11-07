# UUID

#### Rules

```ruby
# 1. Pattern
:any => /^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$/i
3    => /^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$/i
4    => /^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i
5    => /^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
version | symbol, integer | any, 3, 4, 5 | any

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, uuid: true
  validates :input1, uuid: { version: 3 }

end
```
