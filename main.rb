# Sample of how to  use peekyou_api

require 'api.rb'

d = Peekyou.new
d.set_key("YOUR API KEY GOES HERE")
#Frequency is optional 
d.set_frequency(1)

# @param url
# @param type (only JSON or XML)
# the first parameter is your url and second parameter is the format the output will be returned

puts d.get_url("http://twitter.com/michaesafasdfasdlhussey","xml")





