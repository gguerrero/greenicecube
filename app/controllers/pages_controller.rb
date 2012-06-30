class PagesController < ApplicationController
  def home
    @title = I18n.t 'title.home'
  end

  def about
    @title = I18n.t 'title.about'
  end

  def contact
    @title = I18n.t 'title.contact'
  end
end
