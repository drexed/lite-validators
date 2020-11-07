# File extension

#### Rules

```ruby
# 1. Check
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
include | array, string, symbol | |
exclude | array, string, symbol | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, file_extension: { include: 'csv' }
  validates :input1, file_extension: { exclude: [:png, 'text'] }

end
```
