# Coordinate

#### Rules

The rules are for length and prefixes are dynamic based on the provider
[view list](https://github.com/drexed/lite-validators/blob/master/lib/lite/validators/credit_card_validator.rb).

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
provider | symbol | [view here](https://github.com/drexed/lite-validators/blob/master/lib/lite/validators/credit_card_validator.rb) | all

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, credit_card: true
  validates :input_1, credit_card: { provider: :visa }

end
```
