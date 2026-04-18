class TopicsController < ApplicationController
# before_action :only_admin, only: %i[create]

    def index 
        @topics = Topic.all
    end  

    def new 
        @topic = Topic.new 
    end 

    def create 

        @topic = Topic.create(topic_params) 
    end 


    def complete
  @topic = Topic.friendly.find(params[:id])
  current_user.user_topic_progresses.find_or_create_by(topic: @topic).update(completed: true)
  redirect_to pages_home_path, notice: "Topic completed!"
end
    def show 
        @topic = Topic.friendly.find(params[:id])
        @posts = @topic.posts.all
         render layout: false if turbo_frame_request?
    end 


    private 

    def only_admin

      if user_signed_in?  && current_user.email != Rails.application.credentials.email
        redirect_to root_path , notice: ["You Are Not a Eligible Person to Done This Action"]
      elsif !user_signed_in? 
        redirect_to root_path
    end 
end 

    def topic_params 
        params.require(:topic).permit(:title , :description)
    end 
end
