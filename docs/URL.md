## URL

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
domain | symbol, string, array | |
root_only | boolean | true, false | false
scheme | symbol, string, array | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, url: true
  validates :input_0, url: { domain: [:com, 'org'] }
  validates :input_0, url: { scheme: :https }
  validates :input_0, url: { root_only: true }

end
```
