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

  validates :input_0, email: true
  validates :input_1, email: { domain: 'com' }
  validates :input_2, email: { domain: %w[com org] }

end
```
