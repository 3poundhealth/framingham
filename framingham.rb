#!/usr/bin/ruby
require './framingham/version'

module Framingham extend self

def help
  "Framingham display help info..."
end

protected

$, = ", " #default join

GENDERS = [
  :male,
  :female
] unless defined? GENDERS

def to_i value
  (value.eql? true or value.to_s == "true" or (
    value.to_f != 0 if value.respond_to? 'to_f'
  )) ? 1 : 0
end

load './framingham/heartdisease.rb'
load './framingham/diabetes.rb'

end

