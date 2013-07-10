# Framingham

Ruby gem to implement Framingham Heart Study calculators  
http://www.framinghamheartstudy.org

## Installation

Add this line to your application's Gemfile:

    gem 'framingham'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install framingham

# Module: Framingham::Heartdisease#
        `Defined in: framingham/heartdisease.rb`

## Usage

---
### Public Class Methods ###
![](http://ruby-doc.org/images/brick.png) ::eval(options) → Float or Error String

        Evaluates Framingham::Heartdisease score
  
###   Parameters ###

options(<code>Hash&lt;<span style="color:purple">​Symbol</span>, <span style="color:cadetblue">Object</span>&gt;</span></code>) (defaults to: `{}`) — initial context configuration

```ruby
age:                      30..74  
blood_pressure:           90..200  
blood_pressure_treatment: true | false  
body_mass_index:          15..50  
diabetes:                 true | false  
gender:                   :male | :female  
smoker:                   true | false  
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
