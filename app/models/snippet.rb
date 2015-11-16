class Snippet < ActiveRecord::Base

  def run
    eval(self.code)
  end

end
