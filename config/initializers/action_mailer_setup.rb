if ["production", "development"].include?(Rails.env)
  ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
  ActionMailer::Base.raise_delivery_errors = true 
  ActionMailer::Base.perform_deliveries = true 

else
  ActionMailer::Base.delivery_method = :test
end

ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => Rails.application.secrets.smtp_username,
    :password             => Rails.application.secrets.smtp_password,
#    :password             => MultaArcana::secret_for(:smtp_password),
    :authentication       => :plain,
    :enable_starttls_auto =>  true,
    :openssl_verify_mode  => 'none',
}

