# Email

#### Rules

```ruby
# 1. Pattern
/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
domain | array, string, symbol | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, email: true
  validates :input1, email: { domain: 'com' }
  validates :input2, email: { domain: %w[com org] }

end
```
