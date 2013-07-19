require 'test/unit'
require './framingham'

class HeartdiseaseTests < Test::Unit::TestCase
include Framingham::Heartdisease

def yellow _
  "\e[1;7;41;33mFailed:\e[1;3;40m " + _ + " \e[0m"
end

def test_normal
  assert_equal "30  1.1  1.1  0.7", internal_debug, (yellow "Normal test")
end

def test_normal_male
  assert_equal "30  1.8  1.8  1.4", internal_debug({gender: :male}), (yellow "gender: :male test")
end

def test_normal_female
  assert_equal "30  1.1  1.1  0.7", internal_debug({gender: :female}), (yellow "gender: :female test")
end

def test_all_male
  assert_equal "86 99.7 25.8 20.6", internal_debug({
      gender:                  :male,
      age:                      74,
      blood_pressure:           200,
      blood_pressure_treatment: true,
      smoker:                   true,
      diabetes:                 true,
      body_mass_index:          40
    }), (yellow "test all male")
end

def test_all_female
  assert_equal "86 97.6 11.9  8.4", internal_debug({
      gender:                  :female,
      age:                      74,
      blood_pressure:           200,
      blood_pressure_treatment: true,
      smoker:                   true,
      diabetes:                 true,
      body_mass_index:          40
    }), (yellow "test all female")
end

end

