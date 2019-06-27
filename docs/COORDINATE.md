# Coordinate

#### Rules

```ruby
'pair'      => [-90.0..90.0, -180.0..180.0]
'latitude'  => -90.0..90.0
'longitude' => -180.0..180.0
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
boundary | symbol | pair, latitude, longitude | pair

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input_0, coordinate: true
  validates :input_1, coordinate: { boundary: :latitude }

end
```
