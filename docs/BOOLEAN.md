# Boolean

#### Rules

```ruby
# 1. Pattern
'true_values'  => [true, 1, '1', 't', 'T', 'true', 'TRUE']
'false values' => [false, 0, '0', 'f', 'F', 'false', 'FALSE']
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
check | symbol | all, false_only, true_only | all

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, boolean: true
  validates :input1, boolean: { check: :true_only }

end
```
