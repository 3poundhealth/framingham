module Framingham::Heartdisease extend self

def eval options = {}
  begin
    #initialize
    options = NORMAL.merge options
    @age = options[:age]
    @blood_pressure = options[:blood_pressure]
    @blood_pressure_treatment = options[:blood_pressure_treatment] ? :treated : :untreated
    @body_mass_index = options[:body_mass_index]
    @gender = options[:gender]
    @diabetes = to_i options[:diabetes]
    @smoker = to_i options[:smoker]
  rescue => exception
    abort "\033[31merror: " + exception.message + "\033[0m"
  else
    #calculate
    start_beta = BETA_ZERO[@gender] + Math.log(@age) * AGE[@gender]
    risk = 1 - POWER_BASE[@gender] ** Math.exp(
      start_beta +
      Math.log(@blood_pressure) * BLOOD_PRESSURE[@gender][@blood_pressure_treatment] +
      Math.log(@body_mass_index) * BODY_MASS_INDEX[@gender] +
      @diabetes * DIABETES[@gender] +
      @smoker * SMOKER[@gender]
    )
    normal = 1 - POWER_BASE[@gender] ** Math.exp(
      start_beta +
      Math.log(NORMAL[:blood_pressure]) * BLOOD_PRESSURE[@gender][:untreated] +
      Math.log(NORMAL[:body_mass_index]) * BODY_MASS_INDEX[@gender]
    )
    optimal = 1 - POWER_BASE[@gender] ** Math.exp(
      start_beta +
      Math.log(OPTIMAL[:blood_pressure]) * BLOOD_PRESSURE[@gender][:untreated] +
      Math.log(OPTIMAL[:body_mass_index]) * BODY_MASS_INDEX[@gender]
    )
    {
      heart_age: options[:age],
      risk: "%.1f" % (100 * risk),
      normal: "%.1f" % (normal * 100),
      optimal: "%.1f" % (optimal * 100)
    }
  end
end

def help
  "Evaluate 10 year heart disease risk"
end

protected

$, = ", " #default join

NORMAL = { #default options
  age:                      30,
  blood_pressure:           125,
  blood_pressure_treatment: false,
  body_mass_index:          22.5,
  diabetes:                 false,
  gender:                  :female,
  smoker:                   false
} unless defined? NORMAL

OPTIMAL = NORMAL.merge({
  blood_pressure:           110,
  body_mass_index:          22
}) unless defined? OPTIMAL

AGE_RANGE = (30..79) unless defined? AGE_RANGE

BLOOD_PRESSURE_RANGE = (90..200) unless defined? BLOOD_PRESSURE_RANGE

BMI_RANGE = (15..50) unless defined? BMI_RANGE

GENDERS = [
  :male,
  :female
] unless defined? GENDERS

ERRORS = {
  age:              "age must be in range: " + AGE_RANGE.to_s,
  blood_pressure:   "blood pressure must be in range: " + BLOOD_PRESSURE_RANGE.to_s,
  bmi:              "bmi must be in range: " + BMI_RANGE.to_s,
  gender:           "invalid gender, options: " + GENDERS.join,
} unless defined? ERRORS

BETA_ZERO = {
  male:   -23.9388,
  female: -26.0145
} unless defined? BETA_ZERO

POWER_BASE = {
  male:   0.88431,
  female: 0.94833
} unless defined? POWER_BASE

AGE = {
  male:   3.11296,
  female: 2.72107
} unless defined? AGE

BLOOD_PRESSURE = {
  male:{
    treated:   1.92672,
    untreated: 1.85508
  },
  female:{
    treated:   2.88267,
    untreated: 2.81291
  }
} unless defined? BLOOD_PRESSURE

BODY_MASS_INDEX = {
  male:   0.79277,
  female: 0.51125
} unless defined? BODY_MASS_INDEX

DIABETES = {
  male:   0.5316,
  female: 0.77763
} unless defined? DIABETES

SMOKER = {
  male:   0.70953,
  female: 0.61868
} unless defined? SMOKER

end

