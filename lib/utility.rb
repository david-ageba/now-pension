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
      Date.strptime(date_format, date_string)
    rescue ArgumentError
      fail("String parsing to date format error")
    end
  end

end