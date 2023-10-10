class DeviseMailer < Devise::Mailer
    include Devise::Controllers::UrlHelpers # Include Devise URL helpers
    default template_path: 'devise/mailer' # Set the template path
end