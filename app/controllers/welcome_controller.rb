class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :index 

  def index
  end

  def dashboard
  end

  def protected 
  end

  def calendar 
  end

end
