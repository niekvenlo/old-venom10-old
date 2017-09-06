class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def login_hack
    redirect_to url_for(controller: :sessions, action: :new)
  end
end
