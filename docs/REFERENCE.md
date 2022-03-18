# Reference

#### Rules

```ruby
# 1. Pattern
/\A[+-]?\d+\z/
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
association | symbol | object method | attribute without `_id`
polymorphic | symbol | true, false | false

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_id, reference: true
  validates :output_id, reference: { polymorphic: true }
  validates :output_id, reference: { association: :input }

end
```
