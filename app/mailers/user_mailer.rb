class UserMailer < ActionMailer::Base
  default from: "aracpru@gmail.com"

  def welcome_email(person)
    @person = person
    @url  = 'http://localhost:3000'
    mail(to: @person.email, subject: 'Welcome to My Awesome Site')
  end
end
