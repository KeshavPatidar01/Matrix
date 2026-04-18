# config/routes.rb

Rails.application.routes.draw do
  resources :questions
  # Devise routes for user authentication
  devise_for :users
resources :notes


  # Topics Resource
  resources :topics do
    member do
      post :complete
    end
    resources :posts do
      post "send_code", on: :member
    end
  end

  # Top-level posts (यदि आप topics के बिना posts को भी देखना/एक्सेस करना चाहते हैं)
  # यदि आप पूरी तरह से nested structure का उपयोग करते हैं, तो आप इसे हटा भी सकते हैं,
  # लेकिन इसे सुरक्षित रूप से यहाँ छोड़ा जा रहा है यदि यह अन्य actions के लिए उपयोग होता है (जैसे index).
  resources :posts

  # Static pages routes
  get "pages/landing"
  get "pages/home"
  get "pages/privacy"
  get "pages/pricing"
  get "pages/brain"




get "/search",          to: "pages#questions", as: :search
  get "pages/language"
  get "pages/roadmap"

  get "pages/questions"


  # Root route
  root "pages#landing"



  # Health check

  get "up" => "rails/health#show", as: :rails_health_check
end
