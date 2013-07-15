module Framingham::Diabetes extend Framingham, self
include Framingham

def eval options = {}
  begin
    #initialize
    options = NORMAL.merge options
    @age = options[:age].to_f
    @blood_pressure = options[:blood_pressure].to_f
    @body_mass_index = options[:body_mass_index].to_f
    @diabetes_relative = options[:diabetes_relative].to_s.to_sym
    @fasting_glucose = options[:fasting_glucose].to_f
    @gender = options[:gender].to_sym
    @HDL = options[:HDL].to_f
    @triglyceride = options[:triglyceride].to_f
  rescue => exception
    abort "\033[31merror: " + exception.message + "\033[0m"
  else
    #calculate
    risk_factor = BETA_ZERO[@gender]
    risk_factor += 0.018 if (50...65).include? @age
    risk_factor += 0.081 if @age >= 65
    risk_factor -= 0.565 if @diabetes_relative.eql? :true
    risk_factor -= 0.301 if (25...30).include? @body_mass_index
    risk_factor -= 0.920 if @body_mass_index >= 30
    risk_factor -= 0.498 if @blood_pressure > 130
    risk_factor -= 0.944 if @gender.eql? :female and @HDL < 50 or @HDL < 40
    risk_factor -= 0.575 if @triglyceride >= 150
    risk_factor -= 1.980 if (100..126).include? @fasting_glucose
    1 / (1 + Math.exp(risk_factor))
  end
end

def help
  "Evaluate 8 year diabetes risk"
end

protected

$, = ", " #default join

::NORMAL = { #default options
  age:                      30,
  blood_pressure:           125,
  body_mass_index:          22.5,
  diabetes_relative:        false,
  fasting_glucose:          85,
  gender:                  :female,
  triglyceride:             130
} unless defined? ::NORMAL

::GENDERS = [
  :male,
  :female
] unless defined? ::GENDERS

#::ERRORS = {
#  age:              "age must be in range: " + AGE_RANGE.to_s,
#  blood_pressure:   "blood pressure must be in range: " + BLOOD_PRESSURE_RANGE.to_s,
#  bmi:              "bmi must be in range: " + BMI_RANGE.to_s,
#  gender:           "invalid gender, options: " + GENDERS.join,
#} unless defined? ::ERRORS

::BETA_ZERO = {
  male:   5.517+0.010,
  female: 5.517
} unless defined? ::BETA_ZERO

end

