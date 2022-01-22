class InstructorMailer < ActionMailer::Base
  include GriffinMarkdown

  layout 'email'

  #default from: 'chancellor@gneuniversity.org', css: 'email'
  default from: 'gnew_uni@malagentia.eastkingdom.org', css: 'email'

  #
  # Send mail to an instructor, with optional replacable tags for certain
  # functions.
  #
  def send_message(user, subject)
    @user = user
    ids = Instructable.where(user_id: @user.id, schedule: 'GNE University').pluck(:id)
    @instances = Instance.where(instructable_id: ids).includes(:instructable).order(:start_time)
    @name = @user.titled_sca_name

    #headers 'return-path' => 'chancellor@gneuniversity.org'
    headers 'return-path' => 'gnew_uni@malagentia.eastkingdom.org'

    mail(to: user.email, subject: "GNE University: #{subject}")
  end
end
