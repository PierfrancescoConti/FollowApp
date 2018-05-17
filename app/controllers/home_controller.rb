class HomeController < ApplicationController
  skip_before_action :authorize
  def Help
  end
end
