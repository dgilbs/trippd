# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview

  def trip_email_preview
    ExampleMailer.trip_email(User.find(2))
  end

end
