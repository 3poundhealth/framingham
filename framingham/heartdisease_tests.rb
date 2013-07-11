require 'test/unit'
require './framingham'

class HeartdiseaseTests < Test::Unit::TestCase

def color _
  "\e[1;43;2;3;30m" + _ + "\e[0m"
end

def test_example
  puts (color Framingham::Heartdisease.eval)
  assert false, (color "no bueno!")
end

end

