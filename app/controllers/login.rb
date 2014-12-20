class LoginController
  attr_accessor :view

  def initialize (view=nil)
    @view = view
    @repo = Login::Repository.new
  end

  def isUser?
    @repo.check @view
  end

  def delete login
    @repo.delete login
  end


end
