# Password

#### Rules

```ruby
# 1. Pattern
:strong => /\A(?=.{4,255})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x
:weak   => /^[A-Za-z0-9.,<>:;!@#$%^&*?_~-]{1,255}$/
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
strength | symbol | strong, weak | weak

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, password: true
  validates :input1, password: { strength: :strong }

end
```
