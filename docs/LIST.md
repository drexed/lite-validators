# List

#### Rules

```ruby
# 1. Check
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
all | array | |
any | array | |
none | array | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, list: { all: %w[monday tuesday] }
  validates :input1, list: { any: %w[saturday sunday] }
  validates :input2, list: { none: %w[wednesday thursday] }
  validates :input3, list: { any: %w[saturday sunday], none: %w[wednesday thursday] }

end
```
