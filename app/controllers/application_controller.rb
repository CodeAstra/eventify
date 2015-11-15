class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected
  def parse_time(resource_sym, attr)
    time_params = []
    (1..5).each do |counter|
      time_params.push(params[resource_sym]["#{attr}(#{counter}i)"].to_i)
    end
    DateTime.new(time_params[0], time_params[1], time_params[2], time_params[3], time_params[4])
  end
end
