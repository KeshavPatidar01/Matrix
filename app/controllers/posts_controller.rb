require 'httparty'
require 'json'

class PostsController < ApplicationController
before_action :set_topic, only: %i[new create send_code]
before_action :set_post, only: %i[show edit update destroy send_code]
  GEMINI_API_KEY = ENV['GEMINI_API_KEY']

  before_action :set_topic, only: %i[new show send_code]
  before_action :set_post, only: %i[show edit update destroy send_code]
  before_action :only_admin, only: %i[edit update destroy show]

  def index
    @posts = Post.all
  end

 
  def show
  @topic = @post.topic

  @next_post = @post.topic.posts
                    .where("created_at > ?", @post.created_at)
                    .order(:created_at)
                    .first

  if @next_post.nil?
    @next_topic = Topic.where("id > ?", @post.topic_id).order(:id).first
  end
end

  def new
    @post = @topic.posts.new
  end

  def create
    @topic = Topic.friendly.find(post_params[:topic_id])
    @post = @topic.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def send_code
    user_prompt = params[:prompt]
    
    # Question aur Answer dono context mein bhej rahe hain
    post_context = "Problem: #{@post.post_title}\nSolution/Description: #{@post.post_description}"

    # Hard Prompt: Rules for the AI (Mentor Style)
    hard_prompt = "You are a DSA Mentor. 
    Rule 1: Agar user galat DSA logic ya code likhe, toh use FULL ANSWER mat dena. Sirf approach aur way (rasta) samjhana.
    Rule 2: Agar user sahi solution likhe, toh hamesha satisfaction emoji (😊, ✅, 🔥) ke saath reply karna.
    Rule 3: Hinglish mein baat karna."

    # Gemini API Call
    response = HTTParty.post(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=#{GEMINI_API_KEY}",
      headers: { "Content-Type" => "application/json" },
      body: {
        contents: [{
          parts: [{ text: "#{hard_prompt}\n\nContext:\n#{post_context}\n\nUser Question:\n#{user_prompt}" }]
        }]
      }.to_json
    )

    # Gemini response handle karna
    ai_response = response.parsed_response.dig("candidates", 0, "content", "parts", 0, "text") || "Error connecting to Gemini."

    render json: { generated_code: ai_response }
  end

  private

  def only_admin
  end

   def set_topic
    return unless params[:topic_id]   # ✅ safety

    @topic = Topic.friendly.find(params[:topic_id])
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :post_title,
      :video_url,
      :topic_id,
      :post_description,
      images: []
    )
  end
end