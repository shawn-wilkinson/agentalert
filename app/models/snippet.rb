class Snippet < ActiveRecord::Base

  def run
    p 'in Snippet, run method called..'
    eval(self.code)
  end

end
