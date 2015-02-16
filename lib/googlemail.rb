module GoogleMail
  module_function
  require 'gmail'

  def initialize
    Gmail.new(EnvConfig["gmail_username"], EnvConfig["gmail_password"])
  end

  def delete_all_emails
    gmail = initialize
    gmail.inbox.emails.each do |email|
      email.delete!
    end
    gmail.logout
  end

  def get_last_unread_mail
    gmail = initialize
    if gmail.inbox.count(:unread) == 0
      puts 'No new email was found'
    else
      index = gmail.inbox.emails.count
      lastmail = index-1
      mailtext = gmail.inbox.emails[lastmail].message.body.to_s
    end
    gmail.logout
  end

  def get_last_mail_text_with_subject(subject)
    gmail = initialize

  end
end