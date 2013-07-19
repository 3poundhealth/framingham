require 'test/unit'
require './framingham'

class DiabetesTests < Test::Unit::TestCase
include Framingham::Diabetes

def yellow _
  "\e[1;7;41;33mFailed:\e[1;3;40m " + _ + " \e[0m"
end

def test_normal
  assert_equal 0.004001804744896386, eval, (yellow "Normal test")
end

end

