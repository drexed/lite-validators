# URL

#### Rules

```ruby
# 1. Pattern
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
domain | array, string, symbol | |
root_only | boolean | true, false | false
scheme | array, string, symbol | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, url: true
  validates :input_1, url: { domain: [:com, 'org'] }
  validates :input_2, url: { scheme: :https }
  validates :input_3, url: { root_only: true }

end
```
