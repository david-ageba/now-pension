module GoogleMail
  require 'gmail'
  module_function

#  @login = Gmail.new(EnvConfig["gmail_username"], EnvConfig["gmail_password"])

  def delete_all_emails
    gmail = @login
    gmail.inbox.emails.each do |email|
      email.delete!
    end
    gmail.logout
  end

  def get_last_unread_mail
    gmail = Gmail.new('kisbeniamin', 'kx247822')
    if gmail.inbox.count(:unread) == 0
      puts 'No new email was found'
    else
      index = gmail.inbox.emails.count
      lastmail = index-1
      mailtext = gmail.inbox.emails[lastmail].message.body.to_s
    end
  end
end