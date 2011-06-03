#!/usr/bin/ruby

require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'

#Peekyou class used in a effort for providing ease of use of our
#peekyou api.


class Peekyou
	
  # Function which sets the api_key and put it in the url
  # @param key
	def set_key(key)
		@api_key = key
	end
  # Function to set rate for how frequently user want to check for api status
  # @param freq
	def set_frequency(freq)
		@frequency = freq
	end
   # Function to display your api key
	def display
		puts @api_key
	end
  
  
  #Function to get the status of result returned by the peek_you api
  #@param url 
  #@param type
  #@return If status is 1 then -1 is return implying search is still
  # active on peekyou,otherwise any other status results is returned.
  # I highly recommend to set this function private by adding an 'private' before function
    
    def check_status(url,type)
	    result = open(url).read
      result = result.to_s
      @result = result
   # puts result
      if (result =='')
        return puts "API DOWN FOR MOMENT, TRY AGAIN LATER"
      end
    
	  if (type=="json")
			  m = result.scan(/"status":(.*?),/)
        	  m = m.to_s
      else
			  m = result.scan(/<status>(.*?)<\/status>/)
        	  m = m.to_s
     
      end  
	
  
      if (m == '1')
        return -1
		  else
        return "#{@result}"
	  end
    end
      
      
  
#Function that will pass the the requested url to get the information form peekyou_api
# @param url
# @param type
# Types supported are : JSON,XML
# Possible issues: If you think for some reason the result is not printed , replace 'return result' with 'return puts result' in following function.

  
	def get_url(url,type)
  	
    	type = type.downcase
    	type = type.strip
		flag = 0
    
		if (type !="json" && type !="xml")
			return "Invalid type!!"
		elsif (type == "json" || type == "xml")
			
			flag = 1
      		url = "http://api.peekyou.com/analytics.php?key=#{@api_key}"+"&url="+url+"&output="+type+""
      
     		result = self.check_status(url,type)
      
      		while (result == -1)
         
        	sleep @frequency
        	result = self.check_status(url,type)
      		end 
    	end
    	return result
    end


  
end


