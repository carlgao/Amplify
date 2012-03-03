class JsController < ApplicationController
  layout false # This controller generates only javascript files
  before_filter :js_content_type # set HTTP header information 
 
  def js_content_type
     response.headers['Content-type'] = 'text/javascript; charset=utf-8'
  end
 
  def script1
    @dynamic_message = "hello" # modified
  end
 
  def script2
 
  end
end
