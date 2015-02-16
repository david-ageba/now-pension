module Utility
  module_function

  def get_random_string(length)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    string = ''
    length.times { string << chars[rand(chars.size)] }
    string
  end

end