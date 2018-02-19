class InstructorMailer < ActionMailer::Base
  include GriffinMarkdown

  layout 'email'

  default from: 'aloysious@stasisleak.org', css: 'email'

  #
  # Send mail to an instructor, with optional replacable tags for certain
  # functions.
  #
  def send_message(user, subject)
    @user = user
    ids = Instructable.where(user_id: @user.id, schedule: 'EK University').pluck(:id)
    @instances = Instance.where(instructable_id: ids).includes(:instructable).order(:start_time)
    @name = @user.titled_sca_name

    headers 'return-path' => 'aloysious@stasisleak.org'

    mail(to: user.email, subject: "EK University: #{subject}")
  end
end
