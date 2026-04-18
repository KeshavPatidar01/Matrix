class PagesController < ApplicationController
    before_action :authenticate_user!, except: %i[landing]


  def landing
  end

  def home
    @topics = Topic.all
  end

  def brain
  end

  def language
  end
  def questions
    if params[:q].present?
    @user_query = Question.search(params[:q])
    nil
    end
  end


  def roadmap
  end
  def privacy
  end

  def pricing
  end
end
