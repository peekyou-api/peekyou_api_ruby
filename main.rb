# Sample of how to  use peekyou_api

require 'api.rb'

d = Peekyou.new
#set your key here
d.set_key("YOUR API KEY GOES HERE")
#Frequency is optional 
d.set_frequency(1)

#set your app_id here if you are using consumer audience API
d.set_consumer("YOUR APP ID GOES HERE")
# @param url
# @param type (only JSON or XML)
# the first parameter is your url and second parameter is the format the output will be returned

#calling social audience API
puts d.social_audience_info("http://twitter.com/michaelhussey234234","json")
#calling consumer audience API
puts d.consumer_audience_info("http://twitter.com/joshmackey","xml")





