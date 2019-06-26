# Email

#### Rules

```ruby
/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
domain | string, array | | all

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_1, email: true
  validates :input_2, email: { domain: 'com' }
  validates :input_3, email: { domain: %w[com org] }

end
```
