if ["production", "development"].include?(Rails.env)
  ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
else
  ActionMailer::Base.delivery_method = :test
end

ActionMailer::Base.smtp_settings = {
    :address              => "mail.gandi.net",
    :port                 => 587,
    :domain               => "stasisleak.org",
    :user_name            => MultaArcana::secret_for(:smtp_username),
    :password             => MultaArcana::secret_for(:smtp_password),
    :authentication       => "plain",
    :enable_starttls_auto =>  true,
    :openssl_verify_mode  => 'none',
}

