# Coordinate

#### Rules

The rules are for length and prefixes are dynamic based on the provider
[view list](https://github.com/drexed/lite-validators/blob/master/lib/lite/validators/credit_card_validator.rb).

The Luhn validation rule is the only that is consistent across all checks.

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
provider | symbol | [view here](https://github.com/drexed/lite-validators/blob/master/lib/lite/validators/credit_card_validator.rb) | all

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_1, credit_card: true
  validates :input_2, credit_card: { provider: :visa }

end
```