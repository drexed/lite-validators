# Compare

#### Rules

```ruby
# 1. Check
:less_than                => '<'
:less_than_or_equal_to    => '<='
:greater_than             => '>'
:greater_than_or_equal_to => '>='
:equal_to                 => '=='
:not_equal_to             => '!='
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
check | symbol | less_than, less_than_or_equal_to, greater_than, greater_than_or_equal_to, equal_to, not_equal_to | equal_to
to | symbol | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, equality: { to: :input1, check: :less_than }

end
```
