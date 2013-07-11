require 'test/unit'

class HeartdiseaseTests < Test::Unit::TestCase

def color _
  "\e[1;43;2;3;30m" + _ + "\e[0m"
end

def test_example
  assert false, (color "no bueno!")
end

end

