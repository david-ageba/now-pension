module GoogleMail
  module_function
  require 'gmail'
  require 'watir-webdriver/wait'

  def initialize
    Gmail.new(EnvConfig["gmail_username"], EnvConfig["gmail_password"])
  end

  def delete_all_emails
    gmail = initialize
    puts "Jenkins inbox has #{gmail.inbox.count} emails"
    gmail.inbox.emails.each do |email|
      puts "Email from: #{email.from} was deleted"
      email.delete!
    end
    puts "Jenkins inbox now has 0 emails"
    gmail.logout
  end

  def get_last_unread_mail
    gmail = initialize
    mailtext = ''
    if gmail.inbox.count(:unread) == 0
      puts 'No new email was found'
    else
      lastmail = gmail.inbox.emails.count - 1
      mailtext = gmail.inbox.emails[lastmail].message.body.to_s
    end
    gmail.logout
    mailtext
  end

  def get_last_mail_text_with_subject(email_subject)
    gmail = initialize
    if gmail.inbox.emails(:subject => email_subject).count == 0
      sec = 0
      while sec < 60
        gmail = initialize
        if gmail.inbox.emails(:subject => email_subject).count > 0
          break
        else
          sleep 20
          sec += 19
        end
        puts "sec = #{sec}"
      end
      fail('Mail not sent within 60 seconds') if sec > 60
    end
    lastmail = gmail.inbox.emails(:subject => email_subject).count - 1
    lastmail_text = gmail.inbox.emails(:subject => email_subject)[lastmail].message.body.to_s
    gmail.logout
    lastmail_text
  end
end