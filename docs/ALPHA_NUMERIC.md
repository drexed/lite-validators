## AlphaNumeric

**Rules:**

* Case:
  * any:   `A-Za-z0-9`
  * lower: `a-z0-9`
  * upper: `A-Z0-9`

**Options:**

* `case: type`            (default: any)
* `allow_space: boolean`  (default: false)
* `message: string`

**Usage:**

```ruby
class User < ActiveRecord::Base

  validates :input_1, alpha_numeric: true
  validates :input_2, alpha_numeric: { case: :lower, allow_space: true }

end
```
