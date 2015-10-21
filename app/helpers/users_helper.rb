module UsersHelper

  def error_message_helper(errors)
    error_hash = errors.messages.reject{|k,v|v==[]}
    attribute = error_hash.first[0].to_s.gsub('_',' ')
    message = error_hash.first[1][0].to_s
    return attribute.capitalize + " " + message + "."
  end
end
