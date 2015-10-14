module Utility
  module_function

  def get_random_string(length)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    string = ''
    length.times { string << chars[rand(chars.size)] }
    string
  end

  def validate_date_format(date_format, date_string)
    begin
      Date.strptime(date_string, date_format)
    rescue ArgumentError
      fail("Incorrect date format. Expected: #{Date.parse(date_string).strftime(date_format)}, Found: #{date_string}")
    end
  end

end