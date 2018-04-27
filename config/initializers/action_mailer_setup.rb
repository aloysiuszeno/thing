if ["production", "development"].include?(Rails.env)
  ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
  ActionMailer::Base.raise_delivery_errors = true 
  ActionMailer::Base.perform_deliveries = true 

else
  ActionMailer::Base.delivery_method = :test
end

ActionMailer::Base.smtp_settings = {
    :address              => "mail.gandi.net",
    :port                 => 587,
    :user_name            => "chancellor@gneuniversity.org",
    :password             => MultaArcana::secret_for(:smtp_password),
    :authentication       => :plain,
    :enable_starttls_auto =>  true,
    :openssl_verify_mode  => 'none',
}

