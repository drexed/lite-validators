# File content type

#### Rules

```ruby
# 1. Check
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
include | array, regexp, string, symbol | |
exclude | array, regexp, string, symbol | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, file_content_type: { include: 'text/csv' }
  validates :input_1, file_content_type: { exclude: %w[image/png text/plain] }
  validates :input_2, file_content_type: { include: /^text\/.*/, exclude: 'text/csv' }

end
```
