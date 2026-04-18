class Question < ApplicationRecord
  include Chunkable
  has_rich_text :question_description

  has_many :chunks, as: :chunkable, dependent: :destroy


  def chunkable_s
    question_title
  end
end
