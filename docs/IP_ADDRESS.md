# IP address

#### Rules

```ruby
# 1. Pattern
:ipv4 => Resolv::IPv4::Regex
:ipv6 => Resolv::IPv6::Regex
```

#### Options

Option | Type | Available | Default
--- | --- | --- | ---
protocol | symbol | any, ipv4, ipv6 | any

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, ip_address: true
  validates :input1, ip_address: { protocol: :ipv4 }

end
```
