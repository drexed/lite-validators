# File size

#### Rules

```ruby
# 1. Check
:in                       => '==='
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
in | range | |
less_than | numeric | |
less_than_or_equal_to | numeric | |
greater_than | numeric | |
greater_than_or_equal_to | numeric | |
equal_to | numeric | |
not_equal_to | numeric | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, file_size: { less_than: 100 }
  validates :input1, file_size: { greater_than_or_equal_to: 75, less_than: 100 }
  validates :input0, file_size: { in: (50..100) }

end
```
