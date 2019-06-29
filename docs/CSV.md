# CSV

#### Rules

```ruby
# 1. Dimension
:columns
:rows

# 2. Check
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
columns | hash | |
rows | hash | |
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

  validates :input_0, csv: { columns: { less_than: 100 } }
  validates :input_1, csv: { rows: { in: (50..100) } }
  validates :input_2, csv: { columns: { equal_to: 5 }, rows: { greater_than: 5 } }

end
```
