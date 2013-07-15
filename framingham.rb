#!/usr/bin/ruby
require 'framingham/version.rb'
load 'framingham/heartdisease.rb'
load 'framingham/diabetes.rb'

module Framingham extend self

def help
  "Framingham display help info..."
end

protected

def to_i value
  (value.eql? true or value.to_s == "true" or (
    value.to_f != 0 if value.respond_to? 'to_f'
  )) ? 1 : 0
end

end

