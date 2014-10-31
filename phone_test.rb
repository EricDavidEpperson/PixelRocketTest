require 'minitest/autorun'
require_relative 'phone'

class PhoneTest < MiniTest::Unit::TestCase

  def test_cleans_number
    number = Phone.new("(123) 456-7890").number
    assert_equal "1234567890", number
  end

  def test_cleans_number_with_dots
    number = Phone.new("123.456.7890").number
    assert_equal "1234567890", number
  end

  def test_valid_when_11_digits_and_first_is_1
    number = Phone.new("11234567890").number
    assert_equal "1234567890", number
  end

  def test_invalid_when_11_digits
    number = Phone.new("21234567890").number
    assert_equal "0000000000", number
  end

  def test_invalid_when_9_digits
    number = Phone.new("123456789").number
    assert_equal "0000000000", number
  end

  def test_area_code
    number = Phone.new("1234567890")
    assert_equal "123", number.area_code
  end

  def test_pretty_print
    number = Phone.new("1234567890")
    assert_equal "(123) 456-7890", number.to_s
  end

  def test_pretty_print_with_full_us_phone_number
    number = Phone.new("11234567890")
    assert_equal "(123) 456-7890", number.to_s
  end

  def test_pretty_print_with_phone_number_too_short
    number = Phone.new("012345678")
    assert_equal "(000) 000-0000", number.to_s
  end

  def test_pretty_print_with_phone_number_too_long
    number = Phone.new("012345678901")
    assert_equal "(000) 000-0000", number.to_s
  end

  def test_pretty_print_with_11_digits_and_first_digit_is_not_1
    number = Phone.new("21234567890")
    assert_equal "(000) 000-0000", number.to_s
  end

  def test_if_input_has_non_number_characters_and_right_number_of_digits
    number =Phone.new("(Abc)1(2#3.45.6-78)*90&").number
    assert_equal "0000000000", number
  end

end
