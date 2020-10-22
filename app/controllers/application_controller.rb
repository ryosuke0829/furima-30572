class ApplicationController < ActionController::Base

 def index
  @application = Application.all
 end


end
