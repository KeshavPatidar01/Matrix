class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
          has_many :user_topic_progresses
  has_many :completed_topics, through: :user_topic_progresses, source: :topic
  has_many :notes
end
