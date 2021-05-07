# frozen_string_literal: true

class CreditCardValidator < BaseValidator

  # NOTE: https://en.wikipedia.org/wiki/Payment_card_value#Issuer_identification_value_.28IIN.29

  PROVIDERS = {
    american_express: {
      sizes: [15],
      prefixes: [34, 37]
    },
    dankort: {
      sizes: [16],
      prefixes: [4571, 5019]
    },
    diners_club: {
      sizes: (14..19),
      prefixes: [36, (38..39), (54..55), (300..305), 3095]
    },
    discover: {
      sizes: (16..19),
      prefixes: [(64..65), 6011, (622_126..622_925), (624_000..626_999), (628_200..628_899)]
    },
    interpayment: {
      sizes: (16..19),
      prefixes: [636]
    },
    rupay: {
      sizes: [16],
      prefixes: [60, (6521..6522)]
    },
    jcb: {
      sizes: (16..19),
      prefixes: [(3528..3589)]
    },
    maestro: {
      sizes: (12..19),
      prefixes: [50, (56..69)]
    },
    maestro_uk: {
      sizes: (12..19),
      prefixes: [6759, 676_770, 676_774]
    },
    mastercard: {
      sizes: [16],
      prefixes: [(51..55), (2221..2720)]
    },
    mir: {
      sizes: [16],
      prefixes: [(2200..2204)]
    },
    nps_pridnestrovie: {
      sizes: [16],
      prefixes: [(6_054_740..6_054_744)]
    },
    troy: {
      sizes: [16],
      prefixes: [(979_200..979_289)]
    },
    uatp: {
      sizes: [16],
      prefixes: [1]
    },
    unionpay: {
      sizes: (16..19),
      prefixes: [62]
    },
    verve: {
      sizes: [16, 19],
      prefixes: [(506_099..506_198), (650_002..650_027)]
    },
    visa: {
      sizes: [16],
      prefixes: [4]
    }
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_provider!
    super
  end

  private

  def assert_valid_provider!
    assert_valid_option!(:provider, PROVIDERS.keys.push(:all))
  end

  def checksum(value)
    values = digits(value).reverse.map.with_index { |n, i| i.even? ? n * 2 : n }
    total = values.reverse.inject(0) { |a, b| a + digits(b).sum }
    checksum = 10 - (total % 10)
    checksum == 10 ? 0 : checksum
  end

  def digits(value)
    value.to_s.chars.map(&:to_i)
  end

  def encompasses?(subject, value)
    case subject
    when Array then subject.include?(value)
    when Range then subject.cover?(value)
    else subject == value
    end
  end

  def prefix(subject, value)
    nums = case subject
           when Array, Range then subject.first
           else subject
           end

    value.to_s[0..(nums.to_s.size - 1)].to_i
  end

  def provider
    options[:provider] || :all
  end

  def valid_attr?
    valid_size?(value) && valid_prefix?(value) && valid_checksum?
  end

  def valid_checksum?
    nums = digits(value)
    nums.pop == checksum(nums.join)
  end

  def valid_prefix?(value)
    prefixes = PROVIDERS.dig(provider, :prefixes) || PROVIDERS.flat_map { |_, h| h[:prefixes] }

    prefixes.any? do |subject|
      iin = prefix(subject, value)
      encompasses?(subject, iin)
    end
  end

  def valid_size?(value)
    sizes = PROVIDERS.dig(provider, :sizes) || (12..19)
    encompasses?(sizes, value.to_s.size)
  end

end
