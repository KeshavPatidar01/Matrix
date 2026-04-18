json.extract! question, :id, :question_title, :question_description, :created_at, :updated_at
json.url question_url(question, format: :json)
json.question_description question.question_description.to_s
