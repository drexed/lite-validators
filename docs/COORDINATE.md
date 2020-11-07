# Coordinate

#### Rules

```ruby
# 1. Pattern
:latitude  => -90.0..90.0             #=> Value must be a number in this range
:longitude => -180.0..180.0           #=> Value must be a number in this range
:pair      => [:latitude, :longitude] #=> Array of corresponding range value
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
boundary | symbol | latitude, longitude, pair | pair

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, coordinate: true
  validates :input1, coordinate: { boundary: :latitude }

end
```
