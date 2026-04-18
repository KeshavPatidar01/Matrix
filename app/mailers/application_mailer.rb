class ApplicationMailer < ActionMailer::Base
mail(to: user.email, from: "fearlessgaming9876@gmail.com", subject: "Welcome!")
end
