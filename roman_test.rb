# roman_test.rb

require './roman'
require 'test/unit'
class TestRoman < Test::Unit::TestCase
  NUMBERS = [
    [1, "i" ], [2, "ii"], [3, "iii"], 
    [4, "iv"], [5, "v" ], [9, "ix" ]
  ]
  
  def test_simple
    NUMBERS.each do |arabic, roman|
      r = Roman.new(arabic)
      assert_equal(roman, r.to_s)
    end
  end
  
  def test_range
    assert_raise(RuntimeError) { Roman.new(0) }
    assert_nothing_raised      { Roman.new(1) }
    assert_nothing_raised      { Roman.new(499) }
    assert_raise(RuntimeError) { Roman.new(5000) }
  end
end