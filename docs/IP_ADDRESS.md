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
include_address | array, string, symbol | |
exclude_address | array, string, symbol | |

#### Usage

```ruby
class User < ActiveRecord::Base

  validates :input0, ip_address: true
  validates :input1, ip_address: { protocol: :ipv4 }
  validates :input2, ip_address: { include_address: ['0.0.0.0', '99.39.240.31'] }
  validates :input3, ip_address: { exclude_address: ['0.0.0.0', '99.39.240.31'] }

end
```
