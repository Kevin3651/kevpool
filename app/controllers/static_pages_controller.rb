class StaticPagesController < ApplicationController
before_filter :authenticate_user!, :except => [:home, :help, :contact, :about_us, :legal,]
  def home
  end

  def help
  end

  def contact
  end

  def about_us
  end

  def legal
  end

  def profile
  end
end
