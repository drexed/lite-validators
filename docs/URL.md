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

  validates :input0, url: true
  validates :input1, url: { domain: [:com, 'org'] }
  validates :input2, url: { scheme: :https }
  validates :input3, url: { include_host: ['example', 'test.org'] }
  validates :input4, url: { exclude_host: ['example', 'test.org'] }
  validates :input5, url: { root_only: true }

end
```
